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
    
    @IBInspectable var topPadding: CGFloat = 0.0
    @IBInspectable var bottomPadding: CGFloat = 0.0
    @IBInspectable var leftPadding: CGFloat = 10.0
    @IBInspectable var rightPadding: CGFloat = 10.0
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftPadding + rightPadding,
                      height: size.height + topPadding + bottomPadding)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = labelColor
        self.textColor = fontColor
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding)
        super.drawText(in: rect.inset(by: insets))
    }
}
