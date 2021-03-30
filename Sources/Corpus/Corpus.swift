//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 12.09.2020.
//

import Foundation
import DataStructure
import Dictionary

open class Corpus{
    
    private var paragraphs: [Paragraph] = []
    public var sentences: [Sentence] = []
    public var wordList: CounterHashMap<Word> = CounterHashMap<Word>()
    public var fileName: String = ""

    /**
     * A constructor of {@link Corpus} class which creates new {@link ArrayList} for sentences and a {@link CounterHashMap}
     * for wordList.
     */
    public init(){
    }
    
    /**
    Constructor of Corpus class which takes a file name as an input. Then reads the input file line by line
    and calls addSentence method with each read line.

    - Parameter fileName : String file name input that will be read.
    */
    public init(fileName: String){
        self.fileName = fileName
        let thisSourceFile = URL(fileURLWithPath: #file)
        let thisDirectory = thisSourceFile.deletingLastPathComponent()
        let url = thisDirectory.appendingPathComponent(fileName)
        do{
            let fileContent = try String(contentsOf: url, encoding: .utf8)
            let lines = fileContent.split(whereSeparator: \.isNewline)
            for line in lines{
                self.addSentence(s: Sentence(sentence: String(line)))
            }
        } catch {
        }
    }
    
    /**
     * Another constructor of {@link Corpus} class which takes {@link SentenceSplitter}  as an input besides the file name.
     * It reads input file line by line and calls the sentenceSplitter method with each line, then calls addSentence method
     * with each sentence.
     *
        - Parameters:
            - fileName : String file name input that will be read.
            - sentenceSplitter: {@link SentenceSplitter} type input.
     */
    public init(fileName: String, sentenceSplitter: SentenceSplitter){
        self.fileName = fileName
        let thisSourceFile = URL(fileURLWithPath: #file)
        let thisDirectory = thisSourceFile.deletingLastPathComponent()
        let url = thisDirectory.appendingPathComponent(fileName)
        do{
            let fileContent = try String(contentsOf: url, encoding: .utf8)
            let lines = fileContent.split(whereSeparator: \.isNewline)
            for line in lines{
                let sentences = sentenceSplitter.split(line: String(line))
                let paragraph = Paragraph()
                for sentence in sentences{
                    paragraph.addSentence(s: sentence)
                }
                self.addParagraph(p: paragraph)
            }
        } catch {
        }
    }
    
    /**
    Constructor of Corpus class which takes a file name as an input. Then reads the input file line by line
    and calls addSentence method with each read line.

    - Parameters:
        - fileName : String file name input that will be read.
        - languageChecker: {@link LanguageChecker} type input.
    */
    public init(fileName: String, languageChecker: LanguageChecker){
        self.fileName = fileName
        let thisSourceFile = URL(fileURLWithPath: #file)
        let thisDirectory = thisSourceFile.deletingLastPathComponent()
        let url = thisDirectory.appendingPathComponent(fileName)
        do{
            let fileContent = try String(contentsOf: url, encoding: .utf8)
            let lines = fileContent.split(whereSeparator: \.isNewline)
            for line in lines{
                self.addSentence(s: Sentence(sentence: String(line), languageChecker: languageChecker))
            }
        } catch {
        }
    }
    
    /**
    The combine method takes a Corpus as an input and adds each sentence of sentences list.

    - Parameter corpus : Corpus type input.
    */
    public func combine(corpus: Corpus){
        for sentence in corpus.sentences{
            self.addSentence(s: sentence)
        }
    }

    /**
    The addSentence method takes a Sentence as an input. It adds given input to sentences list and loops
    through the each word in sentence and puts these words into wordList CounterHashMap.

    - Parameter s : Sentence type input that will be added to sentences list and its words will be added to wordList
        CounterHashMap.
    */
    public func addSentence(s: Sentence){
        self.sentences.append(s)
        for i in 0..<s.wordCount(){
            let w = s.getWord(index: i)
            self.wordList.put(key: w)
        }
    }

    /**
    The numberOfWords method loops through the sentences list and accumulates the number of words in sentence.

    - Returns: size which holds the total number of words.
    */
    public func numberOfWords() -> Int{
        var size : Int = 0
        for s in self.sentences{
            size += s.wordCount()
        }
        return size
    }

    /**
    The contains method takes a String word as an input and checks whether wordList CounterHashMap has the
    given word and returns true if so, otherwise returns false.

    - Parameter word : String input to check.

    - Returns: True if wordList has the given word, False otherwise.
    */
    public func contains(word: String) -> Bool{
        return self.wordList.count(key: Word(name: word)) != 0
    }

    /**
    The addParagraph method takes a Paragraph type input. It gets the sentences in the given paragraph and
    add these to the sentences list and the words in the sentences to the wordList CounterHashMap.

    - Parameter p : Paragraph type input to add sentences and wordList.
    */
    public func addParagraph(p: Paragraph){
        self.paragraphs.append(p)
        for i in 0..<p.sentenceCount(){
            self.addSentence(s: p.getSentence(index: i))
        }
    }

    /**
    Getter for the file name.

    - Returns: file name.
    */
    public func getFileName() -> String{
        return self.fileName
    }

    /**
    Getter for the wordList.

    - Returns: The keySet of wordList.
    */
    public func getWordList() -> Set<Word>{
        return Set(self.wordList.keys())
    }

    /**
    The wordCount method returns the size of the wordList CounterHashMap.

    - Returns: The size of the wordList CounterHashMap.
    */
    public func wordCount() -> Int{
        return self.wordList.size()
    }

    /**
    The getCount method returns the count value of given word.

    - Parameter word : Word type input to check.

    - Returns: The count value of given word.
    */
    public func getCount(word: Word) -> Int{
        return self.wordList.count(key: word)
    }

    /**
    The sentenceCount method returns the size of the sentences list.

    - Returns: The size of the sentences list.
    */
    public func sentenceCount() -> Int{
        return self.sentences.count
    }

    /**
    Getter for getting a sentence at given index.

    - Parameter index : index to get sentence from.

    - Returns: The sentence at given index.
    */
    public func getSentence(index: Int) -> Sentence{
        return self.sentences[index]
    }

    /**
    The paragraphCount method returns the size of the paragraphs list.

    - Returns: The size of the paragraphs list.
    */
    public func paragraphCount() -> Int{
        return self.paragraphs.count
    }

    /**
    Getter for getting a paragraph at given index.

    - Parameter index : index to get paragraph from.

    - Returns: The paragraph at given index.
    */
    public func getParagraph(index: Int) -> Paragraph{
        return self.paragraphs[index]
    }

    /**
    The maxSentenceLength method finds the sentence with the maximum number of words and returns this number.

    - Returns: maximum length.
    */
    public func maxSentenceLength() -> Int{
        var maxLength : Int = 0
        for s in self.sentences{
            if s.wordCount() > maxLength{
                maxLength = s.wordCount()
            }
        }
        return maxLength
    }

    /**
    The getAllWordsAsList method creates new list of lists and adds each word in each sentence of sentences
    list into new list.

    - Returns: Newly created and populated list.
    */
    public func getAllWordsAsList() -> [[Word]]{
        var allWords : [[Word]] = []
        for i in 0..<self.sentenceCount(){
            allWords.append(self.getSentence(index: i).getWords())
        }
        return allWords
    }

    /**
    The shuffleSentences method randomly shuffles sentences list with given seed value.

    - Parameter seed : value to randomize shuffling.
    */
    public func shuffleSentences(seed: Int){
    }

    /**
    The getTrainCorpus method takes two integer inputs foldNo and foldCount for determining train data size and
    count of fold respectively. Initially creates a new empty Corpus, then finds the sentenceCount as N. Then,
    starting from the index 0 it loops through the index (foldNo * N) / foldCount and add each sentence of sentences
    list to new Corpus. Later on, starting from the index ((foldNo + 1) * N) / foldCount, it loops through the index
    N and add each sentence of sentences list to new Corpus.

    - Parameters:
        - foldNo : Integer input for train set size.
        - foldCount : Integer input for counting fold.

    - Returns: The newly created and populated Corpus.
    */
    public func getTrainCorpus(foldNo: Int, foldCount: Int) -> Corpus{
        let trainCorpus = Corpus()
        let N = self.sentenceCount()
        for i in 0..<(foldNo * N) / foldCount{
            trainCorpus.addSentence(s: self.sentences[i])
        }
        for i in (foldNo + 1) * N / foldCount..<N{
            trainCorpus.addSentence(s: self.sentences[i])
        }
        return trainCorpus
    }

    /**
    The getTestCorpus method takes two integer inputs foldNo and foldCount for determining test data size and count
    of fold respectively. Initially creates a new empty Corpus, then finds the sentenceCount as N. Then, starting
    from the index (foldNo * N) / foldCount it loops through the index ((foldNo + 1) * N) / foldCount and add each
    sentence of sentences list to new Corpus.

    - Parameters:
        - foldNo : Integer input for test size.
        - foldCount : Integer input counting fold.

    - Returns: The newly created and populated Corpus.
    */
    public func getTestCorpus(foldNo: Int, foldCount: Int) -> Corpus{
        let testCorpus = Corpus()
        let N = self.sentenceCount()
        for i in foldNo * N / foldCount..<(foldNo + 1) * N / foldCount{
            testCorpus.addSentence(s: self.sentences[i])
        }
        return testCorpus
    }


}
