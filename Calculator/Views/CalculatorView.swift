//
//  CalculatorView.swift
//  Calculator
//
//  Created by Yann Menoud on 17.03.2024.
//

import SwiftUI

var buttonTypes: [[ButtonType]] {
    [[.allClear, .negative, .percent, .operation(.divide)],
     [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.mulitply)],
     [.digit(.four), .digit(.five), .digit(.six), .operation(.subtract)],
     [.digit(.one), .digit(.two), .digit(.three), .operation(.add)],
     [.digit(.zero), .decimal, .equals]]
}

struct CalculatorView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    
    
    var body: some View {
        VStack {
            Spacer()
            displayText
            buttonPad
        }
        .padding(Constants.padding)
        .background(Color.black)
    }
}

#Preview {
    CalculatorView()
}

// MARK: Components "displayText" and "buttonPad"
extension CalculatorView {
    
    private var displayText: some View {
        Text(viewModel.displayText)
            .padding()
            .foregroundColor(.white)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
            .font(.system(size: 88))
            .lineLimit(1) // only one line
            .minimumScaleFactor(0.2)
    }
    
    
    private var buttonPad: some View {
        VStack (spacing: Constants.padding){
            ForEach(viewModel.buttonTypes, id: \.self) { row in
                HStack (spacing: Constants.padding) {
                    ForEach(row, id: \.self) { buttonType in
                        CalculatorButton(buttonType: buttonType)
                    }
                }
            }
        }
    }
}

