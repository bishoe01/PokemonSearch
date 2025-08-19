//
//  PokemonTypeBadge.swift
//  c5
//
//  Created by bishoe01 on 8/18/25.
//

import SwiftUI

struct PokemonTypeBadge: View {
    let type: PokemonType

    var body: some View {
        Text(type.rawValue)
            .font(.mainFont(size: 24))
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(type.color)
            .cornerRadius(16)
    }
}

#Preview {
    HStack {
        PokemonTypeBadge(type: .fire)
        PokemonTypeBadge(type: .flying)
        PokemonTypeBadge(type: .electric)
        PokemonTypeBadge(type: .bug)
    }
}
