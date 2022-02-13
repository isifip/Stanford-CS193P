//
//  PlayingCardView.swift
//  PlayingCard
//
//  Created by Irakli Sokhaneishvili on 13.02.22.
//

import UIKit

class PlayingCardView: UIView {
    
    var rank: Int = 5 { didSet { setNeedsDisplay(); setNeedsDisplay() } }
    var suit: String = "❤️" { didSet { setNeedsDisplay(); setNeedsDisplay() } }
    var isFaceUp: Bool = true { didSet { setNeedsDisplay(); setNeedsDisplay() } }
    
    private var cornerString: NSAttributedString {
        return centeredAttributedString(rank+"\n"+suit, fontSize: 0.0)
    }

    override func draw(_ rect: CGRect) {
        
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16.0)
        roundedRect.addClip()
        UIColor.white.setFill()
        roundedRect.fill()
        
    }
    
    private func centeredAttributedString(_ string: String, fontSize: CGFloat) -> NSAttributedString {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        return NSAttributedString(string: string, attributes: [.paragraphStyle:paragraphStyle, .font:font])
    }

}
