//
//  PokemonAudioManager.swift
//  c5
//
//  Created by bishoe01 on 8/20/25.
//
import AVFoundation
import OggDecoder
import SwiftUI

class PokemonAudioManager {
    func convertOggToWav(_ oggURL: URL) async throws -> URL {
        let (data, _) = try await URLSession.shared.data(from: oggURL)
        
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
    
        try? FileManager.default.removeItem(at: tempOggURL)
        
        guard let wavURL = wavURL else {
            throw AudioError.conversionFailed
        }
        
        return wavURL
    }
    
    func createAudioPlayer(from url: URL) throws -> AVAudioPlayer {
        return try AVAudioPlayer(contentsOf: url)
    }
}
