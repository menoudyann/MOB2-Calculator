//
//  Digit.swift
//  Calculator
//
//  Created by Yann Menoud on 17.03.2024.
//

import Foundation

enum Digit: Int, CaseIterable, CustomStringConvertible {
     case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String{
        "\(rawValue)"
    }
}
