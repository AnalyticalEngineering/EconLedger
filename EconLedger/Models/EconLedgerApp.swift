//
//  EconLedgerApp.swift
//  EconLedger
//
//  Created by J. DeWeese on 11/28/23.
//

import SwiftUI

@main
struct EconLedgerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
