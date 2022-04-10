//
//  1.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 09.04.2022.
//

import Foundation

class AddSectionPresenter: AddSectionPresenterProtocol {
    var view: AddSectionViewProtocol?
    var interactor: AddSectionInteractorInputProtocol?
    var router: AddSectionRouterProtocol?
    var delegate: AddSectionDelegate?

    func viewWillAppear() {
    }
    
    func addCategory(name: String) {
        let category = interactor?.saveCategory(name: name)
        if let view = view, let category = category {
            router?.dismissAddSection(from: view, completion: { [weak delegate] in
                delegate?.didAddCategory(category: category)
            })
        }

    }

}

//MARK: - InteractorOutputProtocol
extension AddSectionPresenter: AddSectionInteractorOutputProtocol {
}
