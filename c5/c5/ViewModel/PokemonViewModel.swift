//
//  PokemonViewModel.swift
//  c5
//
//  Created by bishoe01 on 8/20/25.
//

import AVFoundation
import SwiftUI

@MainActor
class PokemonViewModel: ObservableObject {
    @Published private var audioPlayer: AVAudioPlayer?
    @Published var isPlaying = false

    private let audioManager = PokemonAudioManager()

    func playSound(crySound: String) {
        guard let url = URL(string: crySound) else {
            print(AudioError.invalidURL.localizedDescription)
            return
        }

        Task {
            do {
                isPlaying = true

                let wavURL = try await audioManager.convertOggToWav(url)
                let player = try audioManager.createAudioPlayer(from: wavURL)

                audioPlayer = player
                audioPlayer?.play()

            } catch {
                throw AudioError.playError
            }

            isPlaying = false
        }
    }
}
