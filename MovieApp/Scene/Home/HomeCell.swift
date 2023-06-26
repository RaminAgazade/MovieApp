//
//  HomeCell.swift
//  MovieApp
//
//  Created by Ramin on 20.06.23.
//

import UIKit

class HomeCell: UICollectionViewCell {
    @IBOutlet private weak var collection: UICollectionView!
    
    private var movieItems = [MovieResult]()
    
    let cellId = "\(TopImageBottomLabelCell.self)"
    
    override func layoutSubviews() {
        collection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    func configure(data: [MovieResult]) {
        movieItems = data
        collection.reloadData()
    }
}

extension HomeCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TopImageBottomLabelCell
        cell.configure(data: movieItems[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 167, height: collectionView.frame.height)
    }
}
