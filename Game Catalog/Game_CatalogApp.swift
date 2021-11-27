//
//  Game_CatalogApp.swift
//  Game Catalog
//
//  Created by Danang Wijaya on 11/08/21.
//

import SwiftUI

@main
struct Game_CatalogApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
