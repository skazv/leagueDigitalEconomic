//
//  ViewController.swift
//  BlackList
//
//  Created by Suren Kazaryan on 21.03.2022.
//

import UIKit

struct BlackList {
    subscript(index: Int) -> String {
        switch index {
        case 0: return "Бывшие"
        case 1: return "Должники"
        case 2: return "Не любят Miyagi"
        case 3: return "Не пришласившие на ДР"
        default:
            print("ERROR")
            return "ERROR"
        }
    }
}

class ViewController: UIViewController {
    
    var array = [["Катя", "Таня", "Вика", "Эля"], ["Света", "Настя", "Элвира"], ["Жанна", "Боня", "Саша"], ["Кристина", "Тая", "Сая"]]
    let addViewController = AddViewController()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .systemCyan
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Black List"
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        navigationItem.rightBarButtonItem = editButton
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        setup()
    }
    
    @objc func editTapped() {
        tableView.isEditing = !tableView.isEditing
    }
    
    @objc func addTapped() {
        addViewController.callback = { [weak self] name, selectedRow in
            self?.array[selectedRow].insert(name, at: 0)
            self?.tableView.insertRows(at: [IndexPath(row: 0, section: selectedRow)], with: .top)
        }
        navigationController?.pushViewController(addViewController, animated: true)
    }


}

//MARK: - Protocols
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .systemBrown
        cell.textLabel?.text = array[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return BlackList()[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            array[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = array[sourceIndexPath.section][sourceIndexPath.row]
        array[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        array[destinationIndexPath.section].insert(item, at: destinationIndexPath.row)
    }
    
}

//MARK: - Private methods
extension ViewController {
    private func setup() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
