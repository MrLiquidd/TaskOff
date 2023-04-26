//
//  AnyTaskCell.swift
//  TaskOff
//
//  Created by Олег Борисов on 01.04.2023.
//

import UIKit

protocol AnyTaskCellProtocol{
    associatedtype ValueType
    var value: ValueType?{ get set }
}

protocol AnyTaskFieldProtocol{
    var title: String { get }
    var tintColor: UIColor { get }

    var height: CGFloat { get }

    func getCellBy( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func willDisplay( _ cell: UITableViewCell, forRowAt indexPath: IndexPath)
    func didSelect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)

    var reloadTableView: (() -> Void)? { get set }

}

class AnyTaskCell<ValueType>:NSObject,AnyTaskCellProtocol, AnyTaskFieldProtocol{

    var reloadTableView: (() -> Void)?

    var value: ValueType?{
        didSet{
            self.reloadTableView?()
        }
    }

    var title: String {
        return ""
    }

    var tintColor: UIColor{
        return UIColor.tintColor
    }

    var height: CGFloat{
        return 60
    }

    init(with value: ValueType?) {
        self.value = value
    }

    func getCellBy(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func didSelect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}


    func willDisplay(_ cell: UITableViewCell, forRowAt indexPath: IndexPath) {}
}
