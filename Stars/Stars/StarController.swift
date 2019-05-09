//
//  StarController.swift
//  Stars
//
//  Created by Seschwan on 5/8/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

class StarController {
    private(set) var stars: [Star] = []
    
    func addStar(named name: String, withDistance distance: Double) {
        let star = Star(name: name, distance: distance)
        stars.append(star)
        
    }
    
}
