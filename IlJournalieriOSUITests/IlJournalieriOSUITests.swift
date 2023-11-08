import Nimble
import XCTest

final class IlJournalieriOSUITests: XCTestCase {
    func testEmptyFieldCausesAnAlertToBeShown() {
        let app = XCUIApplication()
        app.launch()

        expect(app.textFields[.logMoreField].valueThatIsNotThePlaceholder) == ""

        app.buttons[.logMoreButton].tap()

        expect(app.alerts[.dashboardAlert].waitForExistence(timeout: 1)) == true
    }

    func testFieldBecomesEmptyAfterSuccessfulLogging() {
        let app = XCUIApplication()
        app.launch()

        let testText = "This is a penis ui test"
        let logMoreField = app.textFields[.logMoreField]
        logMoreField.tap()
        logMoreField.typeText(testText)

        expect(logMoreField.valueThatIsNotThePlaceholder) == testText

        app.buttons[.logMoreButton].tap()

        expect(logMoreField.valueThatIsNotThePlaceholder) == ""
    }
}
