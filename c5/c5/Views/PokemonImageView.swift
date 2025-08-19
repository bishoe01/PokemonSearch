//
//  PokemonImageView.swift
//  c5
//
//  Created by bishoe01 on 8/19/25.
//

import SwiftUI

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
