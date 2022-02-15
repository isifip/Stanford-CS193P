//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Irakli Sokhaneishvili on 14.02.22.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {
    
    let themes = [
        "Sports":"⚽️🏀🏈⚾️🥎🎾🏐🏉🏓🏋️‍♀️🏄‍♀️🏌️",
        "Animals":"🐱🐈🐈‍⬛🐶🐕‍🦺🦮🐕🐩🐰🐇🐭🐹",
        "Faces":"🤣😘😊😍🥰😁😀😉☺️😬😜😅",
    ]
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//    }
    
    
    //MARK: --> Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle {
                if let theme = themes[themeName] {
                    if let cvc = segue.destination as? ConcentrationViewController {
                        cvc.theme = theme
                    }
                } else {
                    print("something went wrong")
                }
            } else {
                //print("couldnt get current title")
                print("\(String(describing: (sender as? UIButton)?.currentTitle))")
            }
        }
    }
    
}
