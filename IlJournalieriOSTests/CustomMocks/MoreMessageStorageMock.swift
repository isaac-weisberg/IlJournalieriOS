@testable import IlJournalieriOS

class MoreMessageStorageMock: IMoreMessageStorage {
    let resultToReturn: Result<Void, ErrorChain>

    init(resultToReturn: Result<Void, ErrorChain>) {
        self.resultToReturn = resultToReturn
    }

    var moreMessagesStored: [MoreMessageRecord] = []

    func save(
        _ moreMessage: MoreMessageRecord,
        _ completion: @escaping (Result<Void, ErrorChain>) -> Void
    ) {
        moreMessagesStored.append(moreMessage)

        completion(resultToReturn)
    }
}
