//
//  Coordinator.swift
//  c5
//
//  Created by bishoe01 on 9/2/25.
//

import Foundation

final class Coordinator: ObservableObject {
    @Published var path: [Path] = []

    func push(_ path: Path) {
        self.path.append(path)
    }

    func popLast() {
        _ = self.path.popLast()
    }

    func removeAll() {
        self.path.removeAll()
    }
}

enum Path: Hashable {
    
    case searchView
}
