//
//  Game.swift
//  Right On Target
//
//  Created by Karina Kovaleva on 11.10.23.
//

import Foundation

protocol GameProtocol {
    var score: Int { get }
    var currentRound: GameRoundProtocol! { get }
    var isGameEnded: Bool { get }
    var secretValueGenerator: GeneratorProtocol { get }
    func restartGame()
    func startNewRound()
}

class Game: GameProtocol {

    var score: Int {
        var totalScore = 0
        for round in self.rounds {
            totalScore += round.score
        }
        return totalScore
    }
    
    var currentSecretValue: Int = 0
    
    var currentRound: GameRoundProtocol!
    private var rounds: [GameRoundProtocol] = []
    private var roundsCount: Int
    
    var secretValueGenerator: GeneratorProtocol
    
    var isGameEnded: Bool {
        self.roundsCount == self.rounds.count ? true : false
    }
    
    init(valueGenerator: GeneratorProtocol, rounds: Int) {
        self.secretValueGenerator = valueGenerator
        self.roundsCount = rounds
        self.startNewRound()
    }
    
    func startNewRound() {
        self.currentSecretValue = self.getNewSecretValue()
        currentRound = GameRound(secretValue: self.currentSecretValue)
        self.rounds.append(self.currentRound)
    }
    
    func restartGame() {
        rounds.removeAll()
        self.startNewRound()
    }

    private func getNewSecretValue() -> Int {
        self.secretValueGenerator.getRandomValue()
    }
}
