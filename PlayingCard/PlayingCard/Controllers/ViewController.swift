//
//  ViewController.swift
//  PlayingCard
//
//  Created by Irakli Sokhaneishvili on 13.02.22.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    @IBOutlet var playingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            playingCardView.addGestureRecognizer(swipe)
            
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
            playingCardView.addGestureRecognizer(pinch)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: --> Methods
    @objc func nextCard() {
        if let card = deck.draw() {
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
        
    }

    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            playingCardView.isFaceUp.toggle()
        default:
            break
        }
    }
    
    
}

