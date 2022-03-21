//
//  AddViewController.swift
//  BlackList
//
//  Created by Suren Kazaryan on 21.03.2022.
//

import UIKit

class AddViewController: UIViewController {
    
    var callback: ((String, Int)->(Void))?
    
    lazy var addView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemCyan
        return view
    }()
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = .systemBackground
        return picker
    }()
    
    lazy var nameField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.placeholder = "Введите имя..."
        return tf
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(insertTapped), for: .touchUpInside)
        button.setTitle("Добавить", for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .systemOrange
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
    }
    
    @objc func insertTapped() {
        callback?(nameField.text!, pickerView.selectedRow(inComponent: 0))
        navigationController?.popViewController(animated: true)
    }
    
}

//MARK: - Private methods
extension AddViewController {
    private func setup() {
        view.addSubview(addView)
        addView.addSubview(pickerView)
        addView.addSubview(nameField)
        addView.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            addView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            addView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addView.heightAnchor.constraint(equalToConstant: 400),
            
            pickerView.topAnchor.constraint(equalTo: addView.topAnchor, constant: 30),
            pickerView.leadingAnchor.constraint(equalTo: addView.leadingAnchor, constant: 16),
            pickerView.trailingAnchor.constraint(equalTo: addView.trailingAnchor, constant: -16),
            pickerView.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: -20),
            
            nameField.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 20),
            nameField.leadingAnchor.constraint(equalTo: addView.leadingAnchor, constant: 16),
            nameField.trailingAnchor.constraint(equalTo: addView.trailingAnchor, constant: -16),
            nameField.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -30),
            
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
        case 0: str = "Бывшие"
        case 1: str = "Должники"
        case 2: str = "Не любят Miyagi"
        case 3: str = "Не пришласившие на ДР"
        default: print("ERROR")
        }
        return str
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
}
