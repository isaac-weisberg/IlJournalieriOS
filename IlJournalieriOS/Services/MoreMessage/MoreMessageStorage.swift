import Foundation

struct MoreMessageRecord {
    let timestamp: Date
    let message: String
}

protocol IMoreMessageStorage {
    func save(
        _ moreMessage: MoreMessageRecord,
        _ completion: @escaping (Result<Void, ErrorChain>) -> Void
    )
}

class MoreMessageStorage: IMoreMessageStorage {
    let coreDataService: ICoreDataService

    init(_ coreDataService: ICoreDataService) {
        self.coreDataService = coreDataService
    }

    func save(
        _ moreMessage: MoreMessageRecord,
        _ completion: @escaping (Result<Void, ErrorChain>) -> Void
    ) {
        coreDataService.performTransaction { ctx in
            let entity = MoreMessage(context: ctx)
            entity.message = moreMessage.message
            entity.timestamp = moreMessage.timestamp
        } completion: { result in
            completion(result.mapError { err in
                err.chain("creating moreMessage record failed")
            })
        }
    }
}
