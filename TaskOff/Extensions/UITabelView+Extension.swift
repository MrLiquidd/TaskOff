//
//  UITabelView+Extension.swift
//  TaskOff
//
//  Created by Олег Борисов on 14.04.2023.
//

import UIKit

extension UITableView{

    func register(_ cellClass: Swift.AnyClass) {
        register(cellClass, forCellReuseIdentifier: String(describing: cellClass))
    }

    public func registerNibWith<Cell: UITableViewCell>(cellType: Cell.Type, bundle: Bundle? = nil) {
        let className = String(describing: cellType)
        let nib = UINib(nibName: className, bundle: bundle)
        self.register(nib, forCellReuseIdentifier: className)
    }

    @objc func registerHeaderFooter(_ headerFooterClass: Swift.AnyClass){
        register(headerFooterClass, forHeaderFooterViewReuseIdentifier:String(describing: headerFooterClass))
    }

    func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
        if let cell = dequeueReusableCell(withIdentifier: String(describing: Cell.self), for: indexPath) as? Cell {
            return cell
        }
        else {
            fatalError("Inconsistent cell registration")
        }
    }

    func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath,with style:UITableViewCell.CellStyle) -> Cell {
        let cell = Cell(style: style, reuseIdentifier: String(describing: Cell.self))
        return cell
    }

    func dequeueReusableHeaderFooter<HeaderFooter: UITableViewHeaderFooterView>() -> HeaderFooter {
        if let view = dequeueReusableHeaderFooterView(withIdentifier: String(describing: HeaderFooter.self)) as? HeaderFooter {
            return view
        }
        else {
            fatalError("Inconsistent cell registration")
        }
    }
}
