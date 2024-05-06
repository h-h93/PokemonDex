//
//  String+Ext.swift
//  PokemonDex
//
//  Created by hanif hussain on 06/03/2024.
//

import Foundation

extension String {
    
    // remove HTML tags from string
    var stripHTML: String {
        return self.replacingOccurrences(of: "<[^>]+>\n \u{0C}", with: "", options: .regularExpression)
    }
    
    var stripPokedexCharacters: String {
        let replaceNChar = self.replacingOccurrences(of: "\n", with: " ", options: .regularExpression)
        let replaceUChar = replaceNChar.replacingOccurrences(of: "\u{0C}", with: " ", options: .regularExpression)
        return replaceUChar
    }
    
    
    func getPokemonNumberFromUrl(urlString: String) -> String? {
        if let lastPathComponent = URL(string: urlString)?.lastPathComponent {
            if let number = Int(lastPathComponent) {
                return String(number)
            } else {
                return nil
            }
        }
        return nil
    }
}
