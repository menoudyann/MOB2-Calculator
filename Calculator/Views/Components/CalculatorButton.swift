//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Yann Menoud on 19.03.2024.
//

import SwiftUI

extension CalculatorView{
    struct CalculatorButton: View {
        
        let buttonType: ButtonType
        @EnvironmentObject private var viewModel: ViewModel
        
        var body: some View {
            Button(buttonType.description) {
                viewModel.performAction(for: buttonType)
            }
            .buttonStyle(CalculatorButtonStyle(
                size: 80,
                backgroundColor: buttonType.backgroundColor,
                foregroundColor: buttonType.foregroundColor,
                isWide: buttonType == .digit(.zero))
            )
        }
        
        private func getButtonSize() -> CGFloat {
            let screenWidth = UIScreen.main.bounds.width
            let buttonCount: CGFloat = 4
            let spacingCount = buttonCount + 1
            return (screenWidth - (spacingCount * Constants.padding)) / buttonCount
        }
        
        private func getBackgroundColor() -> Color {
            return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.foregroundColor : buttonType.backgroundColor
        }
        
        private func getForegroundColor() -> Color {
            return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.backgroundColor : buttonType.foregroundColor
        }
    }
}

struct CalculatorView_CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView.CalculatorButton(buttonType: .digit(.five))
    }
}
