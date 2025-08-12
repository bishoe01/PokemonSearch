//
//  ContentView.swift
//  c5
//
//  Created by bishoe01 on 8/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var result: String = ""
    // 검색 결과

    func searchAction(_ query: String) async {
        guard let url = URL(string: "\(baseURL)/\(query)") else {
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)

            let item = SearchResultItem(
                id: pokemon.id,
                name: pokemon.name,
                types: pokemon.types.map { $0.type.name },
                frontImage: pokemon.sprites.front_default,
                backImage: pokemon.sprites.back_default
            )
            print(item)
        } catch {
            result = "오류: \(error)"
            print("에러발생")
        }
    }

    var body: some View {
        VStack {
            TextField("이름", text: $searchText)
                .onSubmit {
                    let q = searchText
                    print(q)
                    Task { await searchAction(q) }
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

typealias Parameter = [String: String]

let baseURL = "https://pokeapi.co/api/v2/pokemon"

struct ApiSpec {
    let url: String
    let method: APIMethod
    let term: Parameter
}

enum APIMethod: String {
    case get
    case post
    case put
    case delete
}

struct Pokemon: Decodable {
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
    let back_default: String?
}

struct SearchResultItem: Identifiable {
    var id: Int
    var name: String
    var types: [String]
    var frontImage: String?
    var backImage: String?
}
