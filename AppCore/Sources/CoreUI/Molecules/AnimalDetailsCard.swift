//
//  AnimalDetailsCard.swift
//  AppCore
//
//  Created by Oleksii Mykhalchuk on 12/30/24.
//

import SwiftUI

struct AnimalDetailsCard: View {
    let url: URL?
    let name: String
    let desription: String
    var body: some View {
        VStack {
            CachedAsyncImage(url: url)
            PrimaryLabel(text: name)
            PrimaryLabel(text: desription)
        }
    }
}
