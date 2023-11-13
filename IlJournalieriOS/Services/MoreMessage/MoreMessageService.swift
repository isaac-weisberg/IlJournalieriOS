protocol IMoreMessageService: AutoMockable {
    func addMoreMessage(
        _ message: String,
        _ completion: @escaping (Result<Void, ErrorChain>) -> Void
    )
}

class MoreMessageService: IMoreMessageService {
    let dateService: IDateService
    let moreMessageStorage: IMoreMessageStorage

    init(
        dateService: IDateService,
        moreMessageStorage: IMoreMessageStorage
    ) {
        self.dateService = dateService
        self.moreMessageStorage = moreMessageStorage
    }

    func addMoreMessage(
        _ message: String,
        _ completion: @escaping (Result<Void, ErrorChain>) -> Void
    ) {
        let date = dateService.getCurrentDate()

        let moreMessageRecord = MoreMessageRecord(timestamp: date, message: message)

        moreMessageStorage.save(moreMessageRecord) { result in
            completion(result.mapError { err in
                err.chain("saving moreMessage to storage failed")
            })
        }
    }
}
