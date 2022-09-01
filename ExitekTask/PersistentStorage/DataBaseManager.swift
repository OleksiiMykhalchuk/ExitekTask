//
//  Protocol.swift
//  ExitekTask
//
//  Created by Oleksii Mykhalchuk on 8/31/22.
//

import Foundation

protocol Persistable {
    func fetchAll(completion: ((Swift.Result<[Movie], Error>) -> Void))
    func add(_ movie: Movie, completion: ((Swift.Result<Void, Error>) -> Void))
}

class DataBaseManager: Persistable {
    func fetchAll(completion: ((Result<[Movie], Error>) -> Void)) {
        //
    }
    func add(_ movie: Movie, completion: ((Result<Void, Error>) -> Void)) {
        //
    }
}
