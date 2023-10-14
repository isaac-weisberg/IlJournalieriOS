import UIKit

class DashboardCoordinator {
    let window: UIWindow
    let di: DIContext

    init(window: UIWindow, di: DIContext) {
        self.window = window
        self.di = di
    }

    func start() {
        let presenter = DashboardPresenter(moreMessageService: di.moreMessageService)
        let dashboardController = DashboardViewController(presenter: presenter)
        presenter.delegate = dashboardController

        window.rootViewController = dashboardController
    }
}
