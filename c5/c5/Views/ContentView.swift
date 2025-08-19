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
            ScrollView {
                VStack {
                    if let result = vm.result {
                        VStack {
                            Text(result.name)

                            HStack {
                                ForEach(result.types, id: \.self) { type in
                                    PokemonTypeBadge(type: type)
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
    }
}

#Preview {
    ContentView()
}
