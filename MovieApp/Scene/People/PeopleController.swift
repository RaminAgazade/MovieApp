//
//  PeopleController.swift
//  MovieApp
//
//  Created by Ramin on 25.06.23.
//

import UIKit

class PeopleController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    
    let viewModel = PeopleViewModel()
    
    let cellId = "\(TopImageBottomLabelCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
       configureViewModel()
    }
    
    func configureUI() {
        collection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        
       }
    
    func configureViewModel() {
        viewModel.getPopularPeople()
        viewModel.successCallback = {
            self.collection.reloadData()
        }
        
    }

}


//MARK: collection configuration
extension PeopleController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TopImageBottomLabelCell
        cell.configure(data: viewModel.items[indexPath.item])
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 10, height: 220)
    }
    
    
}
