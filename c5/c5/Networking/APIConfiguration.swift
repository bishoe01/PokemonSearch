//
//  APIConfiguration.swift
//  c5
//
//  Created by bishoe01 on 8/13/25.
//

enum APIMethod: String {
    case get
    case post
    case put
    case delete
}

struct APIEndPoint {
    static let BaseUrl = "https://pokeapi.co/api/v2/pokemon"

    let url: String
    let method: APIMethod
}
