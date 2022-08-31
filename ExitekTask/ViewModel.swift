//
//  ViewModel.swift
//  ExitekTask
//
//  Created by Oleksii Mykhalchuk on 8/31/22.
//

import Foundation

extension ViewController {
    final class ViewModel {
        private var movies: [Movie] = []

        func writeData(title: String, year: Int, completion: () -> Void) {
            let movie = Movie(id: UUID().uuidString, title: title, year: year)
            movies.insert(movie, at: 0)
            completion()
        }
        func getCount() -> Int {
            movies.count
        }
        subscript (index: Int) -> Movie {
            return movies[index]
        }
    }
}
