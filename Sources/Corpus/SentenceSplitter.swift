//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 10.09.2020.
//

import Foundation

public class SentenceSplitter{
    public static let SEPARATORS = "()[]{}\"'\u{05F4}\u{FF02}\u{055B}"
    public static let SENTENCE_ENDERS = ".?!…"
    public static let PUNCTUATION_CHARACTERS = ",:;"

    public func split(line: String) -> [Sentence]{
        return []
    }
}
