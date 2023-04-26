//
//  TaskCell.swift
//  TaskOff
//
//  Created by Олег Борисов on 30.03.2023.
//

import UIKit

class AddTaskCell: UICollectionViewCell, AddTaskConfigurationCellProtocol{

    static var reuseId: String = "AddTaskCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple

        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }

    func configure(with intValue: Int) {
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
