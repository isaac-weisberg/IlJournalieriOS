import UIKit

class AppCoordinator {
    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    var dashCoordinator: DashboardCoordinator?

    func start() {
        let dashCoordinator = DashboardCoordinator(window: window)
        self.dashCoordinator = dashCoordinator

        dashCoordinator.start()
    }
}
