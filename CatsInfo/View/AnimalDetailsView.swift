//
//  AnimalDetailsView.swift
//  CatsInfo
//
//  Created by Oleksii Mykhalchuk on 12/30/24.
//

import SwiftUI
import CoreModel
import CoreUI

struct AnimalDetailsView: View {
    let breed: BreedModel
    var body: some View {
        AnimalDetails(breed: breed)
            .navigationTitle(breed.name)
    }
}
