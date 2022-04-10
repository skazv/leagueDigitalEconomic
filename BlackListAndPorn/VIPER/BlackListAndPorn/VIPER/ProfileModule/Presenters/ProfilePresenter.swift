//
//  ProfilePresenter.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 09.04.2022.
//

import Foundation

class ProfilePresenter: ProfilePresenterProtocol {
    weak var view: ProfileViewProtocol?
    var interactor: ProfileInteractorInputProtocol?
    var router: ProfileRouterProtocol?
    
    func viewDidLoad() {
        if let personItem = interactor?.personItem {
            view?.show(person: personItem)
        }
    }
    
    func editPerson(title: String, content: String) {
        interactor?.editPerson(title: title, content: content)
    }
    
    func deletePerson() {
        interactor?.deletePerson()
    }
    
}

//MARK: -
extension ProfilePresenter: ProfileInteractorOutputProtocol {
    func didDeletePerson() {
        if let view = view {
            router?.navigateBackToListViewController(from: view)
        }
    }
    
    func didEditPerson(person: PersonModel) {
        view?.show(person: person)
    }
    
    
}
