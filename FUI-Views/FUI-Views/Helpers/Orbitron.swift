//
//  Orbitron.swift
//  Helpers
//
//  Created by IVAN CAMPOS on 6/7/24.
//

import Foundation

public let ORBITRON_FONT = "Orbitron-Regular"
public let ORBITRON_BOLD_FONT = "Orbitron-ExtraBold"

public func futureScape(_ input: String) -> String {
    var result = input.uppercased()
    let transformations: [String: String] = [
        "7": "\u{E002}",
        "4": "\u{E007}",
        "2": "\u{0032}",
        "E": "\u{039E}",
        "Q": "\u{0051}",
        "S": "\u{0053}",
        "J": "\u{004A}",
        "O": "\u{004F}",
        "B": "\u{00DF}",
    ]
    
    for (pattern, replacement) in transformations {
        result = result.replacingOccurrences(of: pattern, with: replacement, options: .regularExpression, range: nil)
    }
    
    return result
}
