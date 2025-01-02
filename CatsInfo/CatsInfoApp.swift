//
//  CatsInfoApp.swift
//  CatsInfo
//
//  Created by Oleksii Mykhalchuk on 12/28/24.
//

import SwiftUI

@main
struct CatsInfoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(path: NavigationPath(), viewModel: ViewModel())
        }
    }
}
