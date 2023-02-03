import XCTest

final class GithubSearcherUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        print(app.debugDescription)
    }

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
        let searchTextField = app/*@START_MENU_TOKEN@*/.textFields["searchTextfield"]/*[[".textFields[\"Enter search text\"]",".textFields[\"searchTextfield\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        searchTextField.tap()
        searchTextField.typeText("uc")
        app/*@START_MENU_TOKEN@*/.staticTexts["Search"]/*[[".buttons[\"Search\"].staticTexts[\"Search\"]",".staticTexts[\"Search\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        let table = app.tables.element
        XCTAssertTrue(table.waitForExistence(timeout: 1))
        XCTAssertTrue(table.cells.count > 0)

    }
    
    func testDetailScreen() throws {
        let searchTextField = app/*@START_MENU_TOKEN@*/.textFields["searchTextfield"]/*[[".textFields[\"Enter search text\"]",".textFields[\"searchTextfield\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        searchTextField.tap()
        searchTextField.typeText("deji")
        app/*@START_MENU_TOKEN@*/.staticTexts["Search"]/*[[".buttons[\"Search\"].staticTexts[\"Search\"]",".staticTexts[\"Search\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    
        app.tables.staticTexts.firstMatch.tap()
        
        XCTAssertTrue(app.images["avatar"].waitForExistence(timeout: 0.5))
        XCTAssertTrue(app.staticTexts["login"].exists)
        XCTAssertTrue(app.staticTexts["type"].exists)
        
        app.navigationBars["Search Github"].buttons["Search Github"].tap()
        XCTAssertFalse(app.images["avatar"].exists)

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
