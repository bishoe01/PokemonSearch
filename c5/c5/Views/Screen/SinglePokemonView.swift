//
//  SinglePokemonView.swift
//  c5
//
//  Created by bishoe01 on 8/19/25.
//

import AVFoundation
import SwiftUI

struct SinglePokemonView: View {
    let pokemon: Pokemon
    @ObservedObject var searchViewModel: SearchViewModel
    @StateObject private var pokemonViewModel = PokemonViewModel()

    var body: some View {
        VStack(spacing: 10) {
            Text("#\(String(format: "%03d", pokemon.id))")
                .font(.mainFont(size: 24))
                .foregroundColor(.gray)
                .tracking(2)

            Text(pokemon.name.uppercased())
                .font(.mainFont(size: 32))
                .fontWeight(.bold)

            Button("울음소리") {
                pokemonViewModel.playSound(crySound: pokemon.crySound)
            }
            HStack {
                ForEach(pokemon.types, id: \.self) { type in
                    PokemonTypeBadge(type: type)
                }
            }
            HStack {
                NeighborButton(direction: .left) {
                    await searchViewModel.searchNeighbors(number: pokemon.id, step: .left)
                }

                PokemonImage(imageUrl: URL(string: pokemon.frontImage))
                NeighborButton(direction: .right) {
                    await searchViewModel.searchNeighbors(number: pokemon.id, step: .right)
                }
            }.padding()

        }.padding()
    }
}



