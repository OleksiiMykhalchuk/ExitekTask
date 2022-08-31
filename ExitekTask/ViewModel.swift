//
//  ViewModel.swift
//  ExitekTask
//
//  Created by Oleksii Mykhalchuk on 8/31/22.
//

import Foundation

extension ViewController {
    final class ViewModel {
        var movies: [Movie] = []

        func writeData(movie: Movie) {
            movies.insert(movie, at: 0)
        }
        subscript (index: Int) -> Movie {
            return movies[index]
        }
    }
}
