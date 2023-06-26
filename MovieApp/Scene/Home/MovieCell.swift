//
//  MovieCell.swift
//  MovieApp
//
//  Created by Ramin on 21.06.23.
//

import UIKit

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(data: MovieResult) {
        titleLabel.text = data.title
        posterImage.loadUrl(data.posterPath ?? "")
    }
}
