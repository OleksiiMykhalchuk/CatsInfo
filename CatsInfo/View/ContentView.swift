//
//  ContentView.swift
//  CatsInfo
//
//  Created by Oleksii Mykhalchuk on 12/28/24.
//

import SwiftUI
import CoreUI

struct ContentView: View {

    @State private var path: NavigationPath
    @State private var viewModel: ViewModel

    init(path: NavigationPath, viewModel: ViewModel) {
        self._path = State(initialValue: path)
        self._viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack(path: $path) {
            AnimalGridView(data: viewModel.breeds) { imageId in
                path.append(imageId)
            }
            .navigationTitle("Breeds")
            .navigationDestination(for: String.self, destination: { name in
                
            })
        }
        .onAppear {
            Task {
                try await viewModel.start()
            }
        }
    }
}

#Preview {
    ContentView(path: NavigationPath(), viewModel: ViewModel())
}
