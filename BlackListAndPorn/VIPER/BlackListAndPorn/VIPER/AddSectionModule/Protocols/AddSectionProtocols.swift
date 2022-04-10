//
//  AddSectionProtocols.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 09.04.2022.
//

import UIKit

protocol AddSectionDelegate: AnyObject {
    func didAddCategory(category: Category)
}

protocol AddSectionViewProtocol: AnyObject {
    var presenter: AddSectionPresenterProtocol? { get set }
    // PRESENTER -> VIEW
}

protocol AddSectionPresenterProtocol: AnyObject {
    var view: AddSectionViewProtocol? { get set }
    var interactor: AddSectionInteractorInputProtocol? { get set }
    var router: AddSectionRouterProtocol? { get set }
    var delegate: AddSectionDelegate? { get set }
    
    // VIEW -> PRESENTER
    func viewWillAppear()
    func addCategory(name: String)
}

protocol AddSectionRouterProtocol: AnyObject {
    static func createAddSettingModul(with delegate: AddSectionDelegate) -> UIViewController
    
    // PRESENTER -> ROUTER
    func dismissAddSection(from view: AddSectionViewProtocol, completion: (() -> Void)?)
}

protocol AddSectionInteractorInputProtocol: AnyObject {
    var presenter: AddSectionInteractorOutputProtocol? { get set }
    var coreData: CoreDataManager { get set } //????
    
    // PRESENTER -> INTERACTOR
    func saveCategory(name: String) -> Category?
}

protocol AddSectionInteractorOutputProtocol: AnyObject {
}
