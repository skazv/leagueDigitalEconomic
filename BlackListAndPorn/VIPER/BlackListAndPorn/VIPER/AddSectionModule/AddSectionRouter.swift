//
//  2.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 09.04.2022.
//

import Foundation
import UIKit

class AddSectionRouter: AddSectionRouterProtocol {
    
    static func createAddSettingModul(with delegate: AddSectionDelegate) -> UIViewController {
        let addVC = AddSectionView(titleHeader: "Add category")
        
        let presenter: AddSectionPresenterProtocol & AddSectionInteractorOutputProtocol = AddSectionPresenter()
        let interactor: AddSectionInteractorInputProtocol = AddSectionInteractor()
        let router: AddSectionRouterProtocol = AddSectionRouter()
        
        addVC.presenter = presenter
        presenter.view = addVC
        presenter.router = router
        presenter.interactor = interactor
        presenter.delegate = delegate
        interactor.presenter = presenter
        
        return addVC
    }
    
    func dismissAddSection(from view: AddSectionViewProtocol, completion: (() -> Void)?) {
        if let view = view as? UIViewController {
            view.dismiss(animated: true, completion: completion)
        }
    }
    
}
