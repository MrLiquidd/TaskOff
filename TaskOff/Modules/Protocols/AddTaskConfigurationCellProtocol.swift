//
//  AddTaskConfigurationCellProtocol.swift
//  TaskOff
//
//  Created by Олег Борисов on 30.03.2023.
//

import Foundation

protocol AddTaskConfigurationCellProtocol{
    static var reuseId: String { get }
    func configure(with intValue: Int)
}
