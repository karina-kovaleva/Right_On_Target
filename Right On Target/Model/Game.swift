//
//  Game.swift
//  Right On Target
//
//  Created by Karina Kovaleva on 11.10.23.
//

import Foundation

protocol GameProtocol {
    var score: Int { get }
    var currentSecretValue: Int { get }
    var isGameEnded: Bool { get }
    func restartGame()
    func startNewRound()
    func calculateScore(with value: Int)
}

class Game: GameProtocol {
    
    private let minSecretValue: Int
    private let maxSecretValue: Int
    private let lastRound: Int
    
    private var currentRound: Int = 0

    var score: Int = 0
    var currentSecretValue: Int = 0
    var isGameEnded: Bool {
        self.currentRound >= self.lastRound ? true : false
    }
    
    init?(minSecretValue: Int, maxSecretValue: Int, rounds: Int) {
        guard minSecretValue <= maxSecretValue else { return nil }
        self.minSecretValue = minSecretValue
        self.maxSecretValue = maxSecretValue
        self.lastRound = rounds
    }
    
    private func getNewSecretValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
    
    func restartGame() {
        self.currentRound = 0
        self.score = 0
        self.startNewRound()
    }
    
    func startNewRound() {
        self.currentSecretValue = self.getNewSecretValue()
        self.currentRound += 1
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
