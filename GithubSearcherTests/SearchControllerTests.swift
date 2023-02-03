import XCTest
@testable import GithubSearcher

final class SearchControllerTests: XCTestCase {
    var searchController: SearchController?
    
    override func setUpWithError() throws {}
    override func tearDownWithError() throws {}
    
    func testInputText() throws {
        var field = searchController?.searchTextField?.text
        field = "omega"
        XCTAssertNotNil(field)
    }
    
    func testConfigure() throws {
        var cell: ResultCell?
        let itemMock = Item(login: "omega", avatarURL: "http://example.com", type: "Admin")
        XCTAssertNoThrow(cell?.configure(itemMock))
    }

}
