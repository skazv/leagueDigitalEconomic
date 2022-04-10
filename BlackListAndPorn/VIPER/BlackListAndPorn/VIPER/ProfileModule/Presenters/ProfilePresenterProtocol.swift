//
//  ProfilePresenterProtocol.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 09.04.2022.
//

import Foundation

protocol ProfilePresenterProtocol: AnyObject {
    
    var view: ProfileViewProtocol? { get set }
    var interactor: ProfileInteractorInputProtocol? { get set }
    var router: ProfileRouterProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func editPerson(title: String, content: String)
    func deletePerson()
}
