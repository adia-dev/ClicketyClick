//
//  SoundEffect.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 05/11/2023.
//

import Foundation

struct SoundEffect: Identifiable, Hashable, Codable {
    var id = UUID()
    let path: String
    let ext: String
    
    enum CodingKeys: String, CodingKey {
        case path, ext
    }
    
    init(path: String, ext: String) {
        self.path = path
        self.ext = ext
    }
}
