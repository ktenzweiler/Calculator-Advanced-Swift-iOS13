//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Kyle Enzweiler on 2/19/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation : (n1: Double, calculation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
    
        if let n = number {
            if symbol == "+/-" {
                return n * -1.0
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return n / 100
            } else if symbol == "=" {
                return performTwoNumCalculation(n2: n)
            } else {
                intermediateCalculation = (n1: n, calculation: symbol)
            }
        }
        
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
            let operation =
            intermediateCalculation?.calculation {
            switch operation {
                case "+": return n1 + n2
                case "-": return n1 - n2
                case "×": return n1 * n2
                case "÷": return n1 / n2
            default: fatalError("the operation passed in does not match any cases")
            }
        }
        return nil
    }
}
