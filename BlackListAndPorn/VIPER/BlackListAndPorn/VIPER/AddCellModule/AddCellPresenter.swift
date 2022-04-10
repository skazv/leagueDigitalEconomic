//
//  AddCellPresenter.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 10.04.2022.
//

import Foundation

class AddCellPresenter: AddCellPresenterProtocol {
    var view: AddCellViewProtocol?
    var interactor: AddCellInteractorInputProtocol?
    var router: AddCellRouterProtocol?
    var delegate: AddCellDelegate?
    
    func addPerson(name: String, section: Int) {
        let person = interactor?.savePerson(name: name, section: section)
        if let view = view, let person = person {
            router?.dismissAddPerson(from: view, completion: { [weak delegate] in
                delegate?.didAddPerson(person: person, section: section)
            })
        }
    }
    
}

//MARK: - InteractorOutputProtocol
extension AddCellPresenter: AddCellInteractorOutputProtocol {
}
