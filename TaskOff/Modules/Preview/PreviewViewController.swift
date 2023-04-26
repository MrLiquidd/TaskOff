//
//  PreviewViewController.swift
//  TaskOff
//
//  Created by Олег Борисов on 23.03.2023.
//

import UIKit

class PreviewViewController: UIViewController, FlowController {
    
    var completionHandler: ((String?) -> ())?

    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.font = UIFont.systemFont(ofSize: 60, weight: .heavy, width: .standard)
        label.text = "TaskOff"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

    }
}

extension PreviewViewController{
    func setup(){
        view.backgroundColor = .systemBackground
        setupLabel()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){ [weak self] in
            self?.completionHandler?("done")
        }
    }

    func setupLabel(){
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30)
        ])
    }
}
