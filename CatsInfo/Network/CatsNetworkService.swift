//
//  NetworkService.swift
//  CatsInfo
//
//  Created by Oleksii Mykhalchuk on 12/28/24.
//

import CoreNetwork
import Foundation
import CoreModel

protocol AnimalNetworkService {
    func getBreads(page: Int) async throws -> [BreedModel]
    func getImage(id: String) async throws -> ImageModel?
    func getSearch(query: String) async throws -> [BreedModel] 
}

struct CatsNetworkService: AnimalNetworkService {
    private let network: Networking
    private let imageEndPoint = "https://cdn2.thecatapi.com/images/" // + image_id.jpg
    private var defaultHeaders: [String: String] {
        var header: [String: String] = [:]
        header["Content-Type"] = "application/json"
        return header
    }
    private let baseURL: BaseURL = .cats

    init(network: Networking) {
        self.network = network
    }

    func getBreads(page: Int) async throws -> [BreedModel] {
        guard let url = baseURL.url else { return [] }
        let request = Request(
            url: url,
            path: "/breeds",
            method: .get,
            params: [
                URLQueryItem(name: "limit", value: "10"),
                URLQueryItem(name: "page", value: "\(page)")
            ],
            headers: defaultHeaders
        )
        return try await network.fetchArray(request, coder: AppCoder())
    }

    func getImage(id: String) async throws -> ImageModel? {
        guard let url = baseURL.url else { return nil }
        let request = Request(
            url: url,
            path: "/images/\(id)",
            method: .get,
            params: nil,
            headers: defaultHeaders
        )
        return try await network.fetch(request, coder: AppCoder())
    }

    func getSearch(query: String) async throws -> [BreedModel] {
        guard let url = baseURL.url else { return [] }
        let request = Request(
            url: url,
            path: "/breeds/search",
            method: .get,
            params: [
                URLQueryItem(name: "q", value: query),
                URLQueryItem(name: "attach_image", value: "1")
            ],
            headers: defaultHeaders
        )
        return try await network.fetchArray(request, coder: AppCoder())
    }
}
