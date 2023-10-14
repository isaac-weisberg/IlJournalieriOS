import UIKit

class StylishButton: UIView  {
    let button = UIButton(type: .system)

    var onTap: (() -> Void)?

    init(text: String) {
        super.init(frame: .zero)

        layer.borderWidth = 2
        layer.borderColor = UIColor.niceYellow.cgColor
        layer.cornerRadius = 4

        addSubview(button)
        button.titleEdgeInsets = .zero
        button.titleLabel!.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview()
        }
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }

    @objc func handleTap() {
        onTap?()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
