//
//  ContentView.swift
//  c5
//
//  Created by bishoe01 on 8/12/25.
//

import AVFoundation
import SwiftUI

struct ContentView: View {
    @StateObject var vm = SearchViewModel()
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        VStack(spacing: 16) {
            Button("HI") {
                coordinator.push(.searchView)
            }
            Text("POKEMON SEARCH")
                .font(.mainFont(size: 32))
                .padding(.top, 20)

            SinglePokemonSearchField(searchText: $vm.searchText, onSubmit: {
                Task { await vm.searchAction(vm.searchText) }
            })
            if let result = vm.result {
                SinglePokemonView(pokemon: result, searchViewModel: vm)
            }

            Spacer()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Coordinator())
}
