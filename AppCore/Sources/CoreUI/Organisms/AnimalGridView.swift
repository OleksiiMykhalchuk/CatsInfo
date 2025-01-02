//
//  GridView.swift
//  AppCore
//
//  Created by Oleksii Mykhalchuk on 12/30/24.
//

import SwiftUI
import CoreModel

struct BreedPreview: BreedProtocol {
    var description: String
    var id: String
    var name: String
    var referenceImageId: String?
}

public struct AnimalGridView<T: BreedProtocol>: View {

    let data: [T]
    let onTapGesture: (T) -> Void
    let nextPage: () -> Void

    public init(data: [T], onTapGesture: @escaping (T) -> Void, nextPage: @escaping () -> Void) {
        self.data = data
        self.onTapGesture = onTapGesture
        self.nextPage = nextPage
    }

    public var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem()], spacing: 10) {
                    ForEach(data, id: \.id) { item in
                        AnimalCardView(
                            url: URL(string: "https://cdn2.thecatapi.com/images/\(item.referenceImageId ?? "").jpg"),
                            breed: item.name
                        )
                        .onTapGesture {
                            onTapGesture(item)
                        }
                        .onAppear {
                            if let last = data.last, item == last {
                                nextPage()
                            }
                        }
                    }
                }

        }


    }
}

#Preview {
    AnimalGridView(data: [
        BreedPreview(description: "", id: "1", name: "preview", referenceImageId: "5AdhMjeEu"),
        BreedPreview(description: "", id: "2", name: "preview 2", referenceImageId: "5AdhMjeEu"),
        BreedPreview(description: "", id: "3", name: "preview 3", referenceImageId: "5AdhMjeEu")
    ]) { _ in } nextPage: {}
}
