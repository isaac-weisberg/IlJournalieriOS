import Foundation

protocol IDateService: AutoMockable {
    func getCurrentDate() -> Date
}

class DateService: IDateService {
    func getCurrentDate() -> Date {
        Date()
    }
}
