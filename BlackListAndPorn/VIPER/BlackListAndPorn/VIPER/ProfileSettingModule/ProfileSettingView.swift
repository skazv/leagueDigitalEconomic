//
//  ProfileSettingView.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 25.03.2022.
//

import UIKit

class ProfileSettingView: UIView {
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .secondarySystemBackground
        stackView.spacing = 15
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        [self.horizontalStackView, self.workHorizontalStackView, self.urlHorizontalStackView, self.secondHorizontalStackView, self.saveButton].forEach({
            stackView.addArrangedSubview($0)
        })
        return stackView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        [self.nameLabel, self.nameField].forEach({
            stackView.addArrangedSubview($0)
        })
        return stackView
    }()
    
    private lazy var secondHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        [self.descriptionLabel, self.descriptionField].forEach({
            stackView.addArrangedSubview($0)
        })
        return stackView
    }()
    
    private lazy var workHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        [self.workLabel, self.workField].forEach({
            stackView.addArrangedSubview($0)
        })
        return stackView
    }()
    
    private lazy var urlHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        [self.urlLabel, self.urlField].forEach({
            stackView.addArrangedSubview($0)
        })
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name:"
        return label
    }()
    
    private lazy var nameField: UITextField = {
       let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = " Suren Kazaryab"
        field.backgroundColor = .white
        return field
    }()
    
    private lazy var workLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Work:"
        return label
    }()
    
    private lazy var workField: UITextField = {
       let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = " ios developer"
        field.backgroundColor = .white
        return field
    }()
    
    private lazy var urlLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Url:"
        return label
    }()
    
    private lazy var urlField: UITextField = {
       let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = " @skazv"
        field.backgroundColor = .white
        return field
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Desctiption:"
        label.numberOfLines = 10
        return label
    }()
    
    private lazy var descriptionField: UITextField = {
       let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = " Waskdjfhalksdfhaskdjfhasdfha lskdjfhasdkfhasdf aksldfhaksdjfh"
        field.backgroundColor = .white
        return field
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBrown
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Private methods
extension ProfileSettingView {
    private func setup() {
        self.addSubview(stackView)
       // cardView.addSubview(cardView)
        //stackView.addSubview(nameField)
//        cardView.addSubview(nameLabel)
//        cardView.addSubview(nameField)
//        cardView.addSubview(saveButton)
//
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
          //  stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            descriptionField.heightAnchor.constraint(equalToConstant: 200),

        ])
    }
}
