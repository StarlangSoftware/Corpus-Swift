import XCTest
import Dictionary
@testable import Corpus

final class TurkishSplitterTest: XCTestCase {

    func testSplit1(){
        let splitter : TurkishSplitter = TurkishSplitter()
        XCTAssertEqual(14, splitter.split(line: "Cin Ali, bak! " +
                "At. " +
                "Bak, Cin Ali, bak. " +
                "Bu at. " +
                "Baba, o atı bana al. " +
                "Cin Ali, bu at. " +
                "O da ot. " +
                "Baba, bu ata ot al. " +
                "Cin Ali, bu ot, o da at. " +
                "Otu al, ata ver. " +
                "Bak, Suna! " +
                "Cin Ali, ata ot verdi. " +
                "Su verdi. " +
            "Cin Ali, ata bir kova da su verdi.").count)
    }

    func testSplit2(){
        let splitter : TurkishSplitter = TurkishSplitter()
        XCTAssertEqual(1, splitter.split(line: "WWW.GOOGLE.COM").count)
    }

    func testSplit3(){
        let splitter : TurkishSplitter = TurkishSplitter()
        XCTAssertEqual(1, splitter.split(line: "www.google.com").count)
    }

    func testSplit4(){
        let splitter : TurkishSplitter = TurkishSplitter()
        XCTAssertEqual(1, splitter.split(line: "1.adımda ve 2.adımda ne yaptın").count)
        XCTAssertEqual(7, splitter.split(line: "1.adımda ve 2.adımda ne yaptın")[0].wordCount())
    }

    func testSplit5(){
        let splitter : TurkishSplitter = TurkishSplitter()
        XCTAssertEqual(1, splitter.split(line: "1. adımda ve 2. adımda ne yaptın").count)
        XCTAssertEqual(7, splitter.split(line: "1. adımda ve 2. adımda ne yaptın")[0].wordCount())
    }

    func testSplit6(){
        let splitter : TurkishSplitter = TurkishSplitter()
        XCTAssertEqual(1, splitter.split(line: "Burada II. Murat ve I. Ahmet oyun oynadı").count)
        XCTAssertEqual(8, splitter.split(line: "Burada II. Murat ve I. Ahmet oyun oynadı")[0].wordCount())
    }

    static var allTests = [
        ("testExample1", testSplit1),
        ("testExample2", testSplit2),
        ("testExample3", testSplit3),
        ("testExample4", testSplit4),
        ("testExample5", testSplit5),
        ("testExample6", testSplit6),
    ]
}
