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
    private let repo: APIPokemonRepository

    // 어디서 요청하는지에 따라 다른 레포지토리를 사용할 수 있게 생성자 주입
    init(repository: APIPokemonRepository = APIPokemonRepository()) {
        self.repo = repository
    }

    func searchAction(_ query: String) async {
        do {
            result = try await repo.searchPokemon(name: query)
        } catch {
            print(error.localizedDescription)
        }
    }
}
