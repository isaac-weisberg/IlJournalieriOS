import Foundation
@testable import IlJournalieriOS

class DateServiceMock: IDateService {
    let dateToReturn: Date

    init(dateToReturn: Date) {
        self.dateToReturn = dateToReturn
    }

    var currentDateWasCalled = false
    var currentDate: Date {
        currentDateWasCalled = true

        return dateToReturn
    }
}
