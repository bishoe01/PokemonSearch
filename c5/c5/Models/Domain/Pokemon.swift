//
//  DomainModels.swift
//  c5
//
//  Created by bishoe01 on 8/13/25.
//
import SwiftUI

struct Pokemon: Identifiable {
    var id: Int
    var name: String
    var types: [PokemonType]
    var frontImage: String
//    var frontShiny: String
    var crySound: String
}


