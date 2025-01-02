
//
//  ImageView.swift
//  AppCore
//
//  Created by Oleksii Mykhalchuk on 12/30/24.
//

import SwiftUI

struct AnimalImageView: View {

    let url: URL?

    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                Image(.catPlaceholder)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay {
                        LoadingView()
                    }
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure:
                Image(.error)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            @unknown default:
                LoadingView()
            }
        }
    }
}

#Preview {
    AnimalImageView(url: URL(string: "https://cdn2.thecatapi.com/images/5AdhMjeEu.jpg"))
}
