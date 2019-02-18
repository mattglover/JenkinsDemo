import XCTest

class JenkinsDemoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let toolbar = XCUIApplication().toolbars["Toolbar"]
        let changeToMgButton = toolbar.buttons["Change to MG"]
        let changeToJdButton = toolbar.buttons["Change to JD"]
        let titleLabel = XCUIApplication().staticTexts["titleLabel"]
        
        changeToMgButton.tap()
        XCTAssertEqual(titleLabel.value as! String, "Matt Glover")
        changeToJdButton.tap()
        XCTAssertEqual(titleLabel.value as! String, "JenkinsDemo")
        changeToMgButton.tap()
        XCTAssertEqual(titleLabel.value as! String, "Matt Glover")
        changeToJdButton.tap()
        XCTAssertEqual(titleLabel.value as! String, "JenkinsDemo")
        changeToMgButton.tap()
        XCTAssertEqual(titleLabel.value as! String, "Matt Glover")
        changeToJdButton.tap()
        XCTAssertEqual(titleLabel.value as! String, "JenkinsDemo")
        changeToMgButton.tap()
        XCTAssertEqual(titleLabel.value as! String, "Matt Glover")
        changeToJdButton.tap()
        XCTAssertEqual(titleLabel.value as! String, "JenkinsDemo")
        changeToMgButton.tap()
        XCTAssertEqual(titleLabel.value as! String, "Matt Glover")
        changeToJdButton.tap()
        XCTAssertEqual(titleLabel.value as! String, "JenkinsDemo")
        changeToMgButton.tap()
        XCTAssertEqual(titleLabel.value as! String, "Matt Glover")
        changeToJdButton.tap()
        XCTAssertEqual(titleLabel.value as! String, "JenkinsDemo")
    }
}
