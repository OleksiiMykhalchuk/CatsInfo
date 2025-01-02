//
//  ViewModelTests.swift
//  CatsInfo
//
//  Created by Oleksii Mykhalchuk on 12/30/24.
//

import Testing
@testable import CatsInfo
import CoreNetwork
import Foundation

struct ViewModelTests {

    private var session: URLSession  {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        let session = URLSession(configuration: config)
        return session
    }

    private let mockData = """
[
    {
        "id": "id",
        "name": "name",
        "reference_image_id": "reference",
        "description": "description"
    }
]
""".data(using: .utf8)!

    private let response = HTTPURLResponse(url: URL(string: "https://mock.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!


    @MainActor @Test func testGoodBreedResponse() async throws {

        let viewModel =  ViewModel(
            service: CatsNetworkService(
                network: Network(
                    session: session
                )
            )
        )

        URLProtocolMock.handler = { request in
            (response, mockData)
        }
        try await viewModel.getBreeds()
        #expect(
            viewModel.breeds.isEmpty != true
        )
    }

    @MainActor @Test func testGoodSearchResponse() async throws {

        let viewModel =  ViewModel(
            service: CatsNetworkService(
                network: Network(
                    session: session
                )
            )
        )

        URLProtocolMock.handler = { request in
            (response, mockData)
        }
        try await viewModel.search(query: "mock")
        #expect(viewModel.breeds.isEmpty != true)
    }
}
