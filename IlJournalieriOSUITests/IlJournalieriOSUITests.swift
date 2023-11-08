import Nimble
import XCTest

final class IlJournalieriOSUITests: XCTestCase {
    func testEmptyFieldCausesAnAlertToBeShown() throws {
        let app = XCUIApplication()
        app.launch()

        expect(app.textFields[.logMoreField].valueThatIsNotThePlaceholder) == ""

        app.buttons[.logMoreButton].tap()

        expect(app.alerts[.dashboardAlert].waitForExistence(timeout: 1)) == true
    }
}
