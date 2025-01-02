//
//  URLProtocolMock.swift
//  CatsInfo
//
//  Created by Oleksii Mykhalchuk on 12/30/24.
//

import Foundation
import XCTest

final class URLProtocolMock: URLProtocol {

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    static var handler: ((URLRequest) async throws -> (HTTPURLResponse, Data))?

    override func startLoading() {
        guard let handler = URLProtocolMock.handler else {
            XCTFail()
            return
        }
        Task {
            do {
                
                let (response, data) = try await handler(request)
                
                client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
                client?.urlProtocol(self, didLoad: data)
                client?.urlProtocolDidFinishLoading(self)
                
                
            } catch {
                XCTFail()
            }
        }

    }

    override func stopLoading() {}
}
