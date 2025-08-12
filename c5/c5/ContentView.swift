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
            print(url)
            let (data, _) = try await URLSession.shared.data(from: url)
            result = String(data: data.prefix(200), encoding: .utf8) ?? "텍스트 변환 실패"
            print(result)
        } catch {
            result = "오류: \(error)"
        }
    }

    var body: some View {
        VStack {
            TextField("이름", text: $searchText)
                .onSubmit {
                    let q = searchText
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
