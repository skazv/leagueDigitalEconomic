//
//  AddCellProtocols.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 10.04.2022.
//

import Foundation

import UIKit

protocol AddCellDelegate: AnyObject {
    func didAddPerson(person: Person, section: Int)
}

protocol AddCellViewProtocol: AnyObject {
    var presenter: AddCellPresenterProtocol? { get set }
    // PRESENTER -> VIEW
}

protocol AddCellPresenterProtocol: AnyObject {
    var view: AddCellViewProtocol? { get set }
    var interactor: AddCellInteractorInputProtocol? { get set }
    var router: AddCellRouterProtocol? { get set }
    var delegate: AddCellDelegate? { get set }
    
    // VIEW -> PRESENTER
    func addPerson(name: String, section: Int)
}

protocol AddCellRouterProtocol: AnyObject {
    static func createAddPersonModul(with delegate: AddCellDelegate, section: Int) -> UIViewController
    
    // PRESENTER -> ROUTER
    func dismissAddPerson(from view: AddCellViewProtocol, completion: (() -> Void)?)
}

protocol AddCellInteractorInputProtocol: AnyObject {
    var presenter: AddCellInteractorOutputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func savePerson(name: String, section: Int) -> Person?
}

protocol AddCellInteractorOutputProtocol: AnyObject {
}
