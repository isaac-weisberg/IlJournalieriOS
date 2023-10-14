import UIKit

class DashboardCoordinator {
    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let dashboardController = DashboardViewController()

        window.rootViewController = dashboardController
    }
}
