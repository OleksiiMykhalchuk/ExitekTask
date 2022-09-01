//
//  Protocol.swift
//  ExitekTask
//
//  Created by Oleksii Mykhalchuk on 8/31/22.
//

import CoreData

protocol Persistable {
    func fetchAll(completion: ((Swift.Result<[Movie], Error>) -> Void))
    func add(_ movie: Movie, completion: ((Swift.Result<Void, Error>) -> Void))
}

class DataBaseManager: Persistable {

    lazy var managedObjectContext = persistentContainer.viewContext
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ExitekTask")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    func fetchAll(completion: ((Result<[Movie], Error>) -> Void)) {
        let fetchRequest: NSFetchRequest<MovieEntity> = MovieEntity.fetchRequest()
        do {
            let movieEntity = try managedObjectContext.fetch(fetchRequest)
            let movies = movieEntity.map {
                Movie(
                    id: $0.id ?? "",
                    title: $0.title ?? "",
                    year: Int($0.year))
            }
            completion(.success(movies))
        } catch {
            completion(.failure(error))
        }
    }
    func add(_ movie: Movie, completion: ((Result<Void, Error>) -> Void)) {
        let movieEntetity = MovieEntity(context: managedObjectContext)
        movieEntetity.title = movie.title
        movieEntetity.year = Int16(movie.year)
        movieEntetity.id = movie.id
        do {
            try managedObjectContext.save()
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }
}
