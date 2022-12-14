//
//  Model.swift
//  ExitekTask
//
//  Created by Oleksii Mykhalchuk on 8/31/22.
//

import Foundation

struct Movie: CustomStringConvertible, Identifiable {
    var description: String {
        return "\(title) \(year)"
    }
    let id: String
    let title: String
    let year: Int
}
