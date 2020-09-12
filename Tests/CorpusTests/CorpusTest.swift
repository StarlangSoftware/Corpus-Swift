import XCTest
import Dictionary
@testable import Corpus

final class CorpusTest: XCTestCase {

    var simpleCorpus: Corpus = Corpus()
    var corpus: Corpus = Corpus()

    override func setUp(){
        self.corpus = Corpus(fileName: "corpus.txt")
        self.simpleCorpus = Corpus(fileName: "simplecorpus.txt")
    }

    func testNumberOfWords(){
        XCTAssertEqual(826680, self.corpus.numberOfWords())
        XCTAssertEqual(24, self.simpleCorpus.numberOfWords())
    }

    func testContains(){
        XCTAssertTrue(self.corpus.contains(word: "atatürk"))
        for word in self.corpus.getWordList(){
            XCTAssertTrue(self.corpus.contains(word: word.getName()))
        }
        XCTAssertTrue(self.simpleCorpus.contains(word: "mehmet"))
        for word in self.simpleCorpus.getWordList(){
            XCTAssertTrue(self.simpleCorpus.contains(word: word.getName()))
        }
    }

    func testWordCount(){
        XCTAssertEqual(98199, self.corpus.wordCount())
        XCTAssertEqual(12, self.simpleCorpus.wordCount())
    }

    func testGetCount(){
        XCTAssertEqual(309, self.corpus.getCount(word: Word(name: "mustafa")))
        XCTAssertEqual(109, self.corpus.getCount(word: Word(name: "kemal")))
        XCTAssertEqual(122, self.corpus.getCount(word: Word(name: "atatürk")))
        XCTAssertEqual(4, self.simpleCorpus.getCount(word: Word(name: "ali")))
        XCTAssertEqual(3, self.simpleCorpus.getCount(word: Word(name: "gitti")))
        XCTAssertEqual(4, self.simpleCorpus.getCount(word: Word(name: "at")))
    }

    func testSentenceCount(){
        XCTAssertEqual(50000, self.corpus.sentenceCount())
        XCTAssertEqual(5, self.simpleCorpus.sentenceCount())
    }

    func testMaxSentenceLength(){
        XCTAssertEqual(1092, self.corpus.maxSentenceLength())
        XCTAssertEqual(6, self.simpleCorpus.maxSentenceLength())
    }

    static var allTests = [
        ("testExample1", testNumberOfWords),
        ("testExample2", testContains),
        ("testExample3", testWordCount),
        ("testExample4", testGetCount),
        ("testExample5", testSentenceCount),
        ("testExample6", testMaxSentenceLength),
    ]
}
