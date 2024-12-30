//
//  BreadModel.swift
//  AppCore
//
//  Created by Oleksii Mykhalchuk on 12/28/24.
//

import Foundation

public protocol BreedProtocol: Equatable {
    var id: String { get }
    var name: String { get }
    var referenceImageId: String? { get }
    var description: String { get }
}

public struct BreedModel: Codable, Identifiable, Hashable, Sendable, BreedProtocol {
    public let id: String
    public let name: String
    public let referenceImageId: String?
    public let description: String

    public init(id: String, name: String, referenceImageId: String, description: String) {
        self.id = id
        self.name = name
        self.referenceImageId = referenceImageId
        self.description = description
    }

//    enum CodingKeys: String, CodingKey {
//        case id, name, description
//        case referenceImageId = "reference_image_id"
//    }
}
