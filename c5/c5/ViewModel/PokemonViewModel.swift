//
//  PokemonViewModel.swift
//  c5
//
//  Created by bishoe01 on 8/20/25.
//

import AVFoundation
import OggDecoder
import SwiftUI

@MainActor
class PokemonViewModel: ObservableObject {
    @Published private var audioPlayer: AVAudioPlayer?
    
    func playSound(crySound: String) {
        guard let url = URL(string: crySound) else { return }

        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                    
                let tempOggURL = FileManager.default.temporaryDirectory
                    .appendingPathComponent(UUID().uuidString)
                    .appendingPathExtension("ogg")
                    
                try data.write(to: tempOggURL)
                    
                let decoder = OGGDecoder()
                let wavURL = await withCheckedContinuation { continuation in
                    decoder.decode(tempOggURL) { wavURL in
                        continuation.resume(returning: wavURL)
                    }
                }
                    
                if let wavURL = wavURL {
                    await MainActor.run {
                        audioPlayer = try? AVAudioPlayer(contentsOf: wavURL)
                        audioPlayer?.play()
                    }
                }
                    
                try? FileManager.default.removeItem(at: tempOggURL)
                    
            } catch {
                print("Failed to play: \(error)")
            }
        }
    }
}
