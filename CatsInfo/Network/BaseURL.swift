//
//  Untitled.swift
//  CatsInfo
//
//  Created by Oleksii Mykhalchuk on 12/28/24.
//

import Foundation

enum BaseURL: String {
    case cats = "https://api.thecatapi.com/v1"

    var url: URL? {
        switch self {
        case .cats:
            URL(string: rawValue)
        }
    }
}
