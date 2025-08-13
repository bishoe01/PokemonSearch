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
        let spec = APIEndpoint(url: "\(BASEURL)/\(query)",
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
                    if let url = result.frontImage {
                        AsyncImage(url: URL(string: url)) { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                    }

                    if let url = result.backImage {
                        AsyncImage(url: URL(string: url)) { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
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
