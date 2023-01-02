//
//  MainViewController.swift
//  iOS_MVVM
//
//  Created by Gaisie on 2023/1/2.
//

import UIKit

class MainViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Main"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Main View"
        view.addSubview(titleLabel)
        // Do any additional setup after loading the view.
        applyConstraints()
    }
    
    private func applyConstraints(){
        let titleLabelConstraints = [
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(titleLabelConstraints)
    }

}
