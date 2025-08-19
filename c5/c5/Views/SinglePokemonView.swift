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
                PokemonImageView(imageUrl: URL(string: pokemon.frontImage))
            }
        }.padding()
    }
}

struct PokemonImageView: View {
    var imageUrl: URL?
    var body: some View {
        if let imageUrl {
            AsyncImage(url: imageUrl) { image in
                image.resizable().aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
        } else {
            Image(systemName: "photo")
        }
    }
}
