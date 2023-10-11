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
    
    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    // hidden number
    var number: Int = 0
    
    var round: Int = 1
    
    // total points per round
    var points: Int = 0
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        self.number = Int.random(in: 1...50)
        self.label.text = String(number)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    @IBAction func checkNumber() {
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
    
    @IBAction func showNextScreen() {
        self.present(self.secondViewController, animated: true)
    }

    private func getSecondViewController() -> SecondViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
    return viewController as! SecondViewController
    }
}
