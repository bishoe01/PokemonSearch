//
//  ContentView.swift
//  c5
//
//  Created by bishoe01 on 8/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = SearchViewModel()

    var body: some View {
        VStack(spacing: 16) {
            Text("POKEMON SEARCH")
                .font(.mainFont(size: 32))
                .padding(.top, 20)
            SinglePokemonSearchField(searchText: $vm.searchText, onSubmit: {
                Task { await vm.searchAction(vm.searchText) }
            })
            if let result = vm.result {
                SinglePokemonView(pokemon: result)
            }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
