//
//  BreadModel.swift
//  AppCore
//
//  Created by Oleksii Mykhalchuk on 12/28/24.
//

import Foundation

public struct BreadModel: Codable, Identifiable, Hashable, Sendable {
    public let id: String
    public let name: String
    public let referenceImageId: String

    public init(id: String, name: String, referenceImageId: String) {
        self.id = id
        self.name = name
        self.referenceImageId = referenceImageId
    }
}
