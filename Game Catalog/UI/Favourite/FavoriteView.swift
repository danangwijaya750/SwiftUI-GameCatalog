//
//  FavoriteView.swift
//  Game Catalog
//
//  Created by Danang Wijaya on 14/09/21.
//

import Foundation
import SwiftUI
import URLImage

struct FavouriteView: View {
    @ObservedObject var viewModel = FavouriteViewModel()
    var body: some View{
        NavigationView{
            ZStack{
                List(viewModel.favGames){item in
                    NavigationLink(
                        destination:DetailView(gameData: item)){
                        HStack{
                            URLImage(URL(string: item.background_image ?? "")!){image in
                                image
                                    .resizable()
                                    .frame(width: 80.0, height: 80.0)
                                    .clipped()
                            }
                            VStack(alignment:.leading){
                                Text(item.name ?? "")
                                    .font(.headline)
                                Text(item.released ?? "")
                                HStack{
                                    Image(systemName: "star.fill")
                                    Text(String(item.rating))
                                }
                            }
                        }
                    }
                    
                }
            }
            .navigationBarTitle("Favourite Games")
        }
        .onAppear{
            viewModel.getFavouriteGames()
        }
    }
}
