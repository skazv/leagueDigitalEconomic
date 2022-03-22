//
//  SelectionView.swift
//  lesson9
//
//  Created by Suren Kazaryan on 21.03.2022.
//
// ВОПРОСЫ/ДОРАБОТКИ
// 1) Передалать на table view???
// 2) Добавить билдер и нормальную кальеудяцию фреймов
// 3) Убрать колбэки переделать через инит

import UIKit

class SelectionView: UIView {
    static var exView: UIView?
    static var exImage: UIImageView?
    var callbackSex: (()->())?
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "circle"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.tintColor = .gray
        return iv
    }()
    
    private lazy var sexLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(name: String) {
        super.init(frame: .zero)
        sexLabel.text = name
        setup()
        makeViewClickable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Private methods
extension SelectionView {
    private func setup() {
        
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 12
        
        self.addSubview(imageView)
        self.addSubview(sexLabel)
        
        
        imageView.frame = CGRect(x: self.frame.maxX + 15,
                                 y: self.frame.midY + 15,
                                 width: 30,
                                 height: 30)
        sexLabel.frame = CGRect(x: imageView.frame.maxX + 15,
                                y: self.frame.midY + 15,
                                width: 120,
                                height: 30)
    }
    
    private func makeViewClickable() {
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(selected))
        self.addGestureRecognizer(tap)
    }
    
    @objc private func selected() {
        callbackSex?()
        checkingCard()
    }
    
    private func checkingCard() {
        if SelectionView.exView != nil {
            SelectionView.exView?.layer.borderWidth = 0
            SelectionView.exImage?.image = UIImage(named: "circle")
        }
        self.tintColor = .green
        self.layer.borderWidth = 1
        self.layer.borderColor = .init(red: 0, green: 1, blue: 0, alpha: 1)
        self.imageView.tintColor = .green
        self.imageView.image = .checkmark
        SelectionView.exView = self
        SelectionView.exImage = self.imageView
    }
}
