//
//  Network.swift
//  AppCore
//
//  Created by Oleksii Mykhalchuk on 12/28/24.
//

import Foundation

protocol Networking {

    init(session: URLSession)

    func fetch() async throws
}

struct Network: Networking {

    private let session: URLSession

    init(session: URLSession) {
        self.session = session
    }

    func fetch() async throws {
        
    }
}
