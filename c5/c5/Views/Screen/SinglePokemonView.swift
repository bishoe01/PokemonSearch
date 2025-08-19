//
//  SinglePokemonView.swift
//  c5
//
//  Created by bishoe01 on 8/19/25.
//

import SwiftUI

struct SinglePokemonView: View {
    let pokemon: Pokemon
    var body: some View {
        VStack(spacing: 10) {
            Text("#\(String(format: "%03d", pokemon.id))")
                .font(.mainFont(size: 24))
                .foregroundColor(.gray)
                .tracking(2)

            Text(pokemon.name.uppercased())
                .font(.mainFont(size: 32))
                .fontWeight(.bold)

            Button("I") {
                print(pokemon.crySound)
            }
            HStack {
                ForEach(pokemon.types, id: \.self) { type in
                    PokemonTypeBadge(type: type)
                }
            }
            PokemonImage(imageUrl: URL(string: pokemon.frontImage))

        }.padding()
    }
}

#Preview {
    ContentView()
}
