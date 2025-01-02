//
//  AnimalCardView.swift
//  AppCore
//
//  Created by Oleksii Mykhalchuk on 12/30/24.
//

import SwiftUI

struct AnimalCardView: View {

    let url: URL?
    let breed: String

    var body: some View {
        ZStack {
            CachedAsyncImage(url: url)
            PrimaryLabel(text: breed)
        }
    }
}

#Preview {
    AnimalCardView(url: URL(string: "https://cdn2.thecatapi.com/images/5AdhMjeEu.jpg"), breed: "Breed")
}
