import Dispatch

func mainThread(_ work: @escaping () -> Void) {
    DispatchQueue.main.async {
        work()
    }
}
