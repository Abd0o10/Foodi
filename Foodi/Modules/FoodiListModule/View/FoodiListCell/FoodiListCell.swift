//
//  FoodiListCell.swift
//  Foodi
//
//  Created by 3bdo on 10/9/20.
//  Copyright © 2020 3bdo. All rights reserved.
//

import UIKit
import Kingfisher

class FoodiListCell: UICollectionViewCell{
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 5.0
    }
    
    override func prepareForReuse() {
        foodNameLabel.text = nil
        foodImageView.image = nil
    }
    
    func setup(imageURL: String?, name: String) {
        foodNameLabel.text = name
        foodImageView.kf.setImage(with: URL(string: imageURL ?? ""),
                                  placeholder: UIImage(named: "defaultImage"))

    }
    
}
