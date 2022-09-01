//
//  MovieEntity+CoreDataProperties.swift
//  ExitekTask
//
//  Created by Oleksii Mykhalchuk on 9/1/22.
//
//

import Foundation
import CoreData


extension MovieEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieEntity> {
        return NSFetchRequest<MovieEntity>(entityName: "MovieEntity")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var year: Int16

}

extension MovieEntity : Identifiable {

}
