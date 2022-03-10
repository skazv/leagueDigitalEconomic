//
//  EmailView.swift
//  Lesson5
//
//  Created by Suren Kazaryan on 03.03.2022.
//

import Foundation
import UIKit

class EmailView: UIView {
    
    private lazy var emailCardView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "введите email..."
        emailTextField.borderStyle = .roundedRect
        emailTextField.backgroundColor = .systemBackground
        return emailTextField
    }()
    
    private lazy var emailValidationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Валидировать email", for: .normal)
        button.setTitle("Семпай, какое мощное нажатие", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.tag = 2
        button.addTarget(self, action: #selector(didTapValidateButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var emailValidationResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожадаю валидации email"
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
extension EmailView: ValidationProtocol {
    private func configureView() {
        self.backgroundColor = .systemBackground
        
        self.addSubview(emailCardView)
        emailCardView.addSubview(emailTextField)
        emailCardView.addSubview(emailValidationButton)
        emailCardView.addSubview(emailValidationResultLabel)
        
        NSLayoutConstraint.activate([
            
            emailCardView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 250),
                       emailCardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                       emailCardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: emailCardView.topAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            
            emailValidationButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            emailValidationButton.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            emailValidationButton.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            
            emailValidationResultLabel.topAnchor.constraint(equalTo: emailValidationButton.bottomAnchor, constant: 16),
            emailValidationResultLabel.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            emailValidationResultLabel.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            emailValidationResultLabel.bottomAnchor.constraint(equalTo: emailCardView.bottomAnchor, constant: -16)
        ])
    }
    
    enum RegExString: String {
        case name = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        case email = "[a-z-0-9]{2,}+@[a-z]+\\.[a-z]{2,}"
    }
    
    @objc
    private func didTapValidateButton() {
        validation(label: emailValidationResultLabel,
                   field: emailTextField,
                   regEx: RegExString.email.rawValue)
    }
}
