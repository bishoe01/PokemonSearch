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
    var frontImage: String?
    var backImage: String?
}

enum PokemonType: String {
    case normal
    case fire
    case water
    case electric
    case grass
    case ice
    case fighting
    case poison
    case ground
    case flying
    case psychic
    case bug
    case rock
    case ghost
    case dragon
    case dark
    case steel
    case fairy

    var color: Color {
        switch self {
        case .normal: return .normal
        case .fire: return .fire
        case .water: return .water
        case .electric: return .electric
        case .grass: return .grass
        case .ice: return .ice
        case .fighting: return .fighting
        case .poison: return .poison
        case .ground: return .ground
        case .flying: return .flying
        case .psychic: return .psychic
        case .bug: return .bug
        case .rock: return .rock
        case .ghost: return .ghost
        case .dragon: return .dragon
        case .dark: return .dark
        case .steel: return .steel
        case .fairy: return .fairy
        }
    }
}
