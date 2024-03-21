//
//  ArithmeticOperation.swift
//  Calculator
//
//  Created by Yann Menoud on 17.03.2024.
//

import Foundation

enum Operation: CaseIterable, CustomStringConvertible {
    case add, subtract, mulitply, divide
    
    var description: String {
        switch self {
        case .add:
            return "+"
        case .subtract:
            return "-"
        case .mulitply:
            return "*"
        case .divide:
            return "÷"
        }
    }
}
