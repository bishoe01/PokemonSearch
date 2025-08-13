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
        VStack {
            TextField("이름", text: $vm.searchText)
                .onSubmit {
                    let q = vm.searchText
                    print(q)
                    Task { await vm.searchAction(q) }
                }
            if let result = vm.result {
                VStack {
                    Text(result.name)

                    HStack {
                        ForEach(result.types, id: \.self) {
                            type in
                            Text(type)
                                .padding(.horizontal, 8)
                                .background(.blue)
                                .cornerRadius(8)
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

#Preview {
    ContentView()
}
