//
//  SearchView.swift
//  c5
//
//  Created by bishoe01 on 9/2/25.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        VStack(spacing: 20) {
            Text("Search View")
                .font(.title)
                .padding()

            Button("뒤로가기") {
                coordinator.popLast()
            }
        }
    }
}

#Preview {
    SearchView()
        .environmentObject(Coordinator())
}
