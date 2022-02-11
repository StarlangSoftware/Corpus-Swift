//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 11.02.2022.
//

import Foundation
import Dictionary

public class EnglishSplitter : SentenceSplitter{
    
    public override func shortCuts() -> [String]{
        return ["dr", "prof", "org", "II", "III", "IV", "VI", "VII", "VIII", "IX",
                "X", "XI", "XII", "XIII", "XIV", "XV", "XVI", "XVII", "XVIII", "XIX",
                "XX", "min", "km", "jr", "mrs", "sir"]
    }
    
    public override func lowerCaseLetters() -> String{
        return EnglishLanguage.LOWERCASE_LETTERS
    }
    
    public override func upperCaseLetters() -> String{
        return EnglishLanguage.UPPERCASE_LETTERS
    }

}
