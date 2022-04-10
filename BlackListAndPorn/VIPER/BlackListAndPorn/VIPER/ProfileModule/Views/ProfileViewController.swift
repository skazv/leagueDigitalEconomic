//
//  ProfileViewController.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 09.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    var presenter: ProfilePresenterProtocol?
    let profile = ProfileView()
    
    override func loadView() {
        view = profile
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setup()
    }
    
}

//MARK: - Private methods
extension ProfileViewController {
    private func setup() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        
    }
    
    @objc private func editTapped() {
        let alertController = UIAlertController(title: "Edit Todo Item", message: "Enter title and content", preferredStyle: .alert)

        alertController.addTextField(configurationHandler: nil)
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak self](_) in
            let titleText = alertController.textFields![0].text ?? ""
            let contentText = alertController.textFields![1].text ?? ""
            guard !titleText.isEmpty else { return }
            self?.presenter?.editPerson(title: titleText, content: contentText) //Todo(title: titleText, content: contentText)
        }))

        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}

//MARK: - Protocol
extension ProfileViewController: ProfileViewProtocol {
    func show(person: PersonModel) {
        profile.updateView(name: person.name, image: .add)
    }
    
    
}
