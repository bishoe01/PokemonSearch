//
//  Pokemon.swift
//  c5
//
//  Created by bishoe01 on 8/13/25.
//

struct SearchResultItem: Decodable {
    let id: Int
    let name: String
    let types: [TypeElement]
    let sprites: Sprites
}

struct TypeElement: Decodable {
    let type: TypeInfo
}

struct TypeInfo: Decodable {
    let name: String
}

struct Sprites: Decodable {
    let front_default: String?
    let front_shiny: String?
}
