//
//  c5App.swift
//  c5
//
//  Created by bishoe01 on 8/12/25.
//

import SwiftUI

@main
struct c5App: App {
    @StateObject private var coordinator = Coordinator()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                ContentView()
                    .navigationDestination(for: Path.self) { path in
                        switch path {
                        case .searchView:
                            SearchView()
                        }
                    }
            }.environmentObject(coordinator)
        }
    }
}

extension Font {
    static func mainFont(size: CGFloat) -> Font {
        .custom("NeoDunggeunmoPro-Regular", size: size)
    }
}
