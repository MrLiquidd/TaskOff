//
//  UIView+Extension.swift
//  TaskOff
//
//  Created by Олег Борисов on 11.04.2023.
//

import UIKit

extension UIView{
    func stretch(_ view:UIView,top:CGFloat = 0,right:CGFloat = 0 ,left:CGFloat = 0,bottom:CGFloat = 0 ){
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: top).isActive = true
        self.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom).isActive = true
        view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: left).isActive = true
        self.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: right).isActive = true
    }
}
