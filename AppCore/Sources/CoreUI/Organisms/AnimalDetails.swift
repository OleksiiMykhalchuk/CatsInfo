//
//  AnimalDetails.swift
//  AppCore
//
//  Created by Oleksii Mykhalchuk on 12/30/24.
//

import SwiftUI
import CoreModel

public struct AnimalDetails<T: BreedProtocol>: View {
    let breed: T

    public init(breed: T) {
        self.breed = breed
    }

    public var body: some View {
        ScrollView {
            AnimalDetailsCard(
                url: URL(string: "https://cdn2.thecatapi.com/images/\(breed.referenceImageId ?? "").jpg"),
                name: breed.name,
                desription: breed.description
            )
        }
    }
}
