import XCTest
@testable import GithubSearcher

final class Test_SearchController: XCTestCase {
    var searchController: SearchController?
    
    override func setUpWithError() throws {}
    override func tearDownWithError() throws {}
    
//    func test_InputText() throws {
//        var field = searchController?.searchTextField?.text
//        field = "omega"
//        var inputText = searchController?.inputText
//        XCTAssertEqual(inputText, field, "Not equal")
//    }
    
    func test_configure() throws {
        var cell: ResultCell?
        let itemMock = Item(login: "omega", avatarURL: "http://example.com", type: "Admin")
        XCTAssertNoThrow(cell?.configure(itemMock))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
