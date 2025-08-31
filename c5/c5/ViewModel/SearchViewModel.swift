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
    private let repo: APIPokemonProtocol

    init(repo: APIPokemonProtocol = APIPokemonRepository()) {
        self.repo = repo
    }

    func searchAction(_ query: String) async {
        do {
            result = try await repo.searchPokemon(name: query)
        } catch {
            print(error.localizedDescription)
        }
    }

    func searchNeighbors(number: Int, step: StepDirection) async {
        await searchAction(String(number + step.addValue))
    }
}

enum StepDirection {
    case left
    case right

    var addValue: Int {
        switch self {
        case .left:
            return -1
        case .right:
            return +1
        }
    }
}
