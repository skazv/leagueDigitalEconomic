//
//  ViewController.swift
//  Example
//
//  Created by Александров Роман Витальевич on 22.02.2022.
//  Upgrated by Kazaryan Suren on 23.02.2022.

import UIKit

class ViewController: UIViewController {
    var delegate: ((UILabel)->(Void))?
    
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
        button.addTarget(self, action: #selector(didTapValidateButton(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var validationResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидаю валидации..."
        return label
    }()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

// MARK: - Private methods
extension ViewController {
    private func configureView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(cardView)
        cardView.addSubview(nameTextField)
        cardView.addSubview(validateButton)
        cardView.addSubview(validationResultLabel)
        
        view.addSubview(emailCardView)
        emailCardView.addSubview(emailTextField)
        emailCardView.addSubview(emailValidationButton)
        emailCardView.addSubview(emailValidationResultLabel)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            
            validateButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            validateButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            validateButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            
            validationResultLabel.topAnchor.constraint(equalTo: validateButton.bottomAnchor, constant: 16),
            validationResultLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            validationResultLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            validationResultLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16),
            
            emailCardView.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 50),
            emailCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
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
    
    struct Validation {
        
    }
    
    func some(label: UILabel) {
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", RegExString.name.rawValue)
        let isValid = predicate.evaluate(with: nameTextField.text)
        validationResultLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        validationResultLabel.textColor = isValid ? .systemGreen : .systemRed
    }
    
    @objc
    private func didTapValidateButton(sender: UIButton) {
        switch sender.tag {
        case 1:
            let predicate = NSPredicate(format: "SELF MATCHES[c] %@", RegExString.name.rawValue)
            let isValid = predicate.evaluate(with: nameTextField.text)
            validationResultLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
            validationResultLabel.textColor = isValid ? .systemGreen : .systemRed
        case 2:
            let predicate = NSPredicate(format: "SELF MATCHES[c] %@", RegExString.email.rawValue)
            let isValid = predicate.evaluate(with: emailTextField.text)
            emailValidationResultLabel.text = isValid ? "Валидация email прошла успешно" : "Ошибка (Тупишь как моя бывшая)"
            emailValidationResultLabel.textColor = isValid ? .systemGreen : .systemRed
        default: print("error")
        }
        
    }
}

//
//@objc
//private func didTapValidateButton(sender: UIButton) {
//
//    switch sender.tag {
//    case 1:
//        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", RegExString.name.rawValue)
//        let isValid = predicate.evaluate(with: nameTextField.text)
//
//        validationResultLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
//        validationResultLabel.textColor = isValid ? .systemGreen : .systemRed
//    case 2:
//        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", RegExString.email.rawValue)
//        let isValid = predicate.evaluate(with: emailTextField.text)
//
//        emailValidationResultLabel.text = isValid ? "Валидация email прошла успешно" : "Ошибка (Тупишь как моя бывшая)"
//        emailValidationResultLabel.textColor = isValid ? .systemGreen : .systemRed
//    default: print("error")
//    }
//
//}
