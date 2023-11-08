import UIKit

private let savedLabelAnimationKey = "savedLabelAnimationKey"

class DashboardViewController: UIViewController {
    let presenter: IDashboardPresenter
    let logSomethingLabel = UILabel(frame: .zero)
    let logMoreField = StylishField()
    let logMoreButton = StylishButton(text: "Log")
    let savedLabelAnimation = CAKeyframeAnimation(keyPath: "opacity")
    let savedLabel = UILabel()

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
        logMoreField.field.accessibilityId = .logMoreField
        view.addSubview(logMoreField)
        logMoreField.snp.makeConstraints { make in
            make.top.equalTo(logSomethingLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        logMoreButton.button.accessibilityId = .logMoreButton
        view.addSubview(logMoreButton)
        logMoreButton.snp.makeConstraints { make in
            make.top.equalTo(logMoreField.snp.bottom).offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        savedLabel.text = "Saved..."
        savedLabel.alpha = 0
        view.addSubview(savedLabel)
        savedLabel.snp.makeConstraints { make in
            make.trailing.equalTo(logMoreButton.snp.leading).offset(-20)
            make.centerY.equalTo(logMoreButton)
        }

        savedLabelAnimation.duration = 2
        savedLabelAnimation.keyTimes = [ 0.0, 0.1, 0.3, 1 ]
        savedLabelAnimation.values = [ 0.0, 1, 1, 0 ]

        logMoreButton.onTap = { [weak self] in
            guard let self else { return }
            self.presenter.addMoreMessage(self.logMoreField.field.text)
        }
    }
}

extension DashboardViewController: IDashboardPresenterDelegate {
    func tellUserMessageIsSaved() {
        savedLabel.layer.add(savedLabelAnimation, forKey: savedLabelAnimationKey)
    }

    func clearMoreMessageInput() {
        logMoreField.field.text = ""
    }

    func showAlert(_ msg: String) {
        let alertController = UIAlertController(title: msg, message: nil, preferredStyle: .alert)

        alertController.view.accessibilityId = .dashboardAlert
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))

        present(alertController, animated: true)
    }
}
