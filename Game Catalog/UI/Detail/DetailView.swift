//
//  DetailView.swift
//  Game Catalog
//
//  Created by Danang Wijaya on 14/08/21.
//

import Foundation
import SwiftUI
import URLImage

struct DetailView: View {
    @ObservedObject var viewModel = DetailViewModel()
    let gameData : GameModel
    var body: some View{
        ZStack{
            VStack(alignment:.center){
                URLImage(URL(string: gameData.background_image!)!){image in
                    image.resizable()
                        .frame(width: 200, height: 200)
                }
                
                VStack{
                    HStack{
                        Text(gameData.name ?? "").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Button(action:{
                            if(viewModel.isFav){
                                viewModel.deleteFavourite(gameData:gameData)
                            }else{
                                viewModel.addFavourite(gameData: gameData)
                            }
                        }){
                            if(viewModel.isFav){
                                Image(systemName: "bookmark.fill")
                            }else{
                                Image(systemName: "bookmark")
                            }
                        }.padding()
                    }
                    HStack{
                        Image(systemName: "star.fill")
                        Text(String(gameData.rating))
                    }
                    HStack{
                        Image(systemName: "rosette")
                        Text(String(viewModel.gameDetail?.achievementsCount ?? 0))
                    }
                    Text(viewModel.gameDetail?.released ?? "")
                    Text(viewModel.gameDetail?.website ?? "")
                }
                
            }
           
            ProgressView().isHidden(!viewModel.isLoading)
        }
        .onAppear{
            viewModel.getDetailGame(id: String(gameData.id))
            viewModel.checkIsFavourite(gameData: gameData)
        }
    }
}
