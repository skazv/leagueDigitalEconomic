//
//  ManualCustomCell.swift
//  Lesson6
//
//  Created by Suren Kazaryan on 16.03.2022.
//
// ВОПРОСЫ И ДОРАБОТКИ:
// 1) Добавить колбеки
// 2) Как и в какой момент считать высоту и ширину?
// 3) Не создавать saleLabel, если приходит пустотая строка
// 4) Добавить optional!!!!!!

import UIKit

class ManualCustomCell: UITableViewCell {
    var callback: (() -> Void)?
    var moreCallback: (() -> Void)?
    
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
        callback?()
    }
    
    @objc func moreTapped() {
        moreCallback?()
    }
    
}


// MARK: - private methods
extension ManualCustomCell {
    
    private func setup() {
        contentView.addSubview(cardView)
        cardView.addSubview(descriptionLabel)
        cardView.addSubview(moreButton)
        cardView.addSubview(priceLabel)
        cardView.addSubview(plusButton)
        cardView.addSubview(saleLabel)
        
        contentView.backgroundColor = .secondarySystemBackground
        
        cardView.frame = CGRect(
            x: 16,
            y: 16,
            width: UIScreen.main.bounds.width - 32,
            height: 174)
        
        plusButton.frame = CGRect(
            x: cardView.bounds.maxX - 92,
            y: cardView.bounds.maxY - 54,
            width: 72,
            height: 34)
        
        priceLabel.frame = CGRect(
            x: cardView.bounds.minX + 20,
            y: cardView.bounds.maxY - 49,
            width: 65,
            height: 22)
        
        moreButton.frame = CGRect(
            x: cardView.bounds.minX + 20,
            y: priceLabel.frame.minY - 43,
            width: 100,
            height: 20)
        
        descriptionLabel.frame = CGRect(
            x: cardView.bounds.minX + 20,
            y: moreButton.frame.minY - 43,
            width: 340,
            height: 60)
        
        saleLabel.frame = CGRect(
            x: cardView.bounds.minX + 20,
            y: descriptionLabel.frame.minY - 20,
            width: 220,
            height: 18)
        
    }
    
}

