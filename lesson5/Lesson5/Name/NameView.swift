//
//  NameView.swift
//  Lesson5
//
//  Created by Suren Kazaryan on 03.03.2022.
//

import Foundation
import UIKit

class NameView: UIView {
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "введите имя..."
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var validateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Валидировать", for: .normal)
        button.setTitle("Не дави на меня!", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.tag = 1
        button.addTarget(self, action: #selector(didTapValidateButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var validationResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидаю валидации..."
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension NameView: ValidationProtocol {
    private func configureView() {

        self.addSubview(nameTextField)
        self.addSubview(validateButton)
        self.addSubview(validationResultLabel)
        
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            validateButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            validateButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            validateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            validationResultLabel.topAnchor.constraint(equalTo: validateButton.bottomAnchor, constant: 16),
            validationResultLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            validationResultLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            validationResultLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    enum RegExString: String {
        case name = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        case email = "[a-z-0-9]{2,}+@[a-z]+\\.[a-z]{2,}"
    }
    
    @objc
    private func didTapValidateButton() {
        validation(label: validationResultLabel, field: nameTextField, regEx: RegExString.name.rawValue)
    }
}
