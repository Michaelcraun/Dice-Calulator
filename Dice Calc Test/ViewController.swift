//
//  ViewController.swift
//  Dice Calc Test
//
//  Created by Michael Craun on 9/27/18.
//  Copyright © 2018 CraunicProductions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var shouldStartNewFormula = false
    var rolls = [Roll]()
    var formulaTotal: Int = 0
    var currentRoll: Roll = Roll ( numOfDice: 0, die: nil, operand: nil, modifier: 0 )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let diceCalculator = DiceCalculator()
        diceCalculator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(diceCalculator)
        diceCalculator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        diceCalculator.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        diceCalculator.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}

