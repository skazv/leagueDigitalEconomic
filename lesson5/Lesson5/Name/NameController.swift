//
//  NameController.swift
//  Lesson5
//
//  Created by Suren Kazaryan on 05.03.2022.
//

import UIKit

class NameController: UIViewController {
    
    private lazy var nameView: NameView = {
        let view = NameView()
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
extension NameController {
    private func configureView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(nameView)
        
        NSLayoutConstraint.activate([
            nameView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            nameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
