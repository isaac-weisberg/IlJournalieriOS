import CoreData

protocol ICoreDataService {

}

class CoreDataService: ICoreDataService {
    static func create(_ completion: @escaping (CoreDataService) -> Void) {
        let container = NSPersistentContainer(name: "IlJournalieriOS")
        container.loadPersistentStores { _, err in
            let service = CoreDataService(container: container)
            completion(service)
        }
    }

    let container: NSPersistentContainer

    init(container: NSPersistentContainer) {
        self.container = container
    }
}
