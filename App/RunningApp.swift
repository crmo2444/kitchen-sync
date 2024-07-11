//
//  KitchenSyncApp.swift
//  KitchenSync
//
//  Created by Claire Morgan-Sanders on 6/12/24.
//

import SwiftUI
import Firebase

@main
struct RunningApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
