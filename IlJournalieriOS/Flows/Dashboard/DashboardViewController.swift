import UIKit

class DashboardViewController: UIViewController {
    let logSomethingLabel = UILabel(frame: .zero)
    let logMoreField = StylishField()

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
