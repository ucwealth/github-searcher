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
        
        XCTAssert(app.tables.tableRows.isAccessibilityElement)
//        app.tableRows["resultCell"]
//        XCTAssert(app.tables.cells.count > 0)
//        XCTAssert(app.tables.staticTexts.count > 0)
//        app.tables.cells.containing(.staticText, identifier:"ifandelse").element.swipeUp()
        
    }
    
    func testDetailScreen() throws {
        app/*@START_MENU_TOKEN@*/.icons["GithubSearcher"]/*[[".otherElements[\"Home screen icons\"]",".icons.icons[\"GithubSearcher\"]",".icons[\"GithubSearcher\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        let searchTextField = app/*@START_MENU_TOKEN@*/.textFields["searchTextfield"]/*[[".textFields[\"Enter search text\"]",".textFields[\"searchTextfield\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        searchTextField.tap()
        searchTextField.typeText("deji")
        app/*@START_MENU_TOKEN@*/.staticTexts["Search"]/*[[".buttons[\"Search\"].staticTexts[\"Search\"]",".staticTexts[\"Search\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tables.staticTexts[""].tap()
        
        // check for elements of detail page
        XCTAssertTrue(app.images["avatar"].exists)
        XCTAssertTrue(app.staticTexts["login"].exists)
        XCTAssertTrue(app.staticTexts["type"].exists)
        
        // check that we moved to next screen
        XCTAssert(app.n)
        app.navigationBars["Search Github"].buttons["Search Github"].tap()

        // check that we moved back to main screen
        let jonatackStaticText = app.tables/*@START_MENU_TOKEN@*/.staticTexts["jonatack"]/*[[".cells.staticTexts[\"jonatack\"]",".staticTexts[\"jonatack\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        jonatackStaticText.tap()
        
        let searchGithubButton = app.navigationBars["Search Github"].buttons["Search Github"]
        searchGithubButton.tap()
        jonatackStaticText.swipeUp()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["jonhoo"]/*[[".cells.staticTexts[\"jonhoo\"]",".staticTexts[\"jonhoo\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
                        
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
