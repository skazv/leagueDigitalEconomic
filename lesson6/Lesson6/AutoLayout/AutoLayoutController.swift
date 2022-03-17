//
//  AutoLayoutController.swift
//  Lesson6
//
//  Created by Suren Kazaryan on 07.03.2022.
//
// ВОПРОСЫ И ДОРАБОТКИ:
// 1) Сделать через делегаты
// 2) Переписать отделив вьюшку

import UIKit

class AutoLayoutController: UIViewController {
    let topView = TopView()
    
    private let customCellId = "custumCell"
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.register(CustomCell.self, forCellReuseIdentifier: customCellId)
        tv.backgroundColor = .secondarySystemBackground
        tv.rowHeight = UITableView.automaticDimension
        tv.separatorColor = .secondarySystemBackground
        tv.separatorStyle = .none
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topViewSetup()
        setup()
    }
    
    @objc func imagePressed(sender: UIBarButtonItem) {
        navigationController?.present(KrinjController(backgroundColor: 1), animated: true, completion: .none)
    }
    
}

// MARK: - Private methods
extension AutoLayoutController {
    
    private func topViewSetup() {
        
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(customView: topView.imageView),
            UIBarButtonItem(customView: topView.nameLabel)]
        let tap = UITapGestureRecognizer(target: self, action: #selector(imagePressed))
        topView.imageView.addGestureRecognizer(tap)
        
    }
    
    private func setup() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
}

// MARK: - Delegate ChangeDestinationProtocol
extension AutoLayoutController: ChangeDestinationProtocol {
    func addToStack() {
        navigationController?.pushViewController(KrinjController(backgroundColor: 3), animated: true)
    }
    
    func changeDestinationTapped() {
        tabBarController?.selectedIndex = 3
    }
}

// MARK: - Protocols UITableViewDataSource, UITableViewDelegate
extension AutoLayoutController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellId, for: indexPath) as? CustomCell
        else { return UITableViewCell() }
        let model = models[indexPath.row]
        cell.cellInit(price: model.price,
                      description: model.description,
                      sale: model.sale)
        cell.changeDastination = self
        cell.selectionStyle = .none
        return cell
    }
}
