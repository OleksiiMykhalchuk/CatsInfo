//
//  ImageModel.swift
//  AppCore
//
//  Created by Oleksii Mykhalchuk on 12/29/24.
//

import Foundation

public struct ImageModel: Codable, Hashable, Sendable, Identifiable {
    public let id: String
    public let url: String
    public let breeds: [BreadModel]

    public init(id: String, url: String, breeds: [BreadModel]) {
        self.id = id
        self.url = url
        self.breeds = breeds
    }
}
