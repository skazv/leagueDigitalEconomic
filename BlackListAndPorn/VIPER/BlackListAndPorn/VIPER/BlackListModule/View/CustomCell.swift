//
//  CustomViewCell.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 23.03.2022.
//

import UIKit

class CustomCell: UITableViewCell {
    var infoCallback: (()->Void)?
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        //activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "He destroy my live and make me feel pain."
        label.font = .italicSystemFont(ofSize: 15)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var hateLevelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hate lvl: 👎😠😡👿🤬"
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBrown
        button.setTitle("i", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(infoTapped), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellInit(name: String, image: UIImage) {
        nameLabel.text = name
        avatarImageView.image = image
    }

}


// MARK: - private methods
extension CustomCell {
    private func setup() {
        self.backgroundColor = .secondarySystemBackground
        contentView.addSubview(cardView)
        
        cardView.addSubviews(views: [
            avatarImageView,
            nameLabel,
            descriptionLabel,
            hateLevelLabel,
            infoButton
        ])
        
        avatarImageView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            avatarImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8),
            avatarImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110),
            avatarImageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8),
            
            activityIndicator.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            hateLevelLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            hateLevelLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            hateLevelLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            infoButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            infoButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10),
            infoButton.widthAnchor.constraint(equalToConstant: 40),
            infoButton.heightAnchor.constraint(equalToConstant: 30)

        ])
    }
    
    @objc private func infoTapped() {
        infoCallback?()
    }
    
}
