//
//  DataLoaderService.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 05/11/2023.
//

import Foundation


class DataLoader {
    static func loadKeys(from fileName: String) -> [Key] {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            fatalError("Could not find \(fileName).json in main bundle.")
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode([Key].self, from: data)
        } catch {
            fatalError("Could not load \(fileName).json from main bundle: \(error)")
        }
    }
}
