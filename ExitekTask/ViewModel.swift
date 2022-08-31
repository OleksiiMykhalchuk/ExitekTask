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
        private var movies: [Movie] = []

        func writeData(title: String, year: Int) {
            let movie = Movie(id: UUID().uuidString, title: title, year: year)
            movies.insert(movie, at: 0)
            didUpdate?()
        }
        func getCount() -> Int {
            movies.count
        }
        subscript (index: Int) -> Movie {
            return movies[index]
        }
    }
}
