//
//  DataModelApp.swift
//  DataModel
//
//  Created by Павел Кунгурцев on 09.02.2024.
//

import SwiftUI
import SwiftData

@main
struct DataModelApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
