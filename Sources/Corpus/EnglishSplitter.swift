//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 11.02.2022.
//

import Foundation
import Dictionary

public class EnglishSplitter : SentenceSplitter{
    
    /// Returns shortcut words in English language.
    /// - Returns: Shortcut words in English language.
    public override func shortCuts() -> [String]{
        return ["dr", "prof", "org", "II", "III", "IV", "VI", "VII", "VIII", "IX",
                "X", "XI", "XII", "XIII", "XIV", "XV", "XVI", "XVII", "XVIII", "XIX",
                "XX", "min", "km", "jr", "mrs", "sir"]
    }
    
    /// Returns English lowercase letters.
    /// - Returns: English lowercase letters.
    public override func lowerCaseLetters() -> String{
        return EnglishLanguage.LOWERCASE_LETTERS
    }
    
    /// Returns English UPPERCASE letters.
    /// - Returns: English UPPERCASE letters.
    public override func upperCaseLetters() -> String{
        return EnglishLanguage.UPPERCASE_LETTERS
    }

}
