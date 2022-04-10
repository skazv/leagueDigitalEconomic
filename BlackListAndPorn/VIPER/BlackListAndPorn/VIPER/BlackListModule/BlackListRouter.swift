//
//  Router.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 09.04.2022.
//

import Foundation
import UIKit

class BlackListRouter: BlackListRouterProtocol {
    
    static func createBlackListModul() -> UIViewController {
        let blackListViewController = BlackListViewController()
        let presenter: BlackListPresenterProtocol & BlackListInteractorOutputProtocol = BlackListPresenter()
        let interactor: BlackListInteractorInputProtocol = BlackListInteractor()
        let router = BlackListRouter()
        
        blackListViewController.presenter = presenter
        presenter.view = blackListViewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return blackListViewController
    }
    
    func presentProfileScreen(from view: BlackListViewProtocol, for person: PersonModel) {
        let profileVC = ProfileRouter.createProfileRouterModule(with: person)
        
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid protocol")
        }
        
        viewVC.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    func presentAddSectionScreen(from view: BlackListViewProtocol) {
        guard let delegate = view.presenter as? AddSectionDelegate else { return }
        let addSectionVC = AddSectionRouter.createAddSettingModul(with: delegate)

        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid protocol")
        }
        
        viewVC.navigationController?.present(addSectionVC, animated: true, completion: nil)
    }
    
    func presentAddCellScreen(from view: BlackListViewProtocol, with section: Int) {
        guard let delegate = view.presenter as? AddCellDelegate else {
            print("FuckUP")
            return
        }
        let addCellVC = AddCellRouter.createAddPersonModul(with: delegate, section: section)
        
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid protocol")
        }
        
        viewVC.navigationController?.present(addCellVC, animated: true, completion: nil)
    }
    
    
    
}
