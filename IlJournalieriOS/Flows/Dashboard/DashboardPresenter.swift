protocol IDashboardPresenterDelegate: AutoMockable {
    func clearMoreMessageInput()

    func showAlert(_ msg: String)

    func tellUserMessageIsSaved()
}

protocol IDashboardPresenter {
    func addMoreMessage(_ msg: String?)
}

class DashboardPresenter: IDashboardPresenter {
    var delegate: IDashboardPresenterDelegate?
    let moreMessageService: IMoreMessageService

    init(
        moreMessageService: IMoreMessageService
    ) {
        self.moreMessageService = moreMessageService
    }

    func addMoreMessage(_ msg: String?) {
        guard let msg, !msg.isEmpty else {
            delegate?.showAlert("Message must not be empty")
            return
        }
        moreMessageService.addMoreMessage(msg) { [weak self] result in
            mainThread {

                switch result {
                case .success:
                    self?.delegate?.clearMoreMessageInput()
                    self?.delegate?.tellUserMessageIsSaved()
                case .failure(let error):
                    self?.delegate?.showAlert(error.msg)
                }

            }
        }
    }
}
