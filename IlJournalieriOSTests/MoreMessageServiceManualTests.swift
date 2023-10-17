import Foundation
@testable import IlJournalieriOS
import XCTest

class MoreMessageServiceManualTests: XCTestCase {
    func testServiceStoresMessagesWithDatesAsExpected() {
        // Fake data
        let fakeDate = Date(timeIntervalSince1970: 63000000)
        let fakeMessage = "I had a big wee wee, on the bus, right in my trousers"
        let fakeStorageResult = Result<Void, ErrorChain>.success(())

        // Mocks
        let dateServiceMock = DateServiceMock(dateToReturn: fakeDate)
        let moreMessageStorageMock = MoreMessageStorageMock(
            resultToReturn: fakeStorageResult
        )

        // Service to be tested
        let moreMessageService = MoreMessageService(
            dateService: dateServiceMock,
            moreMessageStorage: moreMessageStorageMock
        )

        let expectation = expectation(description: "should complete running")

        moreMessageService.addMoreMessage(fakeMessage) { result in
            switch result {
            case .success:
                break
            case let .failure(error):
                XCTFail("unexpected \(error)")
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5)

        XCTAssert(dateServiceMock.currentDateWasCalled, "the date service was supposed to be called in order to store the message")
        XCTAssertEqual(moreMessageStorageMock.moreMessagesStored.count, 1, "only one message was to be stored")
        XCTAssertEqual(
            moreMessageStorageMock.moreMessagesStored,
            [
                MoreMessageRecord(
                    timestamp: fakeDate,
                    message: fakeMessage
                )
            ],
            "there should've only been this stuff stored in the storage at this point"
        )
    }

}

extension MoreMessageRecord: Equatable {
    public static func == (lhs: MoreMessageRecord, rhs: MoreMessageRecord) -> Bool {
        return lhs.timestamp == rhs.timestamp && lhs.message == rhs.message
    }
}
