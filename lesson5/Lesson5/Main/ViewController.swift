//
//  ViewController.swift
//  Lesson5
//
//  Created by Suren Kazaryan on 03.03.2022.
//

import UIKit

import Foundation
import UIKit

class ViewController: UIViewController {
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    lazy var nameButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("name", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(openVC), for: .touchUpInside)
        return button
    }()
    
    lazy var emailButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("email", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(openVC), for: .touchUpInside)
       return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}


extension ViewController {
    func configure() {
        view.backgroundColor = .systemBackground
        view.addSubview(mainView)
        
        mainView.addSubview(nameButton)
        mainView.addSubview(emailButton)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            emailButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            emailButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            emailButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            
            nameButton.topAnchor.constraint(equalTo: emailButton.bottomAnchor, constant: 10),
            nameButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            nameButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            nameButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20),
        ])
    }
    
    @objc
    private func openVC(sender: UIButton) {
        switch sender.titleLabel?.text {
        case "email":
            navigationController?.pushViewController(EmailController(), animated: true)
        case "name":
            navigationController?.present(NameController(), animated: true)
        default:
            print("fuck up")
        }
    }

}
