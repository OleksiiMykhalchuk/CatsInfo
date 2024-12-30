//
//  Request.swift
//  AppCore
//
//  Created by Oleksii Mykhalchuk on 12/28/24.
//

import Foundation

public struct Request: CustomStringConvertible {
    let url: URL
    let path: String
    let method: HTTPMethod
    let params: [URLQueryItem]?
    let headers: [String: String]?

    private var request: URLRequest?

    public var description: String {
        """
        Method: \(request?.httpMethod ?? "unknown method")
        Headers: \(request?.allHTTPHeaderFields ?? [:])
        url: \(request?.url?.absoluteString ?? "unknown url")
        """
    }

    public init(url: URL, path: String, method: HTTPMethod, params: [URLQueryItem]?, headers: [String : String]?) {
        self.url = url
        self.path = path
        self.method = method
        self.params = params
        self.headers = headers
    }

    mutating func make() -> URLRequest {
        var url = url
        url = url.appending(path: path)
        url = url.appending(queryItems: params ?? [])
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers?.forEach({ element in
            request.addValue(element.value, forHTTPHeaderField: element.key)
        })
        self.request = request
        return request
    }
}
