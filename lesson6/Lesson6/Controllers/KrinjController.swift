//
//  ComposeController.swift
//  Lesson6
//
//  Created by Suren Kazaryan on 14.03.2022.
//

import UIKit

class KrinjController: UIViewController {
    var backgroundColor = 1
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Возможно я неправильно понял задание, если так, то, пожалуйста, свяжитесь со мной по телеге @skazv и не говорите моей бывшей, что я облажался с заданием"
        return label
    }()
    
    init(backgroundColor: Int) {
        self.backgroundColor = backgroundColor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch backgroundColor {
        case 1:
            view.alpha = 0.6
            view.backgroundColor = .systemBackground
        case 2: view.backgroundColor = .systemBackground
        case 3: view.backgroundColor = .systemBackground
        default:
            print(backgroundColor)
        }
        setup()
    }
    
}

//MARK: - Private methods
extension KrinjController {
    
    private func setup() {
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
}
