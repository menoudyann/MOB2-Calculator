//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Yann Menoud on 19.03.2024.
//

import Foundation
import Combine

extension CalculatorView {
    final class ViewModel: ObservableObject {
        
        @Published private var calculator = Calculator()
        
        var displayText: String {
            return calculator.displayText
        }
        
        var buttonTypes: [[ButtonType]] {
            let clearType: ButtonType = calculator.showAllClear ? .allClear : .clear
            return [
                [clearType, .negative, .percent, .operation(.divide)],
                [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.mulitply)],
                [.digit(.four), .digit(.five), .digit(.six), .operation(.subtract)],
                [.digit(.one), .digit(.two), .digit(.three), .operation(.add)],
                [.digit(.zero), .decimal, .equals]
            ]
        }
        
        func performAction(for buttonType: ButtonType) {
            switch buttonType {
            case .digit(let digit):
                calculator.setDigit(digit)
            case .operation(let operation):
                calculator.setOperation(operation)
            case .negative:
                calculator.toggleSign()
            case .percent:
                calculator.setPercent()
            case .decimal:
                calculator.setDecimal()
            case .equals:
                calculator.evaluate()
            case .allClear:
                calculator.allClear()
            case .clear:
                calculator.clear()
            }
        }
        
        /// Checks if current buttonType of type .arithmeticOperation is active
        func buttonTypeIsHighlighted(buttonType: ButtonType) -> Bool {
            guard case .operation(let operation) = buttonType else { return false}
            return calculator.operationIsHighlighted(operation)
        }
    }
}
