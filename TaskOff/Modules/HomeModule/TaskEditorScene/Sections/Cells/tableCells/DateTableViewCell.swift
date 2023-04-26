//
//  DateTableViewCell.swift
//  TaskOff
//
//  Created by Олег Борисов on 12.04.2023.
//

import UIKit

class DateTableViewCell: UITableViewCell {

    public var sheduleDate = Date()
    public var sheduleWeekDay = Int()
    
    var dateView: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 10
        label.contentMode = .scaleAspectFit
        label.clipsToBounds = true
        label.backgroundColor = .systemGroupedBackground
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()

    public func configure(title: String){
        self.dateView.text = title
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        stretch(dateView, right: 5, left: 5, bottom: 5)
    }

}

extension DateTableViewCell{
    func alertDate(label: UILabel, completion: @escaping (Int, Date) -> ()){
        let alert = UIAlertController(
            title: "",
            message: nil,
            preferredStyle: .actionSheet)
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "en_US")
        datePicker.preferredDatePickerStyle = .wheels

        alert.view.addSubview(datePicker)

        let ok = UIAlertAction(title: "Ok", style: .default){ (action) in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            dateFormatter.locale = Locale(identifier: "en_US")

            let date = datePicker.date

            let dateString = dateFormatter.string(from: date)
            let calendar = Calendar.current

            let component = calendar.dateComponents([.weekday], from: date)
            guard let weekday = component.weekday else { return }

            completion(weekday, date)

            label.tintColor = .black
            label.text = dateString

        }

        let cancel = UIAlertAction(title: "Cancel", style: .destructive)

        alert.addAction(ok)
        alert.addAction(cancel)

        alert.view.heightAnchor.constraint(equalToConstant: 300).isActive = true

        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.widthAnchor.constraint(equalTo: alert.view.widthAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 160).isActive = true
        datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20).isActive = true

        let delegate = UIApplication.shared.delegate as? AppDelegate
        delegate?.topMostController().present(alert, animated: true)
    }
}

