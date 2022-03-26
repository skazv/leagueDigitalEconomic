//
//  AddViewController.swift
//  BlackList
//
//  Created by Suren Kazaryan on 21.03.2022.
//

import UIKit

class AddViewController: UIViewController {
    
    var callback: ((String, Int)->(Void))?
    
    private lazy var addView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemOrange
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Add enemy"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = .systemBackground
        picker.layer.cornerRadius = 12
        return picker
    }()
    
    private lazy var nameField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 12
        tf.placeholder = " Введите имя..."
        return tf
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(insertTapped), for: .touchUpInside)
        button.setTitle("  Добавить  ", for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(white: 0, alpha: 0)
        setup()
    }
    
    @objc func insertTapped() {
        callback?(nameField.text!, pickerView.selectedRow(inComponent: 0))
        dismiss(animated: true, completion: .none)
    }
    
}

//MARK: - Private methods
extension AddViewController {
    private func setup() {
        view.addSubview(addView)
        addView.addSubview(headerLabel)
        addView.addSubview(pickerView)
        addView.addSubview(nameField)
        addView.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            
            addView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            
            headerLabel.topAnchor.constraint(equalTo: addView.topAnchor, constant: 20),
            headerLabel.leadingAnchor.constraint(equalTo: addView.leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: addView.trailingAnchor, constant: -16),
            
            pickerView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 30),
            pickerView.leadingAnchor.constraint(equalTo: addView.leadingAnchor, constant: 16),
            pickerView.trailingAnchor.constraint(equalTo: addView.trailingAnchor, constant: -16),
            pickerView.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: -20),
            pickerView.heightAnchor.constraint(equalToConstant: 100),
            
            nameField.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 20),
            nameField.leadingAnchor.constraint(equalTo: addView.leadingAnchor, constant: 16),
            nameField.trailingAnchor.constraint(equalTo: addView.trailingAnchor, constant: -16),
            nameField.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -30),
            nameField.heightAnchor.constraint(equalToConstant: 40),
            
            addButton.bottomAnchor.constraint(equalTo: addView.bottomAnchor, constant: -30),
            addButton.centerXAnchor.constraint(equalTo: addView.centerXAnchor),
        ])
    }
}

//MARK: - Protocols
extension AddViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        4
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var str = ""
        switch row {
        case 0: str = HeaderNames.exGirls.rawValue
        case 1: str = HeaderNames.debtors.rawValue
        case 2: str = HeaderNames.miyagiHaters.rawValue
        case 3: str = HeaderNames.bithday.rawValue
        default: print("ERROR")
        }
        return str
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
}
