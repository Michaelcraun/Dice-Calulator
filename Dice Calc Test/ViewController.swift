//
//  ViewController.swift
//  Dice Calc Test
//
//  Created by Michael Craun on 9/27/18.
//  Copyright © 2018 CraunicProductions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var output: UILabel!
    @IBOutlet var input: UILabel!
    @IBOutlet var dx: UIButton!
    @IBOutlet var d4: UIButton!
    @IBOutlet var d6: UIButton!
    @IBOutlet var d8: UIButton!
    @IBOutlet var d10: UIButton!
    @IBOutlet var d12: UIButton!
    @IBOutlet var d20: UIButton!
    @IBOutlet var zero: UIButton!
    @IBOutlet var one: UIButton!
    @IBOutlet var two: UIButton!
    @IBOutlet var three: UIButton!
    @IBOutlet var four: UIButton!
    @IBOutlet var five: UIButton!
    @IBOutlet var six: UIButton!
    @IBOutlet var seven: UIButton!
    @IBOutlet var eight: UIButton!
    @IBOutlet var nine: UIButton!
    @IBOutlet var roll: UIButton!
    @IBOutlet var divide: UIButton!
    @IBOutlet var multiply: UIButton!
    @IBOutlet var subtract: UIButton!
    @IBOutlet var add: UIButton!
    
    var shouldStartNewFormula = false
    var rolls = [Roll]()
    var formulaTotal: Int = 0
    var currentRoll: Roll = Roll ( numOfDice: 0, die: nil, operand: nil, modifier: 0 )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        input.text = ""
        output.text = ""
    }

    @IBAction func dieButtonPressed(_ sender: UIButton) {
       guard let dieString = sender.title(for: .normal), let die = Dice(rawValue: dieString) else { return }
        
        if shouldStartNewFormula {
            rolls = []
            Dice.x = 0
            shouldStartNewFormula = false
        }
        
        guard let currentDie = currentRoll.die else {
            if currentRoll.numOfDice == 0 {
                currentRoll.numOfDice = 1
            }
            currentRoll.die = die
            updateInputLabel(with: rolls + [currentRoll])
            return
        }
        
        if currentDie == .dx {
            currentRoll.die = die
            if die == currentDie {
                currentRoll.numOfDice += 1
            }
        } else if die == currentDie && currentRoll.operand == nil {
            currentRoll.numOfDice += 1
        } else {
            rolls.append(currentRoll)
            currentRoll = Roll(numOfDice: 1, die: die, operand: nil, modifier: 0)
        }
        
        updateInputLabel(with: rolls + [currentRoll])
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if shouldStartNewFormula {
            rolls = []
            Dice.x = 0
            shouldStartNewFormula = false
        }
        
        guard let numberTitle = sender.title(for: .normal), let number = Int(numberTitle) else { return }
        
        if let currentDie = currentRoll.die, currentDie == .dx {
            print("CURRENT ROLL: operand: \(currentRoll.operand)")
            if currentRoll.numOfDice > 0 && currentRoll.operand != nil {
                let newNumber = "\(currentRoll.modifier)\(number)"
                if let modifier = Int(newNumber) {
                    currentRoll.modifier = modifier
                }
            } else if currentRoll.numOfDice > 0 {
                let newNumber = "\(Dice.x)\(number)"
                if let x = Int(newNumber) {
                    Dice.x = x
                }
            } else if currentRoll.operand == nil {
                let newNumber = "\(currentRoll.numOfDice)\(number)"
                if let numOfDice = Int(newNumber), numOfDice <= 999 {
                    currentRoll.numOfDice = numOfDice
                }
            }
        } else {
            if currentRoll.operand == nil {
                let newNumber = "\(currentRoll.numOfDice)\(number)"
                if let numOfDice = Int(newNumber), numOfDice <= 999 {
                    currentRoll.numOfDice = numOfDice
                }
            } else {
                let newNumber = "\(currentRoll.modifier)\(number)"
                if let modifier = Int(newNumber) {
                    currentRoll.modifier = modifier
                }
            }
        }
        
        updateInputLabel(with: rolls + [currentRoll])
    }
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        guard let _ = currentRoll.die,
            let operatorString = sender.title(for: .normal),
            let operand = Operator(rawValue: operatorString)
            else { return }
        
        currentRoll.operand = operand
        updateInputLabel(with: rolls + [currentRoll])
    }
    
    @IBAction func rollPressed(_ sender: UIButton) {
        rolls.append(currentRoll)
        
        var total = 0
        for roll in rolls {
            let result = Dice.roll(roll)
            total += result
        }
        
        formulaTotal = total
        currentRoll = Roll(numOfDice: 0, die: nil, operand: nil, modifier: 0)
        shouldStartNewFormula = true
        updateOutputLabel()
    }
    
    func updateInputLabel(with rolls: [Roll]) {
        var inputString = ""
        for roll in rolls {
            let rollString: String = {
                var rollString = ""
                rollString += "\(roll.numOfDice)"
                if let die = roll.die { rollString += "\(die.printableValue)" }
                if let operand = roll.operand { rollString += " \(operand.rawValue)" }
                if roll.modifier > 0 { rollString += " \(roll.modifier)" }
                return rollString
            }()
            
            if inputString == "" {
                inputString = rollString
            } else {
                inputString += " + \(rollString)"
            }
            
            input.text = inputString
        }
    }
    
    func updateOutputLabel() {
        output.text = "\(formulaTotal)"
    }
}

