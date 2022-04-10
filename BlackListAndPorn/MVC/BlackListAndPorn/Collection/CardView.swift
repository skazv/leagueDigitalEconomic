//
//  CardView.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 07.04.2022.
//

import Foundation
import UIKit

class CardView: UIView {
    private lazy var imageView: UIImageView = {
        guard let imageView = UIImageView.fromGif(frame: self.frame, resourceName: "kick1") else {
            let imageView = UIImageView()
            imageView.backgroundColor = .cyan
            return imageView
        }
        imageView.animationDuration = 0
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
extension CardView {
    private func setup() {
        self.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 360),
            imageView.heightAnchor.constraint(equalToConstant: 240),
        ])
    }
}
