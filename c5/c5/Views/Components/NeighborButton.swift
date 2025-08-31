//
//  NeighborButton.swift
//  c5
//
//  Created by bishoe01 on 8/31/25.
//
import SwiftUI

struct NeighborButton: View {
    let direction: StepDirection
    let onPress: () async -> Void

    var body: some View {
        Button {
            Task {
                await onPress()
            }
        } label: {
            Image(systemName: "chevron.\(direction)").font(.system(size: 50))
        }
    }
}
