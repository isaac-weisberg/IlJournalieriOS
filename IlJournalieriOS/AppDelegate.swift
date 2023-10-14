import UIKit
import SnapKit

@main class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        let launchScreenController = UIStoryboard(
            name: "LaunchScreen",
            bundle: .main
        ).instantiateInitialViewController()!

        window.rootViewController = launchScreenController

        DIContext.create { [self] diContext in
            appCoordinator = AppCoordinator(window: window, di: diContext)
            appCoordinator.start()
        }

        window.makeKeyAndVisible()

        return true
    }
}
