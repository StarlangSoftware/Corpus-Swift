//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 12.09.2020.
//

import Foundation
import Dictionary

class Sentence : Equatable{
    
    private var words: [Word] = []
    
    public init(){
    }
    
    public init(url: URL){
        do{
            let fileContent = try String(contentsOf: url, encoding: .utf8)
            let lines = fileContent.split(whereSeparator: \.isNewline)
            for line in lines{
                let wordList : [String] = line.split(separator: " ").map(String.init)
                for word in wordList{
                    words.append(Word(name: word))
                }
            }
        }catch{
        }
    }

    /**
    Another constructor of Sentence class which takes a fileName as an input. It reads each word in the file
    and adds to words list.

    - Parameter sentence: input file to read words from.
    */
    public init(sentence: String){
        let wordList : [String] = sentence.split(separator: " ").map(String.init)
        for word in wordList{
            if word.count != 0{
                words.append(Word(name: word))
            }
        }
    }

    /**
     * Another constructor of {@link Sentence} class with two inputs; a String sentence and a {@link LanguageChecker}
     * languageChecker. It parses a sentence by " " and then check the language considerations. If it is a valid word,
     * it adds this word to the newly created {@link ArrayList} words.
        - Parameters:
            - sentence: String input.
            - languageChecker: {@link LanguageChecker} type input.
    */
    public init(sentence: String, languageChecker: LanguageChecker){
        let wordList : [String] = sentence.split(separator: " ").map(String.init)
        for word in wordList{
            if word.count != 0 && languageChecker.isValidWord(word: word){
                words.append(Word(name: word))
            }
        }
    }
    
    /**
    The equals method takes a Sentence as an input. First compares the sizes of both words lists and words
    of the Sentence input. If they are not equal then it returns false. Than it compares each word in the list.
    If they are equal, it returns true.

    - Parameter s : Sentence to compare.

    - Returns: True if words of two sentences are equal.
    */
    public static func == (lhs: Sentence, rhs: Sentence) -> Bool {
        if lhs.words.count != rhs.words.count{
            return false
        }
        for i in 0..<lhs.words.count{
            if lhs.words[i].getName() != rhs.words[i].getName(){
                return false;
            }
        }
        return true;
    }

    /**
    The getWord method takes an index input and gets the word at that index.

    - Parameter index : is used to get the word.

    - Returns: the word in given index.
    */
    public func getWord(index: Int) -> Word{
        return self.words[index]
    }

    /**
    The getWords method returns the words list.

    - Returns: Words ArrayList.
    */
    public func getWords() -> [Word]{
        return self.words
    }

    /**
    The getStrings method loops through the words list and adds each words' names to the newly created result list.

    - Returns: Result list which holds names of the words.
    */
    public func getStrings() -> [String]{
        var result : [String] = []
        for word in self.words{
            result.append(word.getName())
        }
        return result
    }

    /**
    The getIndex method takes a word as an input and finds the index of that word in the words list if it exists.

    - Parameter word : Word type input to search for.

    - Returns: Index of the found input, -1 if not found.
    */
    public func getIndex(word: Word) -> Int{
        return self.words.firstIndex(of: word)!
    }

    /**
    The wordCount method finds the size of the words list.

    - Returns: The size of the words list.
    */
    public func wordCount() -> Int{
        return self.words.count
    }

    /**
    The addWord method takes a word as an input and adds this word to the words list.

    - Parameter word : Word to add words list.
    */
    public func addWord(word: Word){
        self.words.append(word)
    }

    /**
    The charCount method finds the total number of chars in each word of words list.

    - Returns: number of the chars in the whole sentence.
    */
    public func charCount() -> Int{
        var total : Int = 0
        for word in self.words{
            total += word.charCount()
        }
        return total
    }

    /**
    The replaceWord method takes an index and a word as inputs. It removes the word at given index from words
    list and then adds the given word to given index of words.

    - Parameters:
        - i : index.
        - newWord : to add the words list.
    */
    public func replaceWord(i: Int, newWord: Word){
        self.words.remove(at: i)
        self.words.insert(newWord, at: i)
    }

    /**
    The safeIndex method takes an index as an input and checks whether this index is between 0 and the size of the
    words.

    - Parameter index : is used to check the safety.

    - Returns: true if an index is safe, false otherwise.
    */
    public func safeIndex(index: Int) -> Bool{
        return index >= 0 && index < self.words.count
    }

    /**
    The overridden toString method returns an accumulated string of each word in words list.

    - Returns: String result which has all the word in words list.
    */
    public func description() -> String{
        if self.words.count > 0{
            var result : String = self.words[0].description()
            for i in 1..<self.words.count{
                result = result + " " + self.words[i].description()
            }
            return result
        } else {
            return ""
        }
    }

    /**
    The writeToFile method writes the given file by using toString method.

    - Parameter fileName : file to write in.
    */
    public func writeToFile(fileName: String){
        let thisSourceFile = URL(fileURLWithPath: #file)
        let thisDirectory = thisSourceFile.deletingLastPathComponent()
        let url = thisDirectory.appendingPathComponent(fileName)
        let text = self.description() + "\n"
        do {
            try text.write(to: url, atomically: false, encoding: .utf8)
        }
        catch {
        }
    }

}
