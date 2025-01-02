//
//  CatsModel.swift
//  AppCore
//
//  Created by Oleksii Mykhalchuk on 12/28/24.
//

import Foundation

struct CatsModel: Codable, Sendable, Identifiable, Hashable {
    let id: String
    let name: String
}
