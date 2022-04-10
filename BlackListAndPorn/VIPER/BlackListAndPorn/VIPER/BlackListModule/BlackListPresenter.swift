//
//  Presenter.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 09.04.2022.
//

import Foundation

class BlackListPresenter: BlackListPresenterProtocol {
    var view: BlackListViewProtocol?
    var interactor: BlackListInteractorInputProtocol?
    var router: BlackListRouterProtocol?
    
    func viewDidLoad() {
        interactor?.fetchCategories()
    }
    
    func addCategory(from view: BlackListViewProtocol) {
        router?.presentAddSectionScreen(from: view)
    }
    
    func deleteCategory(section: Int) {
        interactor?.deleteCategory(section: section)
    }
    
    func addPerson(from view: BlackListViewProtocol, with section: Int) {
        router?.presentAddCellScreen(from: view, with: section)
    }
    
    func deletePerson(with indexPath: IndexPath) {
        interactor?.deletePerson(with: indexPath)
    }
    
    func movePerson(sourceIndexPath: IndexPath, destinationIndexPath: IndexPath) {
        interactor?.movePerson(sourceIndexPath: sourceIndexPath, destinationIndexPath: destinationIndexPath)
    }
    
}

//MARK: - InteractorOutputProtocol
extension BlackListPresenter: BlackListInteractorOutputProtocol {
    func didFetchCategories(categories: [Category]) {
        view?.reloadView(with: categories.map({ category in
            let categoryModel = CategoryModel(name: category.name ?? "Noname", imageUrl: "LOL")
            if let persons = try? CoreDataManager.fetchPersonsByCategory(category: category) {
                categoryModel.persons = persons.map { person in
                    return PersonModel(name: person.name ?? "Noname")
                }
            }
            return categoryModel
        }))
        
    }
    
    func didDeleteCategory(section: Int) {
        view?.didDeleteCategory(section: section)
    }
    
    func didDeletePerson(with indexPath: IndexPath) {
        view?.didDeletePerson(with: indexPath)
    }
    
    func didMovePerson(sourceIndexPath: IndexPath, destinationIndexPath: IndexPath) {
        view?.didMovePerson(sourceIndexPath: sourceIndexPath, destinationIndexPath: destinationIndexPath)
    }
    
}

extension BlackListPresenter: AddSectionDelegate {
    func didAddCategory(category: Category) {
        let categoryModel = CategoryModel(name: category.name ?? "Noname", imageUrl: "LOL2")
        view?.didAddCategory(category: categoryModel)
    }
    
}

extension BlackListPresenter: AddCellDelegate {
    func didAddPerson(person: Person, section: Int) {
        let personModel = PersonModel(name: person.name ?? "Noname")
        view?.didAddPerson(person: personModel, section: section)
    }
}
