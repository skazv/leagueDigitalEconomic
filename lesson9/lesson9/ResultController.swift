//
//  ResultController.swift
//  lesson9
//
//  Created by Suren Kazaryan on 21.03.2022.
//

import UIKit

class ResultController: UIViewController {
    var callback: (()->(String))?
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "zxvxzcvsdfhsdfgafgs"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setup()
        resultLabel.text = callback?()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutSetup()
    }
    
    init(sex: String) {
        super.init(nibName: nil, bundle: nil)
        print(sex)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("Вот и все")
    }
    
}


//MARK: - Private methods
extension ResultController {
    private func setup() {
        view.addSubview(resultLabel)
    }
    
    private func layoutSetup() {
        let firstFrame = CGRect(x: 20,
                                y: view.safeAreaInsets.top + 20,
                                width: UIScreen.main.bounds.width - 20 - 20,
                                height: 60)
        resultLabel.frame = firstFrame
    }
}
