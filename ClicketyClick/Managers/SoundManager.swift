//
//  SoundManager.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 04/11/2023.
//

import Foundation
import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    
    private var soundEffects: [SoundEffect: AVAudioPlayer] = [:]
    
    private init() {
        let keySoundEffects = KeyboardManager.shared.getKeys.compactMap { $0.soundEffect }
        prepareSoundEffects(soundEffects: keySoundEffects)
    }
    
    func prepareSoundEffects(soundEffects: [SoundEffect]) {
        for sfx in soundEffects {
            _ = addSoundEffect(sfx)
        }
    }
    
    func playSound(_ soundEffect: SoundEffect) {
        guard let sfxPlayer = soundEffects[soundEffect] else {
            print("No sound effect found for: \(soundEffect.path)")
            
            let player = addSoundEffect(soundEffect)
            player?.currentTime = 0
            player?.play()
            
            return
        }
        
        sfxPlayer.currentTime = 0
        sfxPlayer.play()
    }
    
    private func addSoundEffect(_ sfx: SoundEffect) -> AVAudioPlayer? {
        if let url = Bundle.main.url(forResource: sfx.path, withExtension: sfx.ext) {
            do {
                let player = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
                self.soundEffects[sfx] = player
                return player
            } catch {
                print("Failed to load sound for \(sfx.path).\(sfx.ext): \(error)")
            }
        } else {
            print("Sound file not found for \(sfx.path).\(sfx.ext)")
        }
        
        return nil
    }
}
