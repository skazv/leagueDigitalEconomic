//
//  AddController.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 23.03.2022.
//

import UIKit

//protocol AddSectionSettingProtocol AnyObject {
//    var presenter: AddSectionSettingPresenterProtocol? { get set }
//
//    //func show
//}

class AddSettingHeaderController: UIViewController {
    
    var addHeaderCallback: ((String)->(Void))?
    
    private lazy var colorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemOrange
        view.layer.cornerRadius = 30
        return view
    }()
    
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
        label.text = "Add section"
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
    
    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose color: "
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var colorPicker: UIPickerView = {
        let colorPicker = UIPickerView()
        colorPicker.translatesAutoresizingMaskIntoConstraints = false
        colorPicker.delegate = self
        colorPicker.dataSource = self
        return colorPicker
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
        addHeaderCallback?(name)
        nameField.text = ""
        dismiss(animated: true, completion: .none)
    }
    
}

//MARK: - Private methods
extension AddSettingHeaderController {
    private func setup() {
        view.addSubview(addView)
        addView.addSubviews(views: [
            headerLabel,
            nameField,
            colorLabel,
            colorPicker,
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
//            nameField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
//            nameField.leadingAnchor.constraint(equalTo: addView.leadingAnchor, constant: 16),
//            nameField.trailingAnchor.constraint(equalTo: addView.trailingAnchor, constant: -16),
//            nameField.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -30),
//            nameField.heightAnchor.constraint(equalToConstant: 40),
            
            colorLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 15),
            colorLabel.leadingAnchor.constraint(equalTo: addView.leadingAnchor, constant: 16),
            colorLabel.trailingAnchor.constraint(equalTo: colorPicker.leadingAnchor),
            colorLabel.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -20),
            
            colorPicker.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 15),
            colorPicker.leadingAnchor.constraint(equalTo: colorLabel.trailingAnchor),
            colorPicker.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -20),
            colorPicker.heightAnchor.constraint(equalToConstant: 90),
            colorPicker.widthAnchor.constraint(equalToConstant: 80),
            
            addButton.bottomAnchor.constraint(equalTo: addView.bottomAnchor, constant: -30),
            addButton.centerXAnchor.constraint(equalTo: addView.centerXAnchor),
        ])
    }
}

//MARK: - UIPickerViewDelegate
extension AddSettingHeaderController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        5
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0: return "Black"
        case 1: return "Black"
        case 2: return "Black"
        case 3: return "Black"
        case 4: return "Black"
        default:
            return "0"
        }
        return String(row + 1)
    }
    
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let v = UIView()
//        switch row {
//        case 0: return colorView
//        case 1: return colorView
//        case 2: return colorView
//        case 3: return colorView
//        case 4: return colorView
//        default:
//            return colorView
//        }
//        return colorView
//    }
    
}

//MARK: - UIPickerViewDelegate
extension AddSettingHeaderController: UIPickerViewDelegate {
}
