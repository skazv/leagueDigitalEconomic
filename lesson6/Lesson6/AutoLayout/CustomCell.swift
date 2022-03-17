//
//  CustomCell.swift
//  Lesson6
//
//  Created by Suren Kazaryan on 11.03.2022.
//

import UIKit

class CustomCell: UITableViewCell {
    var changeDastination: ChangeDestinationProtocol?

    lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var saleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .gray
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 10
        
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Подробнее", for: .normal)
        button.setTitleColor(.systemGray2, for: .normal)
        button.setTitleColor(.red, for: .selected)
        button.addTarget(self, action: #selector(moreTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        button.setTitleColor(.red, for: .focused)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellInit(price: String, description: String, sale: String) {
        priceLabel.text = price
        descriptionLabel.text = description
        saleLabel.text = sale
    }
    
    @objc func tapped() {
        guard let delegate = changeDastination else {
            print("Fuck UP")
            return
        }
        delegate.changeDestinationTapped()
    }
    
    @objc func moreTapped() {
        guard let delegate = changeDastination else { return }
        delegate.addToStack()
    }

}


// MARK: - private methods
extension CustomCell {
    private func setup() {
        contentView.addSubview(cardView)
        
        self.backgroundColor = .secondarySystemBackground
        cardView.addSubview(saleLabel)
        cardView.addSubview(descriptionLabel)
        cardView.addSubview(moreButton)
        cardView.addSubview(priceLabel)
        cardView.addSubview(plusButton)
                
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            saleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            saleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: saleLabel.bottomAnchor, constant: 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: moreButton.topAnchor, constant: 4),
            
            moreButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            moreButton.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -23),
            
            priceLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -27),

            plusButton.trailingAnchor.constraint(equalTo: cardView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            plusButton.bottomAnchor.constraint(equalTo: cardView.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            plusButton.widthAnchor.constraint(equalToConstant: 72),
            plusButton.heightAnchor.constraint(equalToConstant: 34),
        ])
    }
    
}
