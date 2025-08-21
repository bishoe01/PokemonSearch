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
                Button {
                    Task {
                        await searchViewModel.searchNeighbors(number: pokemon.id, step: -1)
                    }
                } label: {
                    Image(systemName: "chevron.left").font(.system(size: 50))
                }

                PokemonImage(imageUrl: URL(string: pokemon.frontImage))
                Button {
                    Task {
                        await searchViewModel.searchNeighbors(number: pokemon.id, step: +1)
                    }
                } label: {
                    Image(systemName: "chevron.right").font(.system(size: 50))
                }
            }.padding()

        }.padding()
    }
}
