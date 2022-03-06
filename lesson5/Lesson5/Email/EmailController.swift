//
//  EmailController.swift
//  Lesson5
//
//  Created by Suren Kazaryan on 05.03.2022.
//

import UIKit

class EmailController: UIViewController {
    
    private lazy var emailCardView: EmailView = {
        let view = EmailView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

// MARK: - Private methods
extension EmailController {
    private func configureView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(emailCardView)
        
        NSLayoutConstraint.activate([
            emailCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            emailCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
