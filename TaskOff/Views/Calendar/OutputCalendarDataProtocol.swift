//
//  OutputCalendarDataProtocol.swift
//  TaskOff
//
//  Created by Олег Борисов on 25.03.2023.
//

import UIKit

protocol OutputCalendarDataProtocol: AnyObject{
    func outputChangeHeight(height: CGFloat)
    func outputDidSelectDate(date: Date)
}
