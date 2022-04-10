//
//  PhotoViewController.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 25.03.2022.
//

import UIKit

class PhotoViewController: UIViewController {
    let collectionView = PhotoCollectionView()
    let cardView = CardView()
    
    override func loadView() {
        super.loadView()
        //view = collectionView
        view = cardView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo"
        setup()
    }
    
}

//MARK: - Private methods
extension PhotoViewController {
    private func setup() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

//MARK: - UICollectionViewDataSource
extension PhotoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 150
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = .systemCyan
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
//    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        <#code#>
//    }
}

//MARK: - UICollectionViewDelegate
extension PhotoViewController: UICollectionViewDelegate {
}

