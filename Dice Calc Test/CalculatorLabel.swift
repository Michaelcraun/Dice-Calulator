//
//  CalculatorLabel.swift
//  Dice Calc Test
//
//  Created by Michael Craun on 10/5/18.
//  Copyright © 2018 CraunicProductions. All rights reserved.
//

import UIKit

@IBDesignable
class CalculatorLabel: UILabel {
    @IBInspectable var labelColor: UIColor = Theme.labelBackgroundColor {
        didSet {
            self.backgroundColor = labelColor
        }
    }
    
    @IBInspectable var fontColor: UIColor = Theme.fontColor {
        didSet {
            self.textColor = fontColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = labelColor
        self.textColor = fontColor
    }
}
