//
//  HomeViewModel.swift
//  Game Catalog
//
//  Created by Danang Wijaya on 11/08/21.
//

import Foundation
import Alamofire

class HomeViewModel : ObservableObject{
    @Published var onLoading = false
    @Published var gamesData = [GameModel]()
    func getHomeData() {
        self.onLoading=true
        ApiManager.getInstance.getGame { data in
            self.gamesData.append(contentsOf: data.results)
            self.onLoading=false
        }
    }
    
    func searchData(query: String){
        self.onLoading=true
        ApiManager.getInstance.searchGame(query: query) { data in
            self.gamesData.removeAll()
            self.gamesData.append(contentsOf: data.results)
            self.onLoading=false
        }
    }
}

