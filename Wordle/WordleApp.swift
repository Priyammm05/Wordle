//
//  WordleApp.swift
//  Wordle
//
//  Created by Priyam Soni on 22/05/24.
//

import SwiftUI

@main
struct WordleApp: App {
    @StateObject var viewModel = WordleDataModel()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(viewModel)
        }
    }
}

