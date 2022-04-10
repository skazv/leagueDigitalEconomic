//
//  InfoViewController.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 26.03.2022.
//

import UIKit

class InfoViewController: UIViewController {
    let profileView = ProfileView()
    let profileSettingViewController = ProfileSettingViewController()
    //let person: Person?

    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    init(title: String, image: UIImage) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        profileView.updateView(name: title, image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Private methods
extension InfoViewController {
    private func setup() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
    }
    
    @objc func editTapped() {
        self.navigationController?.pushViewController(profileSettingViewController, animated: true)
    }

}
