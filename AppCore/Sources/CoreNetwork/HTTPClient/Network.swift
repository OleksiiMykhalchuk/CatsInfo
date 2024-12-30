//
//  Network.swift
//  AppCore
//
//  Created by Oleksii Mykhalchuk on 12/28/24.
//

import Foundation

public protocol Networking {

    init(session: URLSession)

    func fetchArray<T: Decodable>(_ request: Request, coder: AppCodable) async throws -> [T]
    func fetch<T: Decodable>(_ request: Request, coder: AppCodable) async throws -> T
}

public struct Network: Networking {

    private let session: URLSession
    private let logger = AppLogger(category: "Networking")

    public init(session: URLSession) {
        self.session = session
    }

    public func fetchArray<T: Decodable>(_ request: Request, coder: AppCodable) async throws -> [T] {

        let data = try await sendRequest(request)
        return try coder.decodeArray(data)
    }

    public func fetch<T: Decodable>(_ request: Request, coder: AppCodable) async throws -> T {
        let data = try await sendRequest(request)
        return try coder.decode(data)
    }

    private func sendRequest(_ request: Request) async throws -> Data {
        var request = request
        let req = request.make()
//        logger.debug("\(request)")
        let (data, response) = try await session.data(for: req)
        let urlResponse = response as? HTTPURLResponse
//        logger.debug("Response: \(response)")
        logger.debug("Data: \(String(data: data, encoding: .utf8) ?? "unknown data")")
        guard let urlResponse , (200 ..< 299).contains(urlResponse.statusCode) else {
            logger.error("Bad Response Status Code: \(urlResponse?.statusCode ?? -999)")
            throw NetworkError.badResponse
        }
        return data
    }
}
