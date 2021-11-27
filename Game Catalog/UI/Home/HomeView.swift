//
//  HomeView.swift
//  Game Catalog
//
//  Created by Danang Wijaya on 11/08/21.
//

import Foundation
import SwiftUI
import URLImage
struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State var query = ""
    var body: some View{
        NavigationView{
            ZStack{
                VStack{
                    SearchBar(text: $query) { it in
                        if(!it.isEmpty){
                            viewModel.searchData(query: it)
                        }else{
                            viewModel.getHomeData()
                        }
                    }
                    List(viewModel.gamesData){item in
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
                ProgressView().isHidden(!viewModel.onLoading)
            }.navigationBarTitle("Game")
        }.onAppear{
            viewModel.getHomeData()
        }
    }
}

struct HomeView_Preview:PreviewProvider {
    static var previews: some View{
        HomeView()
    }
}
