//
//  CachedAsyncImage.swift
//  AppCore
//
//  Created by Oleksii Mykhalchuk on 12/31/24.
//

import SwiftUI
import Foundation

@MainActor let cache = NSCache<NSString, NSData>()

struct CachedAsyncImage: View {

    @State private var data: Data?
    @State private var error: Error?

    let url: URL?

    var body: some View {
        Group {
            if let data, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
            } else if error != nil {
                Image(.error)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Image(.catPlaceholder)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay {
                        LoadingView()
                    }
            }
        }
        .onAppear {
            Task {
                do {
                    try await getData()
                } catch {
                    self.error = error
                }
            }
        }
    }

    private func getData() async throws {
        guard let url else { return }
        if let dataCache = cache.object(forKey: NSString(string: url.absoluteString)) {
            self.data = Data(dataCache)
        } else {
            let session = URLSession.shared
            let (data, _) = try await session.data(from: url)
            let compressedData = UIImage(data: data)?.jpegData(compressionQuality: 0)
            guard let compressedData else { throw NSError(domain: "cached_async_image", code: -999) }
            self.data = compressedData

            cache.setObject(NSData(data: compressedData), forKey: NSString(string: url.absoluteString))
        }
    }
}

#Preview {
    CachedAsyncImage(url: URL(string: "https://cdn2.thecatapi.com/images/5AdhMjeEu.jpg"))
}
