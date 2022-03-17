//
//  SovestController.swift
//  Lesson6
//
//  Created by Suren Kazaryan on 17.03.2022.
//

import UIKit

class SovestController: UIViewController {

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Тут настолько все плохо, что лучше не смотреть. \n Я решил кинуть это в бэклог и начать делать итоговый проект, так как в проекте нужно делать через AutoLayout. \n Да простит меня Андрей Мишанин"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }


}
