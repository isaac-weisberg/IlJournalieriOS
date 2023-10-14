import Foundation

protocol IDateService {
    var currentDate: Date { get }
}

class DateService: IDateService {
    var currentDate: Date {
        Date()
    }
}
