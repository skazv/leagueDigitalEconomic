//
//  ProfileView.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 25.03.2022.
//

import UIKit

class ProfileView: UIView {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .secondarySystemBackground
        return scrollView
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "SurenAvatar"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 50
        return imageView
    }()
    
    private lazy var nameSurnameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Suren Kazaryan"
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var jobLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "iOS (swift) developer"
        label.font = .italicSystemFont(ofSize: 16)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var sexyRatingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Сексуальность: ⭐⭐⭐⭐⭐"
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var nickNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "@skazv"
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var descriptionHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "About me"
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "  К - Красивый\n  Р - Романтичный\n  А - Амбициозный\n  Ш - ШИКАРНЫЙ\n\n  Гений, филантроп, программист и просто сексуальный парень. \n   Рустам Рептилоид, Бред Пит, Бил Гейтс - все хотели бы быть мной, но не могут. \nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
        label.numberOfLines = 0
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(name: String, image: UIImage) {
        nameSurnameLabel.text = name
        avatarImageView.image = image
    }
    
}

//MARK: - Private methods
extension ProfileView {
    private func setup() {
        self.addSubview(scrollView)
        scrollView.addSubviews(views: [
            avatarImageView,
            nameSurnameLabel,
            jobLabel,
            sexyRatingLabel,
            nickNameLabel,
            descriptionHeaderLabel,
            descriptionLabel
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            avatarImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            nameSurnameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            nameSurnameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            nameSurnameLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            
            jobLabel.topAnchor.constraint(equalTo: nameSurnameLabel.bottomAnchor, constant: 5),
            jobLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            jobLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            
            sexyRatingLabel.topAnchor.constraint(equalTo: jobLabel.bottomAnchor, constant: 5),
            sexyRatingLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            sexyRatingLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            
            nickNameLabel.topAnchor.constraint(equalTo: sexyRatingLabel.bottomAnchor, constant: 5),
            nickNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            nickNameLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            
            descriptionHeaderLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            descriptionHeaderLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -30),
            descriptionHeaderLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            descriptionHeaderLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionHeaderLabel.bottomAnchor, constant: 5),
            descriptionLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -30),
            descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            descriptionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50)
        ])
    }
    
}
