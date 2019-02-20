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
    
    func testUIApp() {
        
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        
        // Tab Bar Items
        tabBarsQuery.buttons["Profile"].tap()
        XCTAssert(app.navigationBars["Profile"].exists)
        
        tabBarsQuery.buttons["Settings"].tap()
        XCTAssert(app.navigationBars["Settings"].exists)
        
        tabBarsQuery.buttons["Home"].tap()
        XCTAssert(app.navigationBars["Home"].exists)
        
        // Home View Controller
        let titleLabel = XCUIApplication().staticTexts["titleLabel"]
        let backgroundView = XCUIApplication().otherElements["backgroundView"]
        
        XCTAssertEqual(titleLabel.value as! String, "ON")
        XCTAssertEqual(backgroundView.value as! String, "ON")
        
        let toggleButton = app/*@START_MENU_TOKEN@*/.buttons["toggleButton"]/*[[".otherElements[\"On\"]",".buttons[\"Toggle\"]",".buttons[\"toggleButton\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        
        toggleButton.tap()
        XCTAssertEqual(titleLabel.value as! String, "OFF")
        XCTAssertEqual(backgroundView.value as! String, "OFF")
        
        toggleButton.tap()
        XCTAssertEqual(titleLabel.value as! String, "ON")
        XCTAssertEqual(backgroundView.value as! String, "ON")

        // Profile
        tabBarsQuery.buttons["Profile"].tap()
        
        let profileNameLabel = app.staticTexts["profileNameLabel"]
        let locationLabel = app.staticTexts["locationLabel"]
        let editButton = app.navigationBars["Profile"].buttons["Edit"]
        
        XCTAssertEqual(profileNameLabel.value as! String, "Matt Glover")
        XCTAssertEqual(locationLabel.value as! String, "Location: Leeds, UK")
        
        // Profile - Edit (1)
        editButton.tap()
        
        XCTAssert(app.alerts.element.staticTexts["Change Name"].exists)
        app.alerts.textFields.firstMatch.typeText("Martha Mary-von-Allen")
        app.alerts["Change Name"].buttons["OK"].tap()
        
        XCTAssertEqual(profileNameLabel.value as! String, "Martha Mary-von-Allen")
        
        // Profile - Edit (2)
        editButton.tap()
        
        XCTAssert(app.alerts.element.staticTexts["Change Name"].exists)
        app.alerts.textFields.firstMatch.typeText("Matt Glover")
        app.alerts["Change Name"].buttons["OK"].tap()
        
        XCTAssertEqual(profileNameLabel.value as! String, "Matt Glover")
        
        // Settings
        tabBarsQuery.buttons["Settings"].tap()
        
        let colorPanel = XCUIApplication().otherElements["colorPanel"]
        let redSwitch = app.switches["redSwitch"]
        let greenSwitch = app.switches["greenSwitch"]
        let blueSwitch = app.switches["blueSwitch"]
        
        XCTAssertEqual(colorPanel.value as! String, "White")
        redSwitch.tap()
        XCTAssertEqual(colorPanel.value as! String, "Cyan")
        greenSwitch.tap()
        XCTAssertEqual(colorPanel.value as! String, "Blue")
        blueSwitch.tap()
        XCTAssertEqual(colorPanel.value as! String, "Black")
        greenSwitch.tap()
        XCTAssertEqual(colorPanel.value as! String, "Green")
        redSwitch.tap()
        XCTAssertEqual(colorPanel.value as! String, "Yellow")
        greenSwitch.tap()
        blueSwitch.tap()
        XCTAssertEqual(colorPanel.value as! String, "Pink")
        blueSwitch.tap()
        XCTAssertEqual(colorPanel.value as! String, "Red")
    }
}
