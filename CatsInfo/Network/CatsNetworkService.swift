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
    func getBreads(page: Int) async throws -> [BreadModel]
    func getImage(id: String) async throws -> ImageModel?
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

    func getBreads(page: Int) async throws -> [BreadModel] {
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
        return try await network.fetch(request, coder: AppCoder())
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
}
