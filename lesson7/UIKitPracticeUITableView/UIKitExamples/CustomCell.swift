//
//  CustomCell.swift
//  UIKitExamples
//
//  Created by Александров Роман Витальевич on 10.03.2022.
//

import UIKit

final class CustomCell: UITableViewCell {
    
    lazy var customImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var customTitleLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 2
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    lazy var button: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .systemBrown
        btn.setTitle("+", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(title: String, imageString: String, rating: Int) {
        customTitleLabel.text = title
        customImageView.image = UIImage(named: imageString)
        ratingLabel.text = "Rating: "
        
        for _ in 0..<rating {
            ratingLabel.text! += "⭐"
        }
    }
}

// MARK: - Private methods
extension CustomCell {
    private func initCell() {
        contentView.addSubview(customImageView)
        contentView.addSubview(customTitleLabel)
        contentView.addSubview(button)
        contentView.addSubview(ratingLabel)

        NSLayoutConstraint.activate([
            customImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            customImageView.widthAnchor.constraint(equalToConstant: 100),
            customImageView.heightAnchor.constraint(equalToConstant: 100),
            customImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            
            customTitleLabel.topAnchor.constraint(equalTo: customImageView.topAnchor),
            customTitleLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 20),
            customTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            ratingLabel.topAnchor.constraint(equalTo: customTitleLabel.bottomAnchor, constant: 20),
            ratingLabel.leadingAnchor.constraint(equalTo: customTitleLabel.leadingAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: customTitleLabel.trailingAnchor, constant: -10),
            ratingLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            button.topAnchor.constraint(equalTo: customTitleLabel.bottomAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            button.widthAnchor.constraint(equalToConstant: 80),
            button.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
}
