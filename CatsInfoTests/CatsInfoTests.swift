//
//  CatsInfoTests.swift
//  CatsInfoTests
//
//  Created by Oleksii Mykhalchuk on 12/28/24.
//

import Testing
@testable import CatsInfo
import CoreNetwork

struct CatsInfoTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let service = CatsNetworkService(network: Network(session: .shared))
        let results = try await service.getBreads(page: 0)
        print(results)
    }

    @Test func fetchImage() async throws {
        let service = CatsNetworkService(network: Network(session: .shared))
        let results = try await service.getImage(id: "13MkvUreZ")
        print(results)
    }

}
