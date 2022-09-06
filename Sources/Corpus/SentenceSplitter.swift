//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 10.09.2020.
//

import Foundation
import Dictionary

public class SentenceSplitter{
    public static let SEPARATORS = "\n()[]{}\"'\u{05F4}\u{FF02}\u{055B}’”‘“­​"
    public static let SENTENCE_ENDERS = ".?!…"
    public static let PUNCTUATION_CHARACTERS = ",:;‚"

    public func shortCuts() -> [String]{
        return []
    }
    
    public func lowerCaseLetters() -> String{
        return ""
    }
    
    public func upperCaseLetters() -> String{
        return ""
    }
    
    /**
    The listContains method has a String array shortcuts which holds the possible abbreviations that might end with
    a '.' but not a sentence finisher word. It also takes a String as an input and loops through the shortcuts array
    and returns true if given String has any matching item in the shortcuts array.

    - Parameter currentWord : String input to check.

    - Returns: True if contains any abbreviations, False otherwise.
    */
    private func __listContains(currentWord: String) -> Bool{
        return shortCuts().contains(currentWord)
    }

    /**
    The isNextCharUpperCaseOrDigit method takes a String line and an Int i as inputs. First it compares each char in
    the input line with " " and SEPARATORS ({@literal ()[]{}"'״＂՛}) and increment i by one until a mismatch or end
    of line.

    When i equals to line length or contains one of the uppercase letters or digits it returns true, false
    otherwise.

    - Parameters:
        - line : String to check.
        - i : defining starting index.

    - Returns: True if next char is uppercase or digit, False otherwise.
    */
    private func __isNextCharUpperCaseOrDigit(line: String, i: Int) -> Bool{
        var j : Int = i
        while j < line.count && (Word.charAt(s: line, i: j) == " " || SentenceSplitter.SEPARATORS.contains(Word.charAt(s: line, i: j))){
            j = j + 1
        }
        if j == line.count || (upperCaseLetters() + Language.DIGITS + "-").contains(Word.charAt(s: line, i: j)){
            return true
        } else {
            return false
        }
    }

    /**
    The isPreviousWordUpperCase method takes a String line and an Int i as inputs. First it compares each char in
    the input line with " " and checks each char whether they are lowercase letters or one of the qxw. And decrement
    input i by one till this condition is false.

    When i equals to -1 or contains one of the uppercase letters or one of the QXW it returns true, false otherwise.

    - Parameters:
        - line : String to check.
        - i : defining ending index.

    - Returns: True if previous char is uppercase or one of the QXW, False otherwise.
    */
    private func __isPreviousWordUpperCase(line: String, i: Int) -> Bool{
        var j : Int = i
        while j >= 0 && (Word.charAt(s: line, i: j) == " " || (lowerCaseLetters() + "qxw").contains(Word.charAt(s: line, i: j))){
            j = j - 1
        }
        if j == -1 || (upperCaseLetters() + "QWX").contains(Word.charAt(s: line, i: j)){
            return true
        } else {
            return false
        }
    }

    /**
    The isNextCharUpperCase method takes a String line and an Int i as inputs. First it compares each char in
    the input line with " " and increment i by one until a mismatch or end of line.

    When i equals to line length or contains one of the uppercase letters it returns true, false otherwise.

    - Parameters:
        - line : String to check.
        - i : defining starting index.

    - Returns: True if next char is uppercase, False otherwise.
    */
    private func __isNextCharUpperCase(line: String, i: Int) -> Bool{
        var j : Int = i
        while j < line.count && Word.charAt(s: line, i: j) == " "{
            j = j + 1
        }
        if j == line.count || (upperCaseLetters() + "\"\'").contains(Word.charAt(s: line, i: j)){
            return true
        } else {
            return false
        }
    }

    /**
    The isNameShortcut method takes a String word as an input. First, if the word length is 1, and currentWord
    contains UPPERCASE_LETTERS letters than it returns true.

    Secondly, if the length of the word is 3 (i.e it is a shortcut) and it has a '.' at its 1st index and
    currentWord's 2nd  index is an uppercase letter it also returns true. (Ex : m.A)

    - Parameter currentWord : String input to check whether it is a shortcut.

    - Returns: True if given input is a shortcut, False otherwise.
    */
    private func __isNameShortcut(currentWord: String) -> Bool{
        if currentWord.count == 1 && upperCaseLetters().contains(currentWord){
            return true
        }
        if currentWord.count == 3 && Word.charAt(s: currentWord, i: 1) == "." && upperCaseLetters().contains(Word.charAt(s: currentWord, i: 2)){
            return true
        }
        return false
    }

    /**
    The repeatControl method takes a String word as an input, and a boolean exceptionMode and compress the
    repetitive chars. With the presence of exceptionMode it directly returns the given word. Then it declares a
    counter i and loops till the end of the given word. It compares the char at index i with the char at index (i+2)
    if they are equal then it compares the char at index i with the char at index (i+1) and increments i by one and
    returns concatenated result String with char at index i.

    - Parameters:
        - word : String input.
        - exceptionMode : boolean input for exceptional cases.

    - Returns: String result.
    */
    private func __repeatControl(word: String, exceptionMode: Bool) -> String{
        if exceptionMode{
            return word
        }
        var i : Int = 0
        var result : String = ""
        while i < word.count{
            if i < word.count - 2 && Word.charAt(s: word, i: i) == Word.charAt(s: word, i: i + 1) && Word.charAt(s: word, i: i) == Word.charAt(s: word, i: i + 2){
                while i < word.count - 1 && Word.charAt(s: word, i: i) == Word.charAt(s: word, i: i + 1){
                    i = i + 1
                }
            }
            result = result + String(Word.charAt(s: word, i: i))
            i = i + 1
        }
        return result
    }

    /**
    The isApostrophe method takes a String line and an Integer i as inputs. Initially declares a String
    apostropheLetters which consists of abcçdefgğhıijklmnoöprsştuüvyzABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ,
    âàáäãèéêëíîòóôûúqwxÂÈÉÊËÌÒÛQWX and  0123456789. Then, it returns true if the result of contains method which
    checks the existence of previous char and next char at apostropheLetters returns true, returns false otherwise.

    - Parameters:
        - line : String input to check.
        - i : index.

    - Returns: True if apostropheLetters contains previous char and next char, False otherwise.
    */
    private func __isApostrophe(line: String, i: Int) -> Bool{
        let apostropheLetters = upperCaseLetters() + lowerCaseLetters() + Language.EXTENDED_LANGUAGE_CHARACTERS + Language.DIGITS
        if i > 0 && i + 1 < line.count{
            let previousChar = Word.charAt(s: line, i: i - 1)
            let nextChar = Word.charAt(s: line, i: i + 1)
            return apostropheLetters.contains(previousChar) && apostropheLetters.contains(nextChar)
        } else {
            return false
        }
    }

    /**
    The numberExistsBeforeAndAfter method takes a String line and an Integer i as inputs. Then, it returns true if
    the result of contains method, which compares the previous char and next char with 0123456789, returns true and
    false otherwise.

    - Parameters:
        - line : String input to check.
        - i : index.

    - Returns: True if previous char and next char is a digit, False otherwise.
    */
    private func __numberExistsBeforeAndAfter(line: String, i: Int) -> Bool{
        if i > 0 && i + 1 < line.count{
            let previousChar = Word.charAt(s: line, i: i - 1)
            let nextChar = Word.charAt(s: line, i: i + 1)
            return Language.DIGITS.contains(previousChar) && Language.DIGITS.contains(nextChar)
        } else {
            return false
        }
    }

    /**
    The isTime method takes a String line and an Integer i as inputs. Then, it returns true if
    the result of the contains method, which compares the previous char, next char and two next chars with
    0123456789, returns true and false otherwise.

    - Parameters:
        - line : String input to check.
        - i : index.

    - Returns: True if previous char, next char and two next chars are digit, False otherwise.
    */
    private func __isTime(line: String, i: Int) -> Bool{
        if i > 0 && i + 2 < line.count{
            let previousChar = Word.charAt(s: line, i: i - 1)
            let nextChar = Word.charAt(s: line, i: i + 1)
            let twoNextChar = Word.charAt(s: line, i: i + 2)
            return Language.DIGITS.contains(previousChar) && Language.DIGITS.contains(nextChar) && Language.DIGITS.contains(twoNextChar)
        } else {
            return false
        }
    }

    /**
    The split method takes a String line as an input. Firstly it creates a new sentence as currentSentence a new
    list as sentences. Then loops till the end of the line and checks some conditions;
    If the char at ith index is a separator;

    ' : assigns currentWord as currentWord'
    { : increment the curlyBracketCount
    } : decrement the curlyBracketCount
    " : increment the specialQuotaCount
    " : decrement the specialQuotaCount
    ( : increment roundParenthesisCount
    ) : decrement roundParenthesisCount
    [ : increment bracketCount
    ] : decrement bracketCount
    " : assign quotaCount as 1- quotaCount
    ' : assign apostropheCount as 1- apostropheCount

    If the currentWord is not empty, it adds the currentWord after repeatControl to currentSentence.

    If the char at index i is " and  bracketCount, specialQuotaCount, curlyBracketCount, roundParenthesisCount, and
    quotaCount equal to 0 and also the next char is uppercase or digit, it adds currentSentence to sentences.

    If the char at ith index is a sentence ender;

    . and currentWord is www : assigns webMode as true. Ex: www.google.com
    . and currentWord is a digit or in web or e-mail modes : assigns currentWord as currentWord+char(i) Ex: 1.
    . and currentWord is a shortcut or an abbreviation : assigns currentWord as currentWord+char(i) and adds
    currentWord to currentSentence. Ex : bkz.
    ' and next char is uppercase or digit: add word to currentSentence as ' and add currentSentence to sentences.

    If the char at index i is ' ', i.e space, add word to currentSentence and assign "" to currentSentence.
    If the char at index i is -,  add word to currentSentence and add sentences when the wordCount of
    currentSentence greater than 0.

    If the char at ith index is a punctuation;
    : and if currentWord is "https" : assign webMode as true.
    , and there exists a number before and after : assign currentWord as currentWord+char(i) Ex: 1,2
    : and if line is a time : assign currentWord as currentWord+char(i) Ex: 12:14:24
    - and there exists a number before and after : assign currentWord as currentWord+char(i) Ex: 12-1
    {@literal @} : assign emailMode as true.

    - Parameter line : String input to split.

    - Returns: sentences list which holds split line.
    */
    public func split(line: String) -> [Sentence]{
        var emailMode : Bool = false
        var webMode : Bool = false
        var i : Int = 0
        var specialQuotaCount : Int = 0
        var roundParenthesisCount : Int = 0
        var bracketCount : Int = 0
        var curlyBracketCount : Int = 0
        var quotaCount : Int = 0
        var apostropheCount : Int = 0
        var currentSentence : Sentence = Sentence()
        var currentWord : String = ""
        var sentences : [Sentence] = []
        while i < line.count{
            if SentenceSplitter.SEPARATORS.contains(Word.charAt(s: line, i: i)){
                if Word.charAt(s: line, i: i) == "'" && currentWord != "" && self.__isApostrophe(line: line, i: i){
                    currentWord = currentWord + String(Word.charAt(s: line, i: i))
                } else {
                    if currentWord != ""{
                        currentSentence.addWord(word: Word(name: self.__repeatControl(word: currentWord, exceptionMode: webMode || emailMode)))
                    }
                    if Word.charAt(s: line, i: i) != "\n"{
                        currentSentence.addWord(word: Word(name: "" + String(Word.charAt(s: line, i: i))))
                    }
                    currentWord = ""
                    switch Word.charAt(s: line, i: i) {
                        case "{":
                            curlyBracketCount = curlyBracketCount + 1
                        case "}":
                            curlyBracketCount = curlyBracketCount - 1
                        case "\u{FF02}":
                            specialQuotaCount = specialQuotaCount + 1
                        case "\u{05F4}":
                            specialQuotaCount = specialQuotaCount - 1
                        case "“":
                            specialQuotaCount = specialQuotaCount + 1
                        case "”":
                            specialQuotaCount = specialQuotaCount - 1
                        case "‘":
                            specialQuotaCount = specialQuotaCount + 1
                        case "’":
                            specialQuotaCount = specialQuotaCount - 1
                        case "(":
                            roundParenthesisCount = roundParenthesisCount + 1
                        case ")":
                            roundParenthesisCount = roundParenthesisCount - 1
                        case "[":
                            bracketCount = bracketCount + 1
                        case "]":
                            bracketCount = bracketCount - 1
                        case "\"":
                            quotaCount = 1 - quotaCount
                        case "'":
                            apostropheCount = 1 - apostropheCount
                        default:
                            break
                    }
                    if Word.charAt(s: line, i: i) == "\"" && bracketCount == 0 && specialQuotaCount == 0 && curlyBracketCount == 0 &&
                        roundParenthesisCount == 0 && quotaCount == 0 && self.__isNextCharUpperCaseOrDigit(line: line, i: i + 1){
                        sentences.append(currentSentence)
                        currentSentence = Sentence()
                    }
                }
            } else {
                if SentenceSplitter.SENTENCE_ENDERS.contains(Word.charAt(s: line, i: i)){
                    if Word.charAt(s: line, i: i) == "." && currentWord.lowercased() == "www"{
                        webMode = true
                    }
                    if Word.charAt(s: line, i: i) == "." && currentWord != "" && (webMode || emailMode || (TurkishLanguage.DIGITS.contains(Word.charAt(s: line, i: i - 1)) && !self.__isNextCharUpperCaseOrDigit(line: line, i: i + 1))){
                        currentWord = currentWord + String(Word.charAt(s: line, i: i))
                        currentSentence.addWord(word: Word(name: currentWord))
                        currentWord = ""
                    } else {
                        if Word.charAt(s: line, i: i) == "." && (self.__listContains(currentWord: currentWord) || self.__isNameShortcut(currentWord: currentWord)){
                            currentWord = currentWord + String(Word.charAt(s: line, i: i))
                            currentSentence.addWord(word: Word(name: currentWord))
                            currentWord = ""
                        } else {
                            if currentWord != ""{
                                currentSentence.addWord(word: Word(name: self.__repeatControl(word: currentWord, exceptionMode: webMode || emailMode)))
                            }
                            currentWord = "" + String(Word.charAt(s: line, i: i))
                            i = i + 1
                            while i < line.count && SentenceSplitter.SENTENCE_ENDERS.contains(Word.charAt(s: line, i: i)){
                                i = i + 1
                            }
                            i = i - 1
                            currentSentence.addWord(word: Word(name: currentWord))
                            if roundParenthesisCount == 0 && bracketCount == 0 && curlyBracketCount == 0 && quotaCount == 0{
                                if i + 1 < line.count && Word.charAt(s: line, i: i + 1) == "'" && apostropheCount == 1 && self.__isNextCharUpperCaseOrDigit(line: line, i: i + 2){
                                    currentSentence.addWord(word: Word(name: "'"))
                                    i = i + 1
                                    sentences.append(currentSentence)
                                    currentSentence = Sentence()
                                } else {
                                    if i + 2 < line.count && Word.charAt(s: line, i: i + 1) == " " && Word.charAt(s: line, i: i + 2) == "'" && apostropheCount == 1 && self.__isNextCharUpperCaseOrDigit(line: line, i: i + 3){
                                        currentSentence.addWord(word: Word(name: "'"))
                                        i += 2
                                        sentences.append(currentSentence)
                                        currentSentence = Sentence()
                                    } else {
                                        if self.__isNextCharUpperCaseOrDigit(line: line, i: i + 1){
                                            sentences.append(currentSentence)
                                            currentSentence = Sentence()
                                        }
                                    }
                                }
                            }
                            currentWord = ""
                        }
                    }
                } else {
                    if Word.charAt(s: line, i: i) == " "{
                        emailMode = false
                        webMode = false
                        if currentWord != ""{
                            currentSentence.addWord(word: Word(name: self.__repeatControl(word: currentWord, exceptionMode: webMode || emailMode)))
                            currentWord = ""
                        }
                    } else {
                        if Word.charAt(s: line, i: i) == "-" && !webMode && roundParenthesisCount == 0 && self.__isNextCharUpperCase(line: line, i: i + 1) && !self.__isPreviousWordUpperCase(line: line, i: i - 1){
                            if currentWord != "" && !TurkishLanguage.DIGITS.contains(currentWord){
                                currentSentence.addWord(word: Word(name: self.__repeatControl(word: currentWord, exceptionMode: webMode || emailMode)))
                            }
                            if currentSentence.wordCount() > 0{
                                sentences.append(currentSentence)
                            }
                            currentSentence = Sentence()
                            roundParenthesisCount = 0
                            bracketCount = 0
                            curlyBracketCount = 0
                            quotaCount = 0
                            specialQuotaCount = 0
                            if currentWord != "" && currentWord.range(of: "\\d+", options: .regularExpression) != nil{
                                currentSentence.addWord(word: Word(name: currentWord + " -"))
                            } else {
                                currentSentence.addWord(word: Word(name: "-"))
                            }
                            currentWord = ""
                        } else {
                            if SentenceSplitter.PUNCTUATION_CHARACTERS.contains(Word.charAt(s: line, i: i)) || TurkishLanguage.ARITHMETIC_CHARACTERS.contains(Word.charAt(s: line, i: i)){
                                if Word.charAt(s: line, i: i) == ":" && (currentWord == "http" || currentWord == "https"){
                                    webMode = true
                                }
                                if webMode{
                                    currentWord = currentWord + String(Word.charAt(s: line, i: i))
                                } else {
                                    if Word.charAt(s: line, i: i) == "," && self.__numberExistsBeforeAndAfter(line: line, i: i){
                                        currentWord = currentWord + String(Word.charAt(s: line, i: i))
                                    } else {
                                        if Word.charAt(s: line, i: i) == ":" && self.__isTime(line: line, i: i){
                                            currentWord = currentWord + String(Word.charAt(s: line, i: i))
                                        } else {
                                            if Word.charAt(s: line, i: i) == "-" && self.__numberExistsBeforeAndAfter(line: line, i: i){
                                                currentWord = currentWord + String(Word.charAt(s: line, i: i))
                                            } else {
                                                if currentWord != ""{
                                                    currentSentence.addWord(word: Word(name: self.__repeatControl(word: currentWord, exceptionMode: webMode || emailMode)))
                                                }
                                                currentSentence.addWord(word: Word(name: "" + String(Word.charAt(s: line, i: i))))
                                                currentWord = ""
                                            }
                                        }
                                    }
                                }
                            } else {
                                if Word.charAt(s: line, i: i) == "@"{
                                    currentWord = currentWord + String(Word.charAt(s: line, i: i))
                                    emailMode = true
                                } else {
                                    currentWord = currentWord + String(Word.charAt(s: line, i: i))
                                }
                            }
                        }
                    }
                }
            }
            i = i + 1
        }
        if currentWord != ""{
            currentSentence.addWord(word: Word(name: self.__repeatControl(word: currentWord, exceptionMode: webMode || emailMode)))
        }
        if currentSentence.wordCount() > 0{
            sentences.append(currentSentence)
        }
        return sentences
    }
    
}
