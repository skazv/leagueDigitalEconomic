//
//  AddCellRouter.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 10.04.2022.
//

import UIKit

class AddCellRouter: AddCellRouterProtocol {
    static func createAddPersonModul(with delegate: AddCellDelegate, section: Int) -> UIViewController {
        let addCellVC = AddCellView(titleHeader: "Add person")
        
        let presenter: AddCellPresenterProtocol & AddCellInteractorOutputProtocol = AddCellPresenter()
        let interactor: AddCellInteractorInputProtocol = AddCellInteractor()
        let router: AddCellRouterProtocol = AddCellRouter()

        addCellVC.presenter = presenter
        presenter.view = addCellVC
        presenter.router = router
        presenter.interactor = interactor
        presenter.delegate = delegate
        interactor.presenter = presenter
        addCellVC.section = section
        
        return addCellVC
    }
    
    func dismissAddPerson(from view: AddCellViewProtocol, completion: (() -> Void)?) {
        if let view = view as? UIViewController {
            view.dismiss(animated: true, completion: completion)
        }
    }
    
}
