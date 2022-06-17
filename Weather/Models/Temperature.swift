//
//  Temperature.swift
//  Weather
//
//  Created by Michał Zieliński on 17/06/2022.
//

import Foundation

struct Temperature: Decodable {
    var day: Double = 0.0
    var eve: Double = 0.0
    var max: Double = 0.0
    var min: Double = 0.0
    var morn: Double = 0.0
    var night: Double = 0.0
    
    init() {
        
    }
}
