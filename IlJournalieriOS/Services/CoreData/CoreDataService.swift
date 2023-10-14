import CoreData

protocol ICoreDataService {
    func performTransaction(
        _ block: @escaping (NSManagedObjectContext) throws -> Void,
        completion: @escaping (Result<Void, ErrorChain>) -> Void
    )
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

    func performTransaction(
        _ block: @escaping (NSManagedObjectContext) throws -> Void,
        completion: @escaping (Result<Void, ErrorChain>) -> Void
    ) {
        let ctx = container.newBackgroundContext()

        ctx.perform {
            do {
                try block(ctx)
            } catch {
                ctx.rollback()
                completion(.failure(error.chain("transaction failed")))
            }
            do {
                try ctx.save()
            } catch {
                ctx.rollback()
                completion(.failure(error.chain("saving failed")))
            }
        }
    }
}
