//
//  FavoriteGame+CoreDataProperties.swift
//  Game Catalog
//
//  Created by Danang Wijaya on 14/09/21.
//
//

import Foundation
import CoreData


extension FavoriteGame {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteGame> {
        return NSFetchRequest<FavoriteGame>(entityName: "FavoriteGame")
    }

    @NSManaged public var id: Int32
    @NSManaged public var slug: String?
    @NSManaged public var name: String?
    @NSManaged public var released: String?
    @NSManaged public var tba: Bool
    @NSManaged public var backgroud_image: String?
    @NSManaged public var rating: Double
    @NSManaged public var rating_top: Int32

}

extension FavoriteGame : Identifiable {

}
