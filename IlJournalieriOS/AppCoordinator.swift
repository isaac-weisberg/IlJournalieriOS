import UIKit

class AppCoordinator {
    let window: UIWindow
    let di: DIContext

    init(window: UIWindow, di: DIContext) {
        self.window = window
        self.di = di
    }

    var dashCoordinator: DashboardCoordinator?

    func start() {
        let dashCoordinator = DashboardCoordinator(window: window)
        self.dashCoordinator = dashCoordinator

        dashCoordinator.start()
    }
}
