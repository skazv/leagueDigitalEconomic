//
//  TopView.swift
//  Lesson6
//
//  Created by Suren Kazaryan on 07.03.2022.
//

import UIKit

class TopView: UIView {
    var navBarItemAction: (()->())?
    
    let topViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemRed
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    lazy var image: UIImage = {
        let image = UIImage(named: "technicalIcon")
        return image!
    }()
    
    lazy var topButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.customView?.translatesAutoresizingMaskIntoConstraints = false
        button.style = UIBarButtonItem.Style.done
        button.image = image
        return button
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "  Курсы IT"
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - private methods
extension TopView {
    private func config() {
        self.addSubview(topViewContainer)
        topViewContainer.addSubview(imageView)
        topViewContainer.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
}
