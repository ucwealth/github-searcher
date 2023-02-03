import XCTest

final class GithubSearcherUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {}

    func testSearchInput() throws {
        let searchField = app.textFields["searchTextfield"]
        XCTAssertTrue(searchField.exists, "Text field doesn't exist")
        XCTAssertEqual(searchField.placeholderValue, "Enter search text")
        searchField.tap()
        searchField.typeText("omega")
        XCTAssertEqual(searchField.value as! String, "omega", "Value is incorrect")
        
        let searchButton = app.buttons["Search"]
        XCTAssert(searchButton.exists)
        searchButton.tap()
        XCTAssert(searchButton.isEnabled)
    }
    
    func testResultList() throws {
                
    }
    
    func testDetailScreen() throws {

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
