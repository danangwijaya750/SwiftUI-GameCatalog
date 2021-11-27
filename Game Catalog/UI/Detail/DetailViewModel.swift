//
//  DetailViewModel.swift
//  Game Catalog
//
//  Created by Danang Wijaya on 14/08/21.
//

import Foundation
class DetailViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var gameDetail : GameDetail? = nil
    @Published var isFav = false
    private let persistenceController = PersistenceController.shared
    func getDetailGame(id: String){
        self.isLoading = true
        ApiManager.getInstance.getDetail(id: id) { data in
            self.gameDetail = data
            self.isLoading = false
        }
    }
    func checkIsFavourite(gameData: GameModel){
        self.isFav=persistenceController.checkData(data: gameData)
    }
    func addFavourite(gameData: GameModel) {
        persistenceController.addFavGame(data: gameData)
        self.isFav=true
    }
    func deleteFavourite(gameData: GameModel) {
        persistenceController.removeFavourite(data: gameData)
        self.isFav=false
    }
}
