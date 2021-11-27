//
//  FavouriteViewModel.swift
//  Game Catalog
//
//  Created by Danang Wijaya on 14/09/21.
//

import Foundation
class FavouriteViewModel: ObservableObject {
    @Published var favGames = [GameModel]()
    private let persistenceController = PersistenceController.shared
    func getFavouriteGames(){
        let data = persistenceController.getData()
        self.favGames.removeAll()
        self.favGames = data
    }
}
