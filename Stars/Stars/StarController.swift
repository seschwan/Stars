//
//  StarController.swift
//  Stars
//
//  Created by Seschwan on 5/8/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

class StarController {
    
    init() {
        loadFromPersistentStore()
    }
    
    private(set) var stars: [Star] = []
    
    func addStar(named name: String, withDistance distance: Double) {
        let star = Star(name: name, distance: distance)
        stars.append(star)
        saveToPersistentStore()
    }
    
    private var persistentURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return documents.appendingPathComponent("stars.plist")
    }
    
    
    // Save to disk
    func saveToPersistentStore() {
        guard let url = persistentURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url)
        } catch {
            print("Error saving stars: \(error)")
        }
    }
    
    
    // Load from the disk
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            stars = try decoder.decode([Star].self, from: data)
        } catch {
            print("Error loading data from disk: \(error)")
        }
        
    }
    
}
