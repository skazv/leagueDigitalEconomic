//
//  ProfileRouter.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 09.04.2022.
//

import UIKit

class ProfileRouter: ProfileRouterProtocol {
    static func createProfileRouterModule(with person: PersonModel) -> UIViewController {
        let profileVC = ProfileViewController()
        
        let presenter: ProfilePresenter & ProfilePresenterProtocol = ProfilePresenter()
        profileVC.presenter = presenter
        presenter.view = profileVC
        
        let interactor: ProfileInteractorInputProtocol = ProfileInteractor()
        interactor.personItem = person
        interactor.presenter = presenter
        presenter.interactor = interactor
        
        let router: ProfileRouterProtocol = ProfileRouter()
        presenter.router = router
        
        return profileVC
    }
    
    func navigateBackToListViewController(from view: ProfileViewProtocol) {
        guard let viewVC = view as? UIViewController else {
            fatalError()
        }
        viewVC.navigationController?.popViewController(animated: true)
    }
    
    
}
