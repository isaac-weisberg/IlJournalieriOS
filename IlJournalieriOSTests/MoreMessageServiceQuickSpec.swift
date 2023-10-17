@testable import IlJournalieriOS
import Quick
import Nimble
import Fakery
import SwiftDate

class MoreMessageServiceQuickSpec: QuickSpec {
    override func spec() {
        describe("MoreMessageService") {
            let faker = Faker()
            let dateServiceMock = IDateServiceMock()
            let moreMessagesStorageMock = IMoreMessageStorageMock()
            let moreMessageService = MoreMessageService(
                dateService: dateServiceMock,
                moreMessageStorage: moreMessagesStorageMock
            )

            context("when given something to log") {
                let fakeDate = faker.date.between(
                    "2003-01-01 00:30:00".toDate()!.date,
                    "2004-01-01 15:30:00".toDate()!.date
                )
                let fakeMessage = faker.lorem.paragraph()

                dateServiceMock.getCurrentDateClosure = {
                    fakeDate
                }
                moreMessagesStorageMock.saveClosure = { record, completion in
                    completion(.success(()))
                }

                it("successfully stores the message with this exact date") {
                    waitUntil { done in
                        moreMessageService.addMoreMessage(fakeMessage) { result in
                            switch result {
                            case .success:
                                break
                            case .failure(let chain):
                                fail("unexpected  \(chain)")
                            }

                            expect(dateServiceMock.getCurrentDateCallsCount) == 1
                            expect(moreMessagesStorageMock.saveCallsCount) == 1
                            expect(moreMessagesStorageMock.saveReceivedArguments!.0.message) == fakeMessage
                            expect(moreMessagesStorageMock.saveReceivedArguments!.0.timestamp) == fakeDate

                            done()
                        }
                    }
                }
            }


        }
    }
}
