//
//  APIConfiguration.swift
//  c5
//
//  Created by bishoe01 on 8/13/25.
//

let BASEURL = "https://pokeapi.co/api/v2/pokemon"

enum APIMethod: String {
    case get
    case post
    case put
    case delete
}

struct APIEndpoint {
    let url: String
    let method: APIMethod
}

enum APIError: Error {
    case invalidResponse
    case decodingFailed
}
