import UIKit
import IlJournalierUITestUtils

extension UIAccessibilityIdentification {
    var accessibilityId: AccessbilityId? {
        get {
            accessibilityIdentifier.flatMap(AccessbilityId.init(rawValue:))
        }
        set {
            accessibilityIdentifier = newValue?.rawValue
        }
    }
}
