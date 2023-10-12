//
//  ViewController.swift
//  Right On Target
//
//  Created by Karina Kovaleva on 10.10.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var slider: UISlider!

    var game: Game!

    // MARK: - Жизненный цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let generatorValue = NumberGenerator(minValue: 1, maxValue: 50)!
        self.game = Game(valueGenerator: generatorValue, rounds: 5)
        self.game.startNewRound()
        self.updateLabelWithSecretValue(newSecretValue: self.game.currentSecretValue)
    }
    
    // MARK: - Взаимодействие View - Model
    
    @IBAction func checkNumber() {
        self.game.currentRound.calculateScore(with: Int(self.slider.value))
        if self.game.isGameEnded {
            self.showAlert(with: self.game.score)
            self.game.restartGame()
        } else {
            self.game.startNewRound()
        }
        self.updateLabelWithSecretValue(newSecretValue: self.game.currentSecretValue)
    }
    
    // MARK: - Обновление View
    
    private func updateLabelWithSecretValue(newSecretValue: Int) {
        self.label.text = String(newSecretValue)
    }
    
    private func showAlert(with score: Int) {
        let alert = UIAlertController(title: "Игра окончена",
                                      message: "Вы заработали \(score) очков",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default))
        self.present(alert, animated: true)
    }
}
