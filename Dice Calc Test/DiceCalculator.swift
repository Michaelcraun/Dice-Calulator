//
//  DiceCalculator.swift
//  Dice Calc Test
//
//  Created by Michael Craun on 10/5/18.
//  Copyright © 2018 CraunicProductions. All rights reserved.
//

import UIKit

enum Theme {
    static let labelBackgroundColor = UIColor(red: 165 / 255, green: 165 / 255, blue: 165 / 255, alpha: 1)
    static let defaultButtonColor = UIColor(red: 105 / 255, green: 105 / 255, blue: 105 / 255, alpha: 1)
    static let dieButtonColor = UIColor(red: 85 / 255, green: 85 / 255, blue: 85 / 255, alpha: 1)
    static let operatorButtonColor = UIColor(red: 65 / 255, green: 65 / 255, blue: 65 / 255, alpha: 1)
    static let rollButtonColor = UIColor(red: 129 / 255, green: 21 / 255, blue: 21 / 255, alpha: 1)
    
    enum Font {
        static let bold = "\(Font.family)-Regular"
        static let color = UIColor(red: 252 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
        static let family = "AvenirNextCondensed"
        static let regular = "\(Font.family)-Bold"
        static let defaultSize: CGFloat = 20.0
    }
}

@IBDesignable
class DiceCalculator: UIView {
    // MARK: - UI Variables
    private let halfLabel: CalculatorLabel = {
        let label = CalculatorLabel(numOfLines: 0, labelHeight: 60.0, title: "HALF")
        return label
    }()
    private let rollLabel: CalculatorLabel = {
        let label = CalculatorLabel(numOfLines: 0, labelHeight: 60.0, title: "ROLL")
        return label
    }()
    private let maximumLabel: CalculatorLabel = {
        let label = CalculatorLabel(numOfLines: 0, labelHeight: 60.0, title: "MAX")
        return label
    }()
    private let inputLabel: CalculatorLabel = {
        let label = CalculatorLabel()
        return label
    }()
    private let dxButton: CalculatorButton = {
        let button = CalculatorButton(
            title: "dx",
            buttonColor: Theme.dieButtonColor
        )
        button.addTarget(self, action: #selector(diePressed(_:)), for: .touchUpInside)
        return button
    }()
    private let d4Button: CalculatorButton = {
        let button = CalculatorButton(
            title: "d4",
            buttonColor: Theme.dieButtonColor
        )
        button.addTarget(self, action: #selector(diePressed(_:)), for: .touchUpInside)
        return button
    }()
    private let d6Button: CalculatorButton = {
        let button = CalculatorButton(
            title: "d6",
            buttonColor: Theme.dieButtonColor
        )
        button.addTarget(self, action: #selector(diePressed(_:)), for: .touchUpInside)
        return button
    }()
    private let d8Button: CalculatorButton = {
        let button = CalculatorButton(
            title: "d8",
            buttonColor: Theme.dieButtonColor
        )
        button.addTarget(self, action: #selector(diePressed(_:)), for: .touchUpInside)
        return button
    }()
    private let d10Button: CalculatorButton = {
        let button = CalculatorButton(
            title: "d10",
            buttonColor: Theme.dieButtonColor
        )
        button.addTarget(self, action: #selector(diePressed(_:)), for: .touchUpInside)
        return button
    }()
    private let d12Button: CalculatorButton = {
        let button = CalculatorButton(
            title: "d12",
            buttonColor: Theme.dieButtonColor
        )
        button.addTarget(self, action: #selector(diePressed(_:)), for: .touchUpInside)
        return button
    }()
    private let d20Button: CalculatorButton = {
        let button = CalculatorButton(
            title: "d20",
            buttonColor: Theme.dieButtonColor
        )
        button.addTarget(self, action: #selector(diePressed(_:)), for: .touchUpInside)
        return button
    }()
    private let nineButton: CalculatorButton = {
        let button = CalculatorButton(title: "9")
        button.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        return button
    }()
    private let eightButton: CalculatorButton = {
        let button = CalculatorButton(title: "8")
        button.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        return button
    }()
    private let sevenButton: CalculatorButton = {
        let button = CalculatorButton(title: "7")
        button.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        return button
    }()
    private let sixButton: CalculatorButton = {
        let button = CalculatorButton(title: "6")
        button.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        return button
    }()
    private let fiveButton: CalculatorButton = {
        let button = CalculatorButton(title: "5")
        button.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        return button
    }()
    private let fourButton: CalculatorButton = {
        let button = CalculatorButton(title: "4")
        button.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        return button
    }()
    private let threeButton: CalculatorButton = {
        let button = CalculatorButton(title: "3")
        button.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        return button
    }()
    private let twoButton: CalculatorButton = {
        let button = CalculatorButton(title: "2")
        button.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        return button
    }()
    private let oneButton: CalculatorButton = {
        let button = CalculatorButton(title: "1")
        button.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        return button
    }()
    private let zeroButton: CalculatorButton = {
        let button = CalculatorButton(title: "0")
        button.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        return button
    }()
    private let divideButton: CalculatorButton = {
        let button = CalculatorButton(
            title: "÷",
            buttonColor: Theme.operatorButtonColor
        )
        button.addTarget(self, action: #selector(operatorPressed(_:)), for: .touchUpInside)
        return button
    }()
    private let multiplyButton: CalculatorButton = {
        let button = CalculatorButton(
            title: "x",
            buttonColor: Theme.operatorButtonColor
        )
        button.addTarget(self, action: #selector(operatorPressed(_:)), for: .touchUpInside)
        return button
    }()
    private let minusButton: CalculatorButton = {
        let button = CalculatorButton(
            title: "-",
            buttonColor: Theme.operatorButtonColor
        )
        button.addTarget(self, action: #selector(operatorPressed(_:)), for: .touchUpInside)
        return button
    }()
    private let plusButton: CalculatorButton = {
        let button = CalculatorButton(
            title: "+",
            buttonColor: Theme.operatorButtonColor
        )
        button.addTarget(self, action: #selector(operatorPressed(_:)), for: .touchUpInside)
        return button
    }()
    private let rollButton: RollButton = {
        let button = RollButton()
        button.addTarget(self, action: #selector(rollPressed(_:)), for: .touchUpInside)
        return button
    }()
    private var calculatorStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var horizontalStack: UIStackView {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }
    
    // MARK: - Data Variables
    var shouldStartNewFormula = false
    var rolls = [Roll]()
    var formulaTotal: Int = 0
    var formulaMaximum: Int = 0
    var currentRoll: Roll = Roll ( numOfDice: 0, die: nil, operand: nil, modifier: 0 )
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        let outputStack = horizontalStack
        outputStack.addArrangedSubview(halfLabel)
        outputStack.addArrangedSubview(rollLabel)
        outputStack.addArrangedSubview(maximumLabel)
        
        let horizontalStack1 = horizontalStack
        horizontalStack1.addArrangedSubview(d4Button)
        horizontalStack1.addArrangedSubview(d6Button)
        horizontalStack1.addArrangedSubview(d8Button)
        horizontalStack1.addArrangedSubview(dxButton)
        
        let horizontalStack2 = horizontalStack
        horizontalStack2.addArrangedSubview(d10Button)
        horizontalStack2.addArrangedSubview(d12Button)
        horizontalStack2.addArrangedSubview(d20Button)
        horizontalStack2.addArrangedSubview(divideButton)
        
        let horizontalStack3 = horizontalStack
        horizontalStack3.addArrangedSubview(sevenButton)
        horizontalStack3.addArrangedSubview(eightButton)
        horizontalStack3.addArrangedSubview(nineButton)
        horizontalStack3.addArrangedSubview(multiplyButton)
        
        let horizontalStack4 = horizontalStack
        horizontalStack4.addArrangedSubview(fourButton)
        horizontalStack4.addArrangedSubview(fiveButton)
        horizontalStack4.addArrangedSubview(sixButton)
        horizontalStack4.addArrangedSubview(minusButton)
        
        let horizontalStack5 = horizontalStack
        horizontalStack5.addArrangedSubview(oneButton)
        horizontalStack5.addArrangedSubview(twoButton)
        horizontalStack5.addArrangedSubview(threeButton)
        horizontalStack5.addArrangedSubview(plusButton)
        
        let horizontalStack6 = horizontalStack
        horizontalStack6.addArrangedSubview(zeroButton)
        horizontalStack6.addArrangedSubview(rollButton)
        
        calculatorStack.addArrangedSubview(outputStack)
        calculatorStack.addArrangedSubview(inputLabel)
        calculatorStack.addArrangedSubview(horizontalStack1)
        calculatorStack.addArrangedSubview(horizontalStack2)
        calculatorStack.addArrangedSubview(horizontalStack3)
        calculatorStack.addArrangedSubview(horizontalStack4)
        calculatorStack.addArrangedSubview(horizontalStack5)
        calculatorStack.addArrangedSubview(horizontalStack6)
        
        self.addSubview(calculatorStack)
        calculatorStack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        calculatorStack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        calculatorStack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        calculatorStack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func diePressed(_ sender: UIButton) {
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
    
    @objc func numberPressed(_ sender: UIButton) {
        if shouldStartNewFormula {
            rolls = []
            Dice.x = 0
            shouldStartNewFormula = false
        }
        
        guard let numberTitle = sender.title(for: .normal), let number = Int(numberTitle) else { return }
        
        if let currentDie = currentRoll.die, currentDie == .dx {
            if currentRoll.numOfDice > 0 && currentRoll.operand != nil {
                let newNumber = "\(currentRoll.modifier)\(number)"
                if let modifier = Int(newNumber) {
                    currentRoll.modifier = modifier
                }
            } else if currentRoll.numOfDice > 0 {
                let newNumber = "\(Dice.x)\(number)"
                if let x = Int(newNumber), x <= 999999 {
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
    
    @objc func operatorPressed(_ sender: UIButton) {
        guard let _ = currentRoll.die,
            let operatorString = sender.title(for: .normal),
            let operand = Operator(rawValue: operatorString)
            else { return }
        
        currentRoll.operand = operand
        updateInputLabel(with: rolls + [currentRoll])
    }
    
    @objc func rollPressed(_ sender: UIButton) {
        rolls.append(currentRoll)
        
        var total = 0
        for roll in rolls {
            let result = Dice.roll(roll)
            total += result
        }
        
        var maximum = 0
        for roll in rolls {
            let max = Dice.max(for: roll)
            maximum += max
        }
        
        formulaMaximum = maximum
        formulaTotal = total
        currentRoll = Roll(numOfDice: 0, die: nil, operand: nil, modifier: 0)
        shouldStartNewFormula = true
        updateOutputLabels()
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
            
            inputLabel.text = inputString
        }
    }
    
    func updateOutputLabels() {
        halfLabel.text = "\(formulaTotal / 2)"
        rollLabel.text = "\(formulaTotal)"
        maximumLabel.text = "\(formulaMaximum)"
    }
}

@IBDesignable
class CalculatorButton: UIButton {
    @IBInspectable var buttonColor: UIColor = Theme.defaultButtonColor
    @IBInspectable var fontColor: UIColor = Theme.Font.color 
    @IBInspectable var buttonHeight: CGFloat = 50.0
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    convenience init(title: String, buttonColor: UIColor = Theme.defaultButtonColor, fontColor: UIColor = Theme.Font.color) {
        self.init(frame: .zero)
        
        self.backgroundColor = buttonColor
        self.buttonColor = buttonColor
        self.fontColor = fontColor
        self.titleLabel?.font = UIFont(name: Theme.Font.bold, size: Theme.Font.defaultSize)
        self.titleLabel?.textColor = fontColor
        self.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        self.setTitle(title, for: .normal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

@IBDesignable
class RollButton: UIButton {
    @IBInspectable var buttonColor: UIColor = Theme.rollButtonColor
    @IBInspectable var fontColor: UIColor = Theme.Font.color
    @IBInspectable var buttonHeight: CGFloat = 50.0
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.backgroundColor = buttonColor
        self.titleLabel?.font = UIFont(name: Theme.Font.bold, size: Theme.Font.defaultSize)
        self.titleLabel?.textColor = fontColor
        self.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        self.setTitle("Roll", for: .normal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

@IBDesignable
class CalculatorLabel: UILabel {
    @IBInspectable var labelHeight: CGFloat = 40.0
    @IBInspectable var numOfLines: Int = 1
    @IBInspectable var fontColor: UIColor = Theme.Font.color
    @IBInspectable var fontSize: CGFloat = Theme.Font.defaultSize
    @IBInspectable var labelColor: UIColor = Theme.labelBackgroundColor
    @IBInspectable var title: String?
    @IBInspectable private var labelInsets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
    
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + labelInsets.left + labelInsets.right,
                      height: size.height + labelInsets.top + labelInsets.bottom)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    convenience init(insets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0), numOfLines: Int = 1, fontColor: UIColor = Theme.Font.color, fontSize: CGFloat = Theme.Font.defaultSize, labelColor: UIColor = Theme.labelBackgroundColor, labelHeight: CGFloat = 40.0, title: String? = nil) {
        self.init(frame: .zero)
        self.fontColor = fontColor
        self.fontSize = fontSize
        self.labelColor = labelColor
        self.labelHeight = labelHeight
        self.labelInsets = insets
        self.numOfLines = numOfLines
        if let title = title {
            self.title = title
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.adjustsFontSizeToFitWidth = true
        self.backgroundColor = labelColor
        self.font = UIFont(name: Theme.Font.regular, size: fontSize)
        self.minimumScaleFactor = 0.5
        self.textAlignment = .center
        self.textColor = fontColor
        self.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(
            top: labelInsets.top,
            left: labelInsets.left,
            bottom: labelInsets.bottom,
            right: labelInsets.right
        )
        
        super.drawText(in: rect.inset(by: insets))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
