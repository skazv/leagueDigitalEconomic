//
//  PhotoCollectionViewController.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 25.03.2022.


import UIKit

private let reuseIdentifier = "Cell"

class PhotoCollectionView: UICollectionView {
    
    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Private methods
extension PhotoCollectionView {
    private func setup() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.collectionViewLayout = layout
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemBackground

    }
}
