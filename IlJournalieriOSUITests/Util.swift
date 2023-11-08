import XCTest
import IlJournalierUITestUtils

extension XCUIElementQuery {
    subscript(_ accessibilityId: AccessbilityId) -> XCUIElement {
        self[accessibilityId.rawValue]
    }
}

extension XCUIElementAttributes {
    var valueThatIsNotThePlaceholder: String {
        if
            value != nil,
            let aValue = value as? String,
            let placeholderValue,
            aValue != placeholderValue
        {
            return aValue
        }

        return ""
    }
}
