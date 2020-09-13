//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 12.09.2020.
//

import Foundation

public class Paragraph{
    
    private var __sentences: [Sentence] = []

    /**
    A constructor of Paragraph class which creates a list sentences.
    */
    public init(){
        
    }

    /**
    The addSentence method adds given sentence to sentences list.

    - Parameter s : Sentence type input to add sentences.
    */
    public func addSentence(s: Sentence){
        self.__sentences.append(s)
    }

    /**
    The sentenceCount method finds the size of the list sentences.

    - Returns: The size of the list sentences.
    */
    public func sentenceCount() -> Int{
        return self.__sentences.count
    }

    /**
    The getSentence method finds the sentence from sentences list at given index.

    - Parameter index : used to get a sentence.

    - Returns: sentence at given index.
    */
    public func getSentence(index: Int) -> Sentence{
        return self.__sentences[index]
    }

}
