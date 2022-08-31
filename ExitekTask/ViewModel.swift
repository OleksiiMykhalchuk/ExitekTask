//
//  ViewModel.swift
//  ExitekTask
//
//  Created by Oleksii Mykhalchuk on 8/31/22.
//

import Foundation

extension ViewController {
    final class ViewModel {
        var movies: [Model] = []

        func writeData(movie: Model) {
            movies.insert(movie, at: 0)
        }
        subscript (index: Int) -> Model {
            return movies[index]
        }
    }
}
