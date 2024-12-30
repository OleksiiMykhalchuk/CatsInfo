//
//  ViewModel.swift
//  CatsInfo
//
//  Created by Oleksii Mykhalchuk on 12/28/24.
//

import Foundation
import CoreModel
import CoreNetwork

@MainActor
@Observable
final class ViewModel {

    private let service: AnimalNetworkService

    private var page = 0

    var breeds: [BreedModel] = []
    var isLoading: Bool = false

    private var isInit = false

    var isSearching = false

    init(service: AnimalNetworkService = CatsNetworkService(network: Network(session: .shared))) {
        self.service = service
    }

    func start() async throws {
        guard !isInit else { return }
        isInit = true
        try await getBreeds()
    }

    func getBreeds() async throws {
        guard !isLoading, !isSearching else { return }
        isLoading = true
        let breeds = try await service.getBreads(page: page)
        self.breeds.append(contentsOf: breeds)
        if !breeds.isEmpty {
            page += 1
        }
        isLoading = false
    }

    func search(query: String) async throws {
        guard !isLoading else { return }
        isLoading = true
        page = 0
        let breeds = try await service.getSearch(query: query)
        self.breeds = breeds
        isLoading = false
    }

    func removeBreeds() {
        breeds.removeAll()
    }
}
