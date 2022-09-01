//
//  ViewModel.swift
//  ExitekTask
//
//  Created by Oleksii Mykhalchuk on 8/31/22.
//

import Foundation

extension ViewController {
    final class ViewModel {
        var didUpdate: (() -> Void)?
        var didUpdateWithIndex: ((Int) -> Void)?
        var showError: ((String) -> Void)?
        private var movies: [Movie] = []
        private var persistantStorage: Persistable!
        enum DataError: Error, LocalizedError {
            case isExist(String)
            
            var description: String {
                switch self {
                case .isExist(let message):
                    return message
                }
            }
        }
        init(persistantStorage: Persistable) {
            self.persistantStorage = persistantStorage
        }

        func start() {
            persistantStorage.fetchAll { [weak self] result in
                switch result {
                case .success(let movies):
                    self?.movies = movies
                    self?.didUpdate?()
                case .failure(let error):
                    self?.showError?(error.localizedDescription)
                }
            }
        }

        func validateName(_ string: String) -> Bool {
            // check here
            return true
        }

        func validateYear(_ year: Int) -> Bool {
            if year == 0 {
                showError?("Year is not integer!")
                return false
            } else if String(year).count != 4 {
                showError?("Year is invalid. Try again.")
                return false
            } else {
                return true
            }
        }
        func writeData(title: String, year: Int) {
            let movie = Movie(id: UUID().uuidString, title: title, year: year)
            let isExists = movies.contains { $0.title == movie.title && $0.year == movie.year }
            guard !isExists else {
                showError?(DataError.isExist("The Movie exists. Try again.").description)
                return
            }
            persistantStorage.add(movie) { [weak self] result in
                switch result {
                case .success:
                    self?.movies.insert(movie, at: 0)
                    self?.didUpdateWithIndex?(0)
                case .failure(let error):
                    self?.showError?(error.localizedDescription)
                }
            }
        }
        func readData() {
            persistantStorage.fetchAll { [weak self] result in
                switch result {
                case .success(let movies):
                    self?.movies = movies
                case .failure(let error):
                    self?.showError?(error.localizedDescription)
                }
            }
        }

        func getCount() -> Int {
            movies.count
        }

        subscript (index: Int) -> Movie {
            return movies[index]
        }
    }
}
