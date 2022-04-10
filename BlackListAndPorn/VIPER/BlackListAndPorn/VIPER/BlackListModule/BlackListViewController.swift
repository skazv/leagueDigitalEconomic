//
//  BlackListViewController.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 08.04.2022.
//

import UIKit
import CoreData

class BlackListViewController: UIViewController {
    var presenter: BlackListPresenterProtocol?
    let tableView = TableView()
    let cellId = "Cell"
    var categories: [CategoryModel] = [] {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setup()
    }
    

}

//MARK: - Private methods
extension BlackListViewController {
    private func setup() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Bitch Mode", style: .done, target: self, action: #selector(modeTapped))

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellId)
        tableView.dragDelegate = self
        tableView.dropDelegate = self
    }
    
    @objc private func addTapped() {
        presenter?.addCategory(from: self)

    }
    
    @objc private func modeTapped() {
        
        print("-MODEL-")
        for category in categories {
            print("\nCategory: \(category.name)")
            if let persons = category.persons {
                for person in persons {
                    print("   -Person: \(person.name)")
                }
            }
        }
        
    }
    
}

//MARK: - BlackListViewProtocol
extension BlackListViewController: BlackListViewProtocol {
    
    func reloadView(with categories: [CategoryModel]) {
        self.categories = categories
        tableView.reloadData()
    }
    
    func didAddCategory(category: CategoryModel) {
        categories.insert(category, at: categories.count)
        tableView.beginUpdates()
        tableView.insertSections(IndexSet(integer: categories.count - 1), with: .fade)
        tableView.endUpdates()
    }
    
    func didDeleteCategory(section: Int) {
        categories.remove(at: section)
        tableView.beginUpdates()
        tableView.deleteSections(IndexSet(integer: section), with: .left)
        tableView.endUpdates()
    }
    
    func didAddPerson(person: PersonModel, section: Int) {
        let count = categories[section].persons?.count ?? 0
        if categories[section].persons == nil {
            categories[section].persons = [person]
        } else {
            categories[section].persons?.append(person)
        }
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: count, section: section)], with: .fade)
        tableView.endUpdates()
    }
    
    func didDeletePerson(with indexPath: IndexPath) {
        categories[indexPath.section].persons!.remove(at: indexPath.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .left)
        tableView.endUpdates()
    }
    
    func didMovePerson(sourceIndexPath: IndexPath, destinationIndexPath: IndexPath) {
//        let ss = sourceIndexPath.section
//        let sr = sourceIndexPath.row
//        let ds = destinationIndexPath.section
//        let dr = destinationIndexPath.row
        
//        if ss != ds {
//            guard let sourceCell = categories[ss].persons?[sr] else { return }
//            //updateId(section: ds, row: dr, update: .changeSection)
//            //sourceCell.id = Int64(dr) + 1
//            //CoreData.shared.categoryArray[ds].addToPersons(sourceCell)
//        } else {
//            guard let sourceCell = CoreData.shared.categoryArray[ss].personsArray?[sr] else { return }
//            guard let destCell = CoreData.shared.categoryArray[ds].personsArray?[dr] else { return }
//            let sourcId = sourceCell.id
//            sourceCell.id = destCell.id
//            destCell.id = sourcId
//        }
    }
    
}

//MARK: - UITableViewDataSorce
extension BlackListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = CustomSection()
        let category = categories[section]
        sectionView.sectionInit(name: category.name)
        
        sectionView.deleteSection = { [weak self] in
            self?.presenter?.deleteCategory(section: section)
        }
        
        sectionView.openAddCell = { [weak self] in
            guard let self = self else { return }
            self.presenter?.addPerson(from: self, with: section)
        }
        
        return sectionView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CustomCell else { return UITableViewCell() }
        
        guard let persons = categories[indexPath.section].persons else { return cell }
        let person = persons[indexPath.row]
        cell.cellInit(name: person.name, image: .add)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter?.deletePerson(with: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        presenter?.movePerson(sourceIndexPath: sourceIndexPath, destinationIndexPath: destinationIndexPath)
        //Person.movePerson(sourceIndexPath: sourceIndexPath, destinationIndexPath: destinationIndexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories[section].persons?.count ?? 0
    }

}

//MARK: - UITableViewDragDelegate
extension  BlackListViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return [UIDragItem(itemProvider: NSItemProvider())]
    }
}


//MARK: - UITableViewDropDelegate
extension  BlackListViewController: UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        if session.localDragSession != nil {
            return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        
        return UITableViewDropProposal(operation: .cancel, intent: .unspecified)
    }
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
    }
    
}

//MARK: - UITableViewDelegate
extension BlackListViewController: UITableViewDelegate  {
}
