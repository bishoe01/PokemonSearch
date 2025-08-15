//
//  SearchViewModel.swift
//  c5
//
//  Created by bishoe01 on 8/13/25.
//

import SwiftUI

@MainActor
class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var result: Pokemon? = nil

    func searchAction(_ query: String) async {
        let spec = APIEndpoint(url: "\(BaseUrl)/\(query)",
                               method: .get)
        guard let url = URL(string: spec.url) else {
            return
        }
        do {
            var request = URLRequest(url: url)
            request.httpMethod = spec.method.rawValue.uppercased()
            let (data, _) = try await URLSession.shared.data(for: request)
            let pokemon = try JSONDecoder().decode(SearchResultItem.self, from: data)

            let item = Pokemon(
                id: pokemon.id,
                name: pokemon.name,
                types: pokemon.types.map { $0.type.name },
                frontImage: pokemon.sprites.front_default,
                backImage: pokemon.sprites.back_default
            )

            result = item
            // print(item)
        } catch {
            print(error.localizedDescription)
        }
    }
}
