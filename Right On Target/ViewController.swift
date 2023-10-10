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
    
    // hidden number
    var number: Int = 0
    
    var round: Int = 0
    
    // total points per round
    var points: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func checkNumber() {
        if self.round == 0 {
            self.number = Int.random(in: 1...50)
            self.label.text = String(number)
            self.round = 1
        } else {
            let numslider = Int(self.slider.value.rounded())
            if numslider > self.number {
                self.points += 50 - numslider + self.number
            } else if numslider < self.number {
                self.points += 50 - self.number + numslider
            } else {
                self.points += 50
            }
            if self.round == 5 {
                let alert = UIAlertController(title: "Игра окончена",
                                              message: "Вы заработали \(self.points) очков",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default))
                self.present(alert, animated: true)
                self.round = 1
                self.points = 0
            } else {
                self.round += 1
            }
            self.number = Int.random(in: 1...50)
            self.label.text = String(self.number)
        }
    }
}
