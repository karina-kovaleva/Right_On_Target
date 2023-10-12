//
//  GameRound.swift
//  Right On Target
//
//  Created by Karina Kovaleva on 12.10.23.
//

import Foundation

protocol GameRoundProtocol {
    var score: Int { get }
    var currentSecretValue: Int { get }
    func calculateScore(with value: Int)
}

class GameRound: GameRoundProtocol {

    var score: Int = 0
    var currentSecretValue: Int
    
    init?(secretValue: Int) {
        self.currentSecretValue = secretValue
    }
   
    func calculateScore(with value: Int) {
        if value > self.currentSecretValue {
            self.score += 50 - value + self.self.currentSecretValue
        } else if value < self.currentSecretValue {
            self.score += 50 - self.currentSecretValue + value
        } else {
            self.score += 50
        }
    }
}
