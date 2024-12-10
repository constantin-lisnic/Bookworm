//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Constantin Lisnic on 10/12/2024.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
