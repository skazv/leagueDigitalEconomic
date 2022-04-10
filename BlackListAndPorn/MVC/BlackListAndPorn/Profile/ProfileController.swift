//
//  ProfileController.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 23.03.2022.
//

import UIKit

class ProfileController: UIViewController {

    let profileView = ProfileView()
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        setup()

    }


}

//MARK: - Private methods
extension ProfileController {
    private func setup() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
    }
    
    @objc func editTapped() {
        navigationController?.pushViewController(ProfileSettingViewController(), animated: true)
    }

}
