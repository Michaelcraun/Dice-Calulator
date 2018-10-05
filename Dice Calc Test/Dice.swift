//
//  Dice.swift
//  Dice Calc Test
//
//  Created by Michael Craun on 9/27/18.
//  Copyright © 2018 CraunicProductions. All rights reserved.
//

import Foundation

struct Roll {
    var numOfDice:  Int
    var die:        Dice?
    var operand:    Operator?
    var modifier:   Int
}

enum Operator: String {
    case add =      "+"
    case divide =   "÷"
    case multiply = "x"
    case subtract = "-"
}

enum Dice: String {
    case dx
    case d4
    case d6
    case d8
    case d10
    case d12
    case d20
    static var x: Int = 0
    
    var printableValue: String {
        switch self {
        case .dx:
            if Dice.x == 0 {
                return "d"
            } else {
                return "d\(Dice.x)"
            }
        default: return rawValue
        }
    }
    
    var maxValue: Int {
        switch self {
        case .dx:   return Dice.x
        case .d4:   return 4
        case .d6:   return 6
        case .d8:   return 8
        case .d10:  return 10
        case .d12:  return 12
        case .d20:  return 20
        }
    }
    
    static func roll(_ roll: Roll) -> Int {
        guard let die = roll.die else { return 0 }
        var result: Int  = 0
        for _ in 1...roll.numOfDice {
            let rollResult = Int.random(in: 1...die.maxValue)
            result += rollResult
        }
        
        guard let operand = roll.operand else { return result }
        switch operand {
        case .add: return result + roll.modifier
        case .divide: return result / roll.modifier
        case .multiply: return result * roll.modifier
        case .subtract: return result - roll.modifier
        }
    }
}
