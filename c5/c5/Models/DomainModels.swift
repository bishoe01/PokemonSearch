//
//  DomainModels.swift
//  c5
//
//  Created by bishoe01 on 8/13/25.
//

struct Pokemon: Identifiable {
    var id: Int
    var name: String
    var types: [String]
    var frontImage: String?
    var backImage: String?
}
