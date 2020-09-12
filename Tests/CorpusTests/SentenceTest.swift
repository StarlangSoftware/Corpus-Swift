import XCTest
import Dictionary
@testable import Corpus

final class SentenceTest: XCTestCase {

    var sentence: Sentence = Sentence(sentence: "")

    override func setUp(){
        self.sentence = Sentence()
        self.sentence.addWord(word: Word(name: "ali"))
        self.sentence.addWord(word: Word(name: "topu"))
        self.sentence.addWord(word: Word(name: "at"))
        self.sentence.addWord(word: Word(name: "mehmet"))
        self.sentence.addWord(word: Word(name: "ayşeyle"))
        self.sentence.addWord(word: Word(name: "gitti"))
    }

    func testGetWord(){
        XCTAssertEqual(Word(name: "ali"), self.sentence.getWord(index: 0))
        XCTAssertEqual(Word(name: "at"), self.sentence.getWord(index: 2))
        XCTAssertEqual(Word(name: "gitti"), self.sentence.getWord(index: 5))
    }

    func testGetIndex(){
        XCTAssertEqual(0, self.sentence.getIndex(word: Word(name: "ali")))
        XCTAssertEqual(2, self.sentence.getIndex(word: Word(name: "at")))
        XCTAssertEqual(5, self.sentence.getIndex(word: Word(name: "gitti")))
    }

    func testWordCount(){
        XCTAssertEqual(6, self.sentence.wordCount())
    }

    func testCharCount(){
        XCTAssertEqual(27, self.sentence.charCount())
    }

    static var allTests = [
        ("testExample1", testGetWord),
        ("testExample2", testGetIndex),
        ("testExample3", testWordCount),
        ("testExample4", testCharCount),
    ]
}
