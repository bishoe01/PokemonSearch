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
        VStack {
            VStack {
                Text(pokemon.name)

                HStack {
                    ForEach(pokemon.types, id: \.self) { type in
                        PokemonTypeBadge(type: type)
                    }
                }
                PokemonImage(imageUrl: URL(string: pokemon.frontImage))
            }
        }.padding()
    }
}

