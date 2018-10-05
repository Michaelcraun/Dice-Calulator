//
//  CalculatorButton.swift
//  Dice Calc Test
//
//  Created by Michael Craun on 10/5/18.
//  Copyright © 2018 CraunicProductions. All rights reserved.
//

import UIKit

@IBDesignable
class CalculatorButton: UIButton {
    @IBInspectable var buttonColor: UIColor = Theme.defaultButtonColor {
        didSet {
            self.backgroundColor = buttonColor
        }
    }
    
    @IBInspectable var fontColor: UIColor = Theme.fontColor {
        didSet {
            self.titleLabel?.textColor = fontColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = buttonColor
        self.titleLabel?.textColor = fontColor
    }
}

@IBDesignable
class RollButton: UIButton {
    @IBInspectable var buttonColor: UIColor = Theme.rollButtonColor {
        didSet {
            self.backgroundColor = buttonColor
        }
    }
    
    @IBInspectable var fontColor: UIColor = Theme.fontColor {
        didSet {
            self.titleLabel?.textColor = fontColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = buttonColor
        self.titleLabel?.textColor = fontColor
    }
}
