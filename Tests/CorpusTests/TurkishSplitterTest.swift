import XCTest
import Dictionary
@testable import Corpus

final class TurkishSplitterTest: XCTestCase {

    func testSplit(){
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

    static var allTests = [
        ("testExample1", testSplit),
    ]
}
