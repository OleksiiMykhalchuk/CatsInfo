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

    init(service: AnimalNetworkService = CatsNetworkService(network: Network(session: .shared))) {
        self.service = service
    }

    func start() async throws {
        try await getBreeds()
    }

    private func getBreeds() async throws {
        let breeds = try await service.getBreads(page: page)
        self.breeds = breeds
    }
}
