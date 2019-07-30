//
//  ViewController.swift
//  ThreeCardMonte
//
//  Created by Anthony Gonzalez on 7/29/19.
//  Copyright © 2019 Anthony Gonzalez. All rights reserved.

import UIKit

class ViewController: UIViewController {
    var score = 0
    var correctGuesses = 0
    let cardBack = UIImage(named: "cardBack")
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var Card1: UIButton!
    @IBOutlet weak var Card2: UIButton!
    @IBOutlet weak var Card3: UIButton!
    @IBOutlet weak var newGame: UIButton!
    
    @IBOutlet weak var Score: UILabel!
    
    @IBAction func cardFlip(_ sender: UIButton) {
        var cardArray: [UIImage] = [UIImage(named: "kingCard")!, UIImage(named: "jokerCard")!, UIImage(named: "jokerCard")!]
        cardArray = cardArray.shuffled()
        
        for i in 0..<cardArray.count {
            if cardArray[i] == UIImage(named: "kingCard"){
                if i == 0 {
                    Card1.setImage(UIImage.init(named: "kingCard"), for: .normal)
                } else if i == 1 {
                    Card2.setImage(UIImage.init(named: "kingCard"), for: .normal)
                } else if i == 2 {
                    Card3.setImage(UIImage.init(named: "kingCard"), for: .normal)
                }
            }
        }
        
        switch sender.tag {
            
            
        case 0:
            if cardArray[0] == UIImage(named: "kingCard") {
                Card1.setImage(UIImage.init(named: "kingCard"), for: .normal)
                self.labelText.text = "You win!"
                correctGuesses += 1
            } else {
                Card1.setImage(UIImage.init(named: "jokerCard"), for: .normal)
                self.labelText.text = "You lose."
            }
            Card1.isUserInteractionEnabled = false
            Card2.isEnabled = false
            Card3.isEnabled = false
            
            
        case 1:
            if cardArray[1] == UIImage(named: "kingCard") {
                Card2.setImage(UIImage.init(named: "kingCard"), for: .normal)
                self.labelText.text = "You win!"
                labelText.textAlignment = NSTextAlignment.center
                correctGuesses += 1
            } else {
                Card2.setImage(UIImage.init(named: "jokerCard"), for: .normal)
                self.labelText.text = "You lose."
                labelText.textAlignment = NSTextAlignment.center
            }
            Card1.isEnabled = false
            Card2.isUserInteractionEnabled = false
            Card3.isEnabled = false
            
            
        case 2:
            if cardArray[2] == UIImage(named: "kingCard") {
                Card3.setImage(UIImage.init(named: "kingCard"), for: .normal)
                self.labelText.text = "You win!"
                labelText.textAlignment = NSTextAlignment.center
                correctGuesses += 1
            } else {
                Card3.setImage(UIImage.init(named: "jokerCard"), for: .normal)
                self.labelText.text = "You lose."
                labelText.textAlignment = NSTextAlignment.center
            }
            Card1.isEnabled = false
            Card2.isEnabled = false
            Card3.isUserInteractionEnabled = false
            
            
        default: print()
        }
        score += 1
        self.Score.text = "Score: \(correctGuesses)/\(score)"
        
    }
    
    @IBAction func resetScore(_ sender: UIButton) {
        score = 0
        correctGuesses = 0
        self.Score.text = "Score: 0/0"
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        Card1.isEnabled = true
        Card2.isEnabled = true
        Card3.isEnabled = true
        
        Card1.isUserInteractionEnabled = true
        Card2.isUserInteractionEnabled = true
        Card3.isUserInteractionEnabled = true
        
        Card1.setImage(cardBack, for: .normal)
        Card2.setImage(cardBack, for: .normal)
        Card3.setImage(cardBack, for: .normal)
        
        self.labelText.text = "Pick a card."
    }
    
    override func viewDidLoad() {
    }
}



