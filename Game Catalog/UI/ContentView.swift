//
//  ContentView.swift
//  Game Catalog
//
//  Created by Danang Wijaya on 11/08/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            TabView{
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                FavouriteView()
                    .tabItem {
                        Image(systemName: "bookmark.fill")
                        Text("Favourite")
                    }
                AboutView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("About")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
