import UIKit
import CoreData

class DashboardMassiveViewController: UIViewController {
    let persistedContainer: NSPersistentContainer

    let logSomethingLabel = UILabel(frame: .zero)
    let logMoreField = StylishField()
    let logMoreButton = StylishButton(text: "Log")

    init(persistedContainer: NSPersistentContainer) {
        self.persistedContainer = persistedContainer
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

        view.addSubview(logMoreButton)
        logMoreButton.snp.makeConstraints { make in
            make.top.equalTo(logMoreField.snp.bottom).offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }


        weak var weakSelf = self
        logMoreButton.onTap = {
            guard let self = weakSelf else { return }

            guard let text = self.logMoreField.field.text, !text.isEmpty else {
                self.showAlert("Message must not be empty")
                return
            }

            let ctx = self.persistedContainer.newBackgroundContext()

            ctx.perform {
                let moreMessage = MoreMessage(context: ctx)
                moreMessage.message = text
                moreMessage.timestamp = Date()

                do {
                    try ctx.save()
                    mainThread {
                        weakSelf?.clearMoreMessageInput()
                    }
                } catch {
                    ctx.rollback()
                    mainThread {
                        weakSelf?.showAlert("\(error)")
                    }
                }
            }
        }
    }
}

extension DashboardMassiveViewController {
    func clearMoreMessageInput() {
        logMoreField.field.text = ""
    }

    func showAlert(_ msg: String) {
        let alertController = UIAlertController(title: msg, message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))

        present(alertController, animated: true)
    }
}
