//
//  ContentView.swift
//  c5
//
//  Created by bishoe01 on 8/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var result: Pokemon? = nil

    // 검색 결과

    func searchAction(_ query: String) async {
        guard let url = URL(string: "\(baseURL)/\(query)") else {
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let pokemon = try JSONDecoder().decode(SearchResultItem.self, from: data)

            let item = Pokemon(
                id: pokemon.id,
                name: pokemon.name,
                types: pokemon.types.map { $0.type.name },
                frontImage: pokemon.sprites.front_default,
                backImage: pokemon.sprites.back_default
            )
            result = item
            print(item)
        } catch {
            print(error.localizedDescription)
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
            if let result {
                VStack {
                    Text(result.name)
                    HStack {
                        ForEach(result.types, id: \.self) {
                            type in
                            Text(type)
                                .padding(.horizontal, 8)
                                .background(.blue)
                                .cornerRadius(8)
                        }
                    }

                    AsyncImage(url: URL(string: result.frontImage!)) { image in
                        image.resizable().aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    AsyncImage(url: URL(string: result.backImage!)) { image in
                        image.resizable().aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                }
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

struct APISpec {
    let url: String
    let method: APIMethod
    let term: Parameter
}

enum APIError: Error {
    case invalidResponse
    case decodingFailed
}

enum APIMethod: String {
    case get
    case post
    case put
    case delete
}

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
    let back_default: String?
}

struct Pokemon: Identifiable {
    var id: Int
    var name: String
    var types: [String]
    var frontImage: String?
    var backImage: String?
}
