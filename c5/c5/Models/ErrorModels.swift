//
//  ErrorModels.swift
//  c5
//
//  Created by bishoe01 on 8/20/25.
//

enum AudioError: Error {
    case invalidURL
    case conversionFailed
    case playError
}

enum APIError: Error {
    case invalidResponse
    case invalidURL
    case decodingFailed
}
