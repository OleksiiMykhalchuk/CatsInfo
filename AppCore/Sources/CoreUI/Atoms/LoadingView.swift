//
//  LoadingView.swift
//  AppCore
//
//  Created by Oleksii Mykhalchuk on 12/30/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .scaleEffect(2)
    }
}

#Preview {
    LoadingView()
}
