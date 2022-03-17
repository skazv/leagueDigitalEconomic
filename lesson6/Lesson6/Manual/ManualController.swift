//
//  ManualController.swift
//  Lesson6
//
//  Created by Suren Kazaryan on 07.03.2022.
//
// ВОПРОСЫ И ДОРАБОТКИ:
// 1) Сделать через колбеки
// 2) Переписать отделив вьюшку

import UIKit

class ManualController: UIViewController {
    let topView = TopView()
    
    private let customCellId = "custumCell"
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.present(SovestController(), animated: true)
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.register(ManualCustomCell.self, forCellReuseIdentifier: customCellId)
        tv.backgroundColor = .secondarySystemBackground
        tv.rowHeight = 190
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
        navigationController?.pushViewController(KrinjController(backgroundColor: 3), animated: true)
    }
    
}

// MARK: - Private methods
extension ManualController {
    
    private func topViewSetup() {
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(customView: topView.imageView),
            UIBarButtonItem(customView: topView.nameLabel)]
        let tap = UITapGestureRecognizer(target: self, action: #selector(imagePressed))
        topView.imageView.addGestureRecognizer(tap)
    }
    
    private func setup() {
        view.addSubview(tableView)
        tableView.frame = CGRect(
            x: view.frame.minX,
            y: view.frame.minY,
            width: view.frame.width,
            height: view.frame.height)
    }
}

// MARK: - Protocols UITableViewDataSource, UITableViewDelegate
extension ManualController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellId, for: indexPath) as? ManualCustomCell
        else { return UITableViewCell() }
        let model = models[indexPath.row]
        cell.cellInit(price: model.price,
                      description: model.description,
                      sale: model.sale)
        
        cell.callback = { [weak self] in
            self?.tabBarController?.selectedIndex = 3
        }
        
        cell.moreCallback = { [weak self] in
            self?.navigationController?.pushViewController(KrinjController(backgroundColor: 3), animated: true)
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
}
