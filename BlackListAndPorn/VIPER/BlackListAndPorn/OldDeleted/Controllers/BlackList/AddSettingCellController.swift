//
//  AddCellController.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 31.03.2022.
//

import UIKit

class AddSettingCellController: UIViewController {
    var addCellCallback: ((String)->(Void))?
    
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
        label.text = "Add cell"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var nameField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 12
        tf.placeholder = " Write name.."
        tf.textColor = .systemGray
        tf.tintColor = .systemGray
        return tf
    }()
    
    private lazy var pickerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hate lvl: "
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var picker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(insertTapped), for: .touchUpInside)
        button.setTitle("  Add  ", for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    init(titleHeader: String){
        super.init(nibName: nil, bundle: nil)
        headerLabel.text = titleHeader
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(white: 0, alpha: 0)
        setup()
    }
    
    @objc func insertTapped() {
        var name = "Unnamed"
        if nameField.text != nil && nameField.text != "" {
            name = nameField.text!
        }
        addCellCallback?(name)
        nameField.text = ""
        dismiss(animated: true, completion: .none)
    }
    
}

//MARK: - Private methods
extension AddSettingCellController {
    private func setup() {
        view.addSubview(addView)
        addView.addSubviews(views: [
            headerLabel,
            nameField,
            pickerLabel,
            picker,
            addButton
        ])
        
        NSLayoutConstraint.activate([
            
            addView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            addView.widthAnchor.constraint(equalToConstant: 250),
            
            headerLabel.topAnchor.constraint(equalTo: addView.topAnchor, constant: 20),
            headerLabel.leadingAnchor.constraint(equalTo: addView.leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: addView.trailingAnchor, constant: -16),
            
            nameField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            nameField.leadingAnchor.constraint(equalTo: addView.leadingAnchor, constant: 16),
            nameField.trailingAnchor.constraint(equalTo: addView.trailingAnchor, constant: -16),
            nameField.heightAnchor.constraint(equalToConstant: 40),
            
            pickerLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 15),
            pickerLabel.leadingAnchor.constraint(equalTo: addView.leadingAnchor, constant: 16),
            pickerLabel.trailingAnchor.constraint(equalTo: picker.leadingAnchor),
            pickerLabel.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -20),
            
            picker.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 15),
            picker.leadingAnchor.constraint(equalTo: pickerLabel.trailingAnchor),
            picker.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -20),
            picker.heightAnchor.constraint(equalToConstant: 90),
            picker.widthAnchor.constraint(equalToConstant: 80),
            
            addButton.bottomAnchor.constraint(equalTo: addView.bottomAnchor, constant: -30),
            addButton.centerXAnchor.constraint(equalTo: addView.centerXAnchor),
        ])
    }
}

//MARK: - UIPickerViewDelegate
extension AddSettingCellController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        5
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row + 1)
    }
    
}

//MARK: - UIPickerViewDelegate
extension AddSettingCellController: UIPickerViewDelegate {
}
