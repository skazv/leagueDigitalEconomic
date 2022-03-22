//
//  ViewController.swift
//  lesson9
//
//  Created by Suren Kazaryan on 21.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let first = SelectionView(name: "Мужской")
    let second = SelectionView(name: "Женский")
    let third = SelectionView(name: "Паркет")
    
    var message = "Пол не выбран, рекомендуем паркет"
    let resultController = ResultController(sex: "asd")
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        navigationItem.title = "Какой пол?"
        
        first.callbackSex = { [weak self] in
            self?.message = "Мужской"
        }
        second.callbackSex = { [weak self] in
            self?.message = "Женский"
        }
        third.callbackSex = { [weak self] in
            self?.message = "Паркет"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setupViews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let firstFrame = CGRect(x: 20,
                                y: view.safeAreaInsets.top + 20,
                                width: UIScreen.main.bounds.width - 20 - 20,
                                height: 60)
        let secondFrame = CGRect(x: 20,
                                 y: firstFrame.maxY + 20,
                                 width: UIScreen.main.bounds.width - 20 - 20,
                                 height: 60)
        let thirdFrame = CGRect(x: 20,
                                y: secondFrame.maxY + 20,
                                width: UIScreen.main.bounds.width - 20 - 20,
                                height: 60)
        
        let continueButtonFrame = CGRect(x: 20,
                                         y: view.frame.maxY - 60 - 50,
                                         width: UIScreen.main.bounds.width - 20 - 20,
                                         height: 60)
        
        first.frame = firstFrame
        second.frame = secondFrame
        third.frame = thirdFrame
        continueButton.frame = continueButtonFrame
    }
    
}

//MARK: - Private methods
extension ViewController {
    private func setupViews() {
        view.addSubview(first)
        view.addSubview(second)
        view.addSubview(third)
        view.addSubview(continueButton)
        
    }
    
    @objc private func continueTapped() {
        resultController.callback = { [weak self] in
            return self?.message ?? "Зачем эта проверка, если тут будет значение?"
        }
        navigationController?.pushViewController(resultController, animated: true)
    }
    
}
