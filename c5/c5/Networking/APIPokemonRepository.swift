//
//  APIPokemonRepository.swift
//  c5
//
//  Created by bishoe01 on 8/17/25.
//

import Foundation

protocol APIPokemonProtocol {
    func searchPokemon(name: String) async throws -> Pokemon
}

struct APIPokemonRepository: APIPokemonProtocol {
    func searchPokemon(name: String) async throws -> Pokemon {
        let spec = APIEndPoint(url: "\(APIEndPoint.BaseUrl)/\(name)",
                               method: .get)
        guard let url = URL(string: spec.url) else {
            throw APIError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = spec.method.rawValue.uppercased()
        let (data, _) = try await URLSession.shared.data(for: request)

        let pokemon = try JSONDecoder().decode(SearchResultItem.self, from: data)
        return Pokemon(
            id: pokemon.id,
            name: pokemon.name,
            types: pokemon.types.compactMap { PokemonType(rawValue: $0.type.name) },
            frontImage: pokemon.sprites.front_default,
//            frontShiny: pokemon.sprites.front_shiny
        )
    }
}
