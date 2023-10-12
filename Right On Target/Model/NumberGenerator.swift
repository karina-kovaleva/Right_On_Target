//
//  Generator.swift
//  Right On Target
//
//  Created by Karina Kovaleva on 12.10.23.
//

import Foundation

protocol GeneratorProtocol {
    func getRandomValue() -> Int
}

class NumberGenerator: GeneratorProtocol {
    private let minValue: Int
    private let maxValue: Int
    
    func getRandomValue() -> Int {
        (minValue...maxValue).randomElement()!
    }
    
    init?(minValue: Int, maxValue: Int) {
        guard minValue <= maxValue else { return nil }
        self.minValue = minValue
        self.maxValue = maxValue
    }
}
