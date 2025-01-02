//
//  ContentView.swift
//  CatsInfo
//
//  Created by Oleksii Mykhalchuk on 12/28/24.
//

import SwiftUI
import CoreUI
import CoreModel

struct ContentView: View {

    @State private var path: NavigationPath
    @State private var viewModel: ViewModel
    @State private var searchText: String = ""

    @Environment(\.dismissSearch) var dismissSearch

    init(path: NavigationPath, viewModel: ViewModel) {
        self._path = State(initialValue: path)
        self._viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack(path: $path) {
            AnimalGridView(data: viewModel.breeds) { breed in
                path.append(breed)
            } nextPage: {
                getBreeds()
            }
            .searchable(text: $searchText)
            .onSubmit(of: .search) {
                Task {
                    do {
                        viewModel.isSearching = true
                        try await viewModel.search(query: searchText)
                    } catch {
                        // handle error
                    }
                }
            }
            .onChange(of: searchText, { oldValue, newValue in
                if newValue.isEmpty {
                    viewModel.isSearching = false
                    viewModel.removeBreeds()
                    getBreeds()
                }
            })
            .navigationTitle("Breeds")
            .navigationDestination(for: BreedModel.self, destination: { breed in
                AnimalDetailsView(breed: breed)
            })
        }
        .onAppear {
            Task {
                do {
                    try await viewModel.start()
                } catch {
                    // handle error
                    viewModel.isLoading = false
                }
            }
        }
    }

    private func getBreeds() {
        Task {
            do {
                try await viewModel.getBreeds()
            } catch {
                // handle error
                print(error)
                viewModel.isLoading = false
            }
        }
    }
}

#Preview {
    ContentView(path: NavigationPath(), viewModel: ViewModel())
}
