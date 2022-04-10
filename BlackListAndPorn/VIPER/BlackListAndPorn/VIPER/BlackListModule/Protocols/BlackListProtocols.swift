//
//  ViewProtocol.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 08.04.2022.
//

import UIKit

protocol BlackListViewProtocol: AnyObject {
    var presenter: BlackListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func reloadView(with categories: [CategoryModel])
    func didAddCategory(category: CategoryModel)
    func didDeleteCategory(section: Int)
    func didAddPerson(person: PersonModel, section: Int)
    func didDeletePerson(with indexPath: IndexPath)
    func didMovePerson(sourceIndexPath: IndexPath, destinationIndexPath: IndexPath)
}

protocol BlackListPresenterProtocol: AnyObject {
    var view: BlackListViewProtocol? { get set }
    var interactor: BlackListInteractorInputProtocol? { get set }
    var router: BlackListRouterProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func addCategory(from view: BlackListViewProtocol)
    func deleteCategory(section: Int)
    func addPerson(from view: BlackListViewProtocol, with section: Int)
    func deletePerson(with indexPath: IndexPath)
    func movePerson(sourceIndexPath: IndexPath, destinationIndexPath: IndexPath)
}

protocol BlackListRouterProtocol: AnyObject {
    static func createBlackListModul() -> UIViewController
    
    // PRESENTER -> ROUTER
    func presentAddSectionScreen(from view: BlackListViewProtocol)
    func presentAddCellScreen(from view: BlackListViewProtocol, with section: Int)
    func presentProfileScreen(from view: BlackListViewProtocol, for person: PersonModel)
}

protocol BlackListInteractorInputProtocol: AnyObject {
    var presenter: BlackListInteractorOutputProtocol? { get set }
    var coreData: CoreDataManager? { get set }
    
    // PRESENTER -> INTERACTOR
    func fetchCategories()
    func deleteCategory(section: Int)
    func deletePerson(with indexPath: IndexPath)
    func movePerson(sourceIndexPath: IndexPath, destinationIndexPath: IndexPath)
}

protocol BlackListInteractorOutputProtocol: AnyObject {
    
    // INTERACTOR -> PRESENTER
    func didFetchCategories(categories: [Category])
    func didDeleteCategory(section: Int)
    func didDeletePerson(with indexPath: IndexPath)
    func didMovePerson(sourceIndexPath: IndexPath, destinationIndexPath: IndexPath)
}
