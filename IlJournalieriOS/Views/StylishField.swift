import UIKit

class StylishField: UIView {
    let field = UITextField(frame: .zero)
    let bottomLiveView = UIView()

    init() {
        super.init(frame: .zero)
        
        bottomLiveView.backgroundColor = UIColor.niceYellow

        field.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        self.addSubview(field)
        field.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(2)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        self.addSubview(bottomLiveView)
        bottomLiveView.snp.makeConstraints { make in
            make.top.equalTo(field.snp.bottom).offset(4)
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
