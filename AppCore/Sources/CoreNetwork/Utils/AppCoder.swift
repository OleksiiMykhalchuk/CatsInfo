//
//  AppCoder.swift
//  AppCore
//
//  Created by Oleksii Mykhalchuk on 12/28/24.
//

import Foundation

public protocol AppCodable {
    func decodeArray<T: Decodable>(_ data: Data) throws -> [T]
    func decode<T: Decodable>(_ data: Data) throws -> T
}

public struct AppCoder: AppCodable {

    private var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }

    public init() {}

    public func decodeArray<T: Decodable>(_ data: Data) throws -> [T] {
        try decoder.decode([T].self, from: data)
    }

    public func decode<D: Decodable>(_ data: Data) throws -> D {
        try decoder.decode(D.self, from: data)
    }
}
