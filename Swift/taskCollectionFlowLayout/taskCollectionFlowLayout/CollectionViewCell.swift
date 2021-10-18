//
//  CollectionViewCell.swift
//  taskCollectionFlowLayout
//
//  Created by Yogesh Patel on 21/04/18.
//  Copyright © 2018 Yogesh Patel. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet var mainView: UIView!
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.layer.cornerRadius = 13.0
        self.mainView.layer.shadowColor = UIColor.blue.cgColor
        self.mainView.layer.shadowOpacity = 0.5
        self.mainView.layer.shadowOffset = .zero
        self.mainView.layer.shadowPath = UIBezierPath(rect: self.mainView.bounds).cgPath
        self.mainView.layer.shouldRasterize = true
    }

}
