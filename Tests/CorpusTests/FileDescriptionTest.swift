import XCTest
@testable import Corpus

final class FileDescriptionTest: XCTestCase {

    func testGetIndex(){
        var fileDescription : FileDescription = FileDescription(path: "mypath", extensionOrFileName: "1234.train")
        XCTAssertEqual(1234, fileDescription.getIndex())
        fileDescription = FileDescription(path: "mypath", extensionOrFileName: "0000.test")
        XCTAssertEqual(0, fileDescription.getIndex())
        fileDescription = FileDescription(path: "mypath", extensionOrFileName: "0003.dev")
        XCTAssertEqual(3, fileDescription.getIndex())
        fileDescription = FileDescription(path: "mypath", extensionOrFileName: "0020.train")
        XCTAssertEqual(20, fileDescription.getIndex())
        fileDescription = FileDescription(path: "mypath", extensionOrFileName: "0304.dev")
        XCTAssertEqual(304, fileDescription.getIndex())
    }
    
    func testGetExtension(){
        var fileDescription : FileDescription = FileDescription(path: "mypath", extensionOrFileName: "1234.train")
        XCTAssertEqual("train", fileDescription.getExtension())
        fileDescription = FileDescription(path: "mypath", extensionOrFileName: "0000.test")
        XCTAssertEqual("test", fileDescription.getExtension())
        fileDescription = FileDescription(path: "mypath", extensionOrFileName: "0003.dev")
        XCTAssertEqual("dev", fileDescription.getExtension())
    }

    func testGetFileName(){
        let fileDescription : FileDescription = FileDescription(path: "mypath", extensionOrFileName: "0003.train")
        XCTAssertEqual("mypath/0003.train", fileDescription.getFileName())
        XCTAssertEqual("newpath/0003.train", fileDescription.getFileName(thisPath: "newpath"))
        XCTAssertEqual("newpath/0000.train", fileDescription.getFileName(thisPath: "newpath", index: 0))
        XCTAssertEqual("newpath/0020.train", fileDescription.getFileName(thisPath: "newpath", index: 20))
        XCTAssertEqual("newpath/0103.train", fileDescription.getFileName(thisPath: "newpath", index: 103))
        XCTAssertEqual("newpath/0000.dev", fileDescription.getFileName(thisPath: "newpath", index: 0, fileExtension: "dev"))
        XCTAssertEqual("newpath/0020.dev", fileDescription.getFileName(thisPath: "newpath", index: 20, fileExtension: "dev"))
        XCTAssertEqual("newpath/0103.dev", fileDescription.getFileName(thisPath: "newpath", index: 103, fileExtension: "dev"))
    }

    static var allTests = [
        ("testExample1", testGetIndex),
        ("testExample2", testGetExtension),
        ("testExample3", testGetFileName),
    ]
}
