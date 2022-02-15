//
//  ViewController.swift
//  Concentration
//
//  Created by Irakli Sokhaneishvili on 04.02.22.
//

import UIKit

class ConcentrationViewController: UIViewController {
    //MARK: --> Properties
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    
    //MARK: --> Outlets
    @IBOutlet private var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: --> IBActions
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card was not i n cardButtons")
        }
    }
    
    //MARK: --> Function/Methods
    private func updateViewFromModel() {
        if cardButtons != nil {
            for index in cardButtons.indices {
                let button = cardButtons[index]
                let card = game.cards[index]
                if card.isFaceUp {
                    button.setTitle(emoji(for: card), for: .normal)
                    button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
                    button.backgroundColor = .lightGray
                } else {
                    button.setTitle("", for: .normal)
                    button.backgroundColor = card.isMatched ? .clear : .systemIndigo
                }
            }
        }
    }
    
    var theme: String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
    
    //private var emojiChoices = ["👻", "🎃" , "👽" , "🤬", "🦉", "🦅" , "🐴" , "🦄", "🐝"]
    var emojiChoices = "👻🎃👽🤬🦉🦅🐴🦄🐝"
    var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "X"
    }
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

