class DIContext {
    static func create(_ completion: @escaping (DIContext) -> Void) {
        CoreDataService.create { coreDataService in

            let diContext = DIContext(
                coreDataService: coreDataService
            )

            completion(diContext)
        }
    }

    let coreDataService: ICoreDataService
    let dateService: IDateService
    let moreMessageStorage: IMoreMessageStorage
    let moreMessageService: IMoreMessageService

    init(coreDataService: ICoreDataService) {
        self.coreDataService = coreDataService

        let dateService = DateService()
        self.dateService = dateService

        let moreMessageStorage = MoreMessageStorage(coreDataService)
        self.moreMessageStorage = moreMessageStorage

        self.moreMessageService = MoreMessageService(
            dateService: dateService,
            moreMessageStorage: moreMessageStorage
        )
    }
}
