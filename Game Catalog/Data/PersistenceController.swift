//
//  PersistenceController.swift
//  Game Catalog
//
//  Created by Danang Wijaya on 12/09/21.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        return controller
    }()
    init(inMemory: Bool = false){
        container = NSPersistentContainer(name: "FavoriteGame")
        if inMemory {
            container.persistentStoreDescriptions.first?.url =
            URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores{ desc, error in
            if let error = error{
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save(){
        let context = container.viewContext
        if context.hasChanges{
            do{
                try context.save()
            }catch{
                
            }
        }
    }
    
    func checkData(data: GameModel) -> Bool{
        var result = false
        let context = container.viewContext
        let fetchReq = NSFetchRequest<NSFetchRequestResult>.init(entityName: "FavoriteGame")
        fetchReq.predicate = NSPredicate(format: "id = %ld", data.id)
        do{
            let test = try context.fetch(fetchReq)
            if(test.count == 1){
                result = true
            }
        }catch{
            print(error)
        }
        return result
    }
    
    func getData()->[GameModel]{
        var result = [GameModel]()
        let context = container.viewContext
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "FavoriteGame")
        do{
            let get = try context.fetch(fetchReq) as! [FavoriteGame]
            if get.count>0{
                get.forEach{ data in
                    let convert = GameModel(id: Int(data.id), slug: data.slug, name: data.name, released: data.released, tba: data.tba, background_image: data.backgroud_image, rating: data.rating, rating_top: Int(data.rating_top))
                    result.append(convert)
                }
            }
            return result
        }catch{
            print(error)
            return result
        }
    }
    
    func addFavGame(data: GameModel) {
        let game = FavoriteGame(context: container.viewContext)
        game.id = Int32(data.id)
        game.name = data.name
        game.backgroud_image = data.background_image
        game.rating = data.rating
        game.released = data.released
        game.rating_top = Int32(data.rating_top)
        game.slug = game.slug
        game.tba = game.tba
        save()
    }
    
    func removeFavourite(data: GameModel) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "FavoriteGame")
        fetchRequest.predicate =  NSPredicate(format: "id = %ld", data.id)
        if let result = try? container.viewContext.fetch(fetchRequest){
            for object in result{
                container.viewContext.delete(object as! NSManagedObject)
            }
        }
       
    }
    
    
    
    
}
