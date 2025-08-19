//
//  SinglePokemonSearchField.swift
//  c5
//
//  Created by bishoe01 on 8/19/25.
//
import SwiftUI

struct SinglePokemonSearchField: View {
    @Binding var searchText: String
    let onSubmit: () -> Void

    var body: some View {
        TextField("이름", text: $searchText)
            .onSubmit {
                Task { onSubmit() }
            }
            .font(.mainFont(size: 18))
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.normal.opacity(0.4))
            )
            .padding(.horizontal, 40)
    }
}
