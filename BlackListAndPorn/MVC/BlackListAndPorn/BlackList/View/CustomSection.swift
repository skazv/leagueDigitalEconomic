//
//  SectionHeaderController.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 23.03.2022.
//

import UIKit

class CustomSection: UIView {
    var openAddCellSetting: (()->Void)?
    var deleteSection: (()->Void)?
    var moveSection: (()->Void)?
    var changeSectionTitle: (()->Void)?
    var openCloseSection: (()->Void)?
    
    lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBrown
        view.layer.cornerRadius = 12
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeLeft))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeDown))
        downSwipe.direction = .right
        view.addGestureRecognizer(downSwipe)
        return view
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: .contactAdd)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addPressed), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(titleTapped))
        gesture.minimumPressDuration = 1
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(gesture)
        return label
    }()
    
    lazy var openCloseButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Close", for: .normal)
        button.addTarget(self, action: #selector(openClose), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sectionInit(sectionColorStr: String) {
        topView.backgroundColor = UIColor(named: sectionColorStr)
    }
    
    @objc func addPressed() {
        openAddCellSetting?()
    }
    
    @objc func didSwipeLeft() {
        deleteSection?()
    }
    
    @objc func didSwipeDown(sender: UISwipeGestureRecognizer) {
        moveSection?()
    }
    
    @objc func titleTapped(sender: UILongPressGestureRecognizer) {
        if (sender.state == UILongPressGestureRecognizer.State.began) {
            changeSectionTitle?()
        }
    }
    
    @objc func openClose() {
        openCloseSection?()
    }
    
}

//MARK: - Private methods
extension CustomSection {
    private func setupView() {
        self.addSubview(topView)
        topView.addSubviews(views: [
            addButton,
            titleLabel,
            openCloseButton,
        ])
        
        NSLayoutConstraint.activate([

            topView.topAnchor.constraint(equalTo: self.topAnchor),
            topView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            topView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            topView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            addButton.topAnchor.constraint(equalTo: topView.topAnchor, constant: 5),
            addButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10),
            addButton.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -5),
            
            titleLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: addButton.trailingAnchor, constant: 5),
            titleLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -5),

            openCloseButton.topAnchor.constraint(equalTo: topView.topAnchor, constant: 5),
            openCloseButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20),
            openCloseButton.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -5)
        ])
    }
}
