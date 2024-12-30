//
//  ContentView.swift
//  CatsInfo
//
//  Created by Oleksii Mykhalchuk on 12/28/24.
//

import SwiftUI
import CoreNetwork

struct ContentView: View {

    @State private var path: NavigationPath
    @State private var viewModel: ViewModel

    init(path: NavigationPath, viewModel: ViewModel) {
        self._path = State(initialValue: path)
        self._viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 200))]) {
                    ForEach(viewModel.breeds, id: \.id) { breed in
                        Text(breed.name)
                            .onTapGesture {
                                path.append(breed.name)
                            }
                    }
                }
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
