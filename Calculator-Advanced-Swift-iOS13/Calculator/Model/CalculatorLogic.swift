//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Guofeng Luo on 2024/5/31.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermidiateCalculation: (n1: Double, calcMethod: String)?
    

    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermidiateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil

    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let  n1 = intermidiateCalculation?.n1,
           let operation = intermidiateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The opertion passed in dose not match any of cases.")
            }
        }
        return nil
    }
}
