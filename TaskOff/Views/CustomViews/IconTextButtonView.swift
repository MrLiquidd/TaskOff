//
//  IconTextButtonView.swift
//  TaskOff
//
//  Created by Олег Борисов on 12.04.2023.
//

import UIKit

struct IconTextButtonViewModel{
    let text: String
    let image: UIImage?
    let backgroundColor: UIColor?
    let textColor: UIColor?
    let imgColor: UIColor?
}

final class IconTextButton: UIButton{
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode  = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        addSubview(iconImageView)
        clipsToBounds = true
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondarySystemBackground.cgColor
        backgroundColor = .systemGroupedBackground
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with viewModel: IconTextButtonViewModel){
        backgroundColor = viewModel.backgroundColor
        label.text = viewModel.text
        label.textColor = viewModel.textColor
        iconImageView.image = viewModel.image
        iconImageView.tintColor = viewModel.imgColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        iconImageView.sizeToFit()
        let iconSize: CGFloat = 25
        let iconRightPadding: CGFloat = 5
        let iconX: CGFloat = (frame.size.width - label.frame.size.width - iconSize - 5) / 2
        iconImageView.frame = CGRect(x: iconX,
                                     y: (frame.size.height-iconSize)/2,
                                     width: iconSize,
                                     height: iconSize)
        label.frame = CGRect(x: iconX + iconSize + iconRightPadding,
                             y: (frame.size.height - iconSize)/2,
                             width: label.frame.size.width,
                             height: label.frame.size.height)
    }
}
