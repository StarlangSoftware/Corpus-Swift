//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 10.09.2020.
//

import Foundation
import Dictionary

public class TurkishChecker: LanguageChecker {
    
    /**
    The isValidWord method takes an input String as a word than define all valid characters as a validCharacters
    string which has letters (abcçdefgğhıijklmnoöprsştuüvyzABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ),
    extended language characters (âàáäãèéêëíîòóôûúqwxÂÈÉÊËÌÒÛQWX),
    digits (0123456789),
    separators ({@literal ()[]{}"'״＂՛}),
    sentence enders (.?!…),
    arithmetic chars (+-=*\\),
    punctuation chars (,:;),
    special-meaning chars

    Then, loops through input word's each char and if a char in word does not in the validCharacters string it
    returns false, true otherwise.

    - Parameter word : String to check validity.

    - Returns: True if each char in word is valid, False otherwise.
    */
    public override func isValidWord(word: String) -> Bool{
        let specialMeaningCharacters = "$\\_|@%#£§&><"
        let validCharacters = TurkishLanguage.LETTERS + TurkishLanguage.EXTENDED_LANGUAGE_CHARACTERS +
                          TurkishLanguage.DIGITS + SentenceSplitter.SEPARATORS + SentenceSplitter.SENTENCE_ENDERS +
                          TurkishLanguage.ARITHMETIC_CHARACTERS + SentenceSplitter.PUNCTUATION_CHARACTERS + specialMeaningCharacters
        for i in 0..<word.count{
            if !validCharacters.contains(Word.charAt(s: word, i: i)){
                return false
            }
        }
        return true
    }

}
