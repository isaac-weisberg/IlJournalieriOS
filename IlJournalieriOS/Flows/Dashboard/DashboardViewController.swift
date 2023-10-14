import UIKit

class DashboardViewController: UIViewController {
    let presenter: IDashboardPresenter
    let logSomethingLabel = UILabel(frame: .zero)
    let logMoreField = StylishField()

    init(presenter: IDashboardPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        logSomethingLabel.text = "Log Something"
        logSomethingLabel.font = UIFont.systemFont(ofSize: 32, weight: .regular)
        view.addSubview(logSomethingLabel)
        logSomethingLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(64)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        logMoreField.field.placeholder = [
            "Ate dinner",
            "Saw a dog",
            "plz halp",
            "I need water, god, please"
        ].randomElement()!
        view.addSubview(logMoreField)
        logMoreField.snp.makeConstraints { make in
            make.top.equalTo(logSomethingLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}

extension DashboardViewController: IDashboardPresenterDelegate {
    func clearMoreMessageInput() {
        logMoreField.field.text = ""
    }

    func showAlert(_ msg: String) {
        let alertController = UIAlertController(title: msg, message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))

        present(alertController, animated: true)
    }
}
