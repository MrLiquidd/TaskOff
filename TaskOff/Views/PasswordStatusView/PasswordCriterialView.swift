//
//  PasswordCriterialView.swift
//  TaskOff
//
//  Created by Олег Борисов on 23.03.2023.
//

import UIKit

class PasswordCriterialView: UIView{
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()

    let checmarkImage = UIImage(systemName: "checkmark.circle")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
    let xmarkImage = UIImage(systemName: "xmark.circle")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
    let circleImage = UIImage(systemName: "circle")?.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)

    var isCriteriaMet: Bool = false{
        didSet{
            if isCriteriaMet{
                imageView.image = checmarkImage
            } else{
                imageView.image = xmarkImage
            }
        }
    }

    func reset(){
        isCriteriaMet = false
        imageView.image = circleImage
    }

    init(text: String){
        super.init(frame: .zero)

        label.text = text
        style()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize{
        return CGSize(width: 200, height: 40)
    }
}

extension PasswordCriterialView{

    func style(){
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "circle")?.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)
        imageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel

    }

    func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)

        ])

        // Image
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])

        // CHCR
        imageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        label.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
    }
}
