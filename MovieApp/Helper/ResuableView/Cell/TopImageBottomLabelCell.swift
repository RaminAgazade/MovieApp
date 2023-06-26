//
//  TopImageBottomLabelCell.swift
//  MovieApp
//
//  Created by Ramin on 25.06.23.
//

import UIKit

protocol TopImageBottomLabelCellProtocolTest {
    var titleText: String { get }
}

protocol TopImageBottomLabelCellProtocol {
    var titleText: String {get}
    var imageUrl: String {get}
}

class TopImageBottomLabelCell: UICollectionViewCell {
    @IBOutlet private weak var topImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func layoutSubviews() {
        topImage.layer.cornerRadius = 20
    }
    
    
    func configure(data: TopImageBottomLabelCellProtocol) {
        titleLabel.text = data.titleText
        topImage.loadUrl(data.imageUrl)
    }
    
}
