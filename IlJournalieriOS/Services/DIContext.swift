class DIContext {
    let coreDataService: ICoreDataService

    static func create(_ completion: @escaping (DIContext) -> Void) {
        CoreDataService.create { coreDataService in

            let diContext = DIContext(
                coreDataService: coreDataService
            )

            completion(diContext)
        }
    }


    init(coreDataService: ICoreDataService) {
        self.coreDataService = coreDataService
    }
}
