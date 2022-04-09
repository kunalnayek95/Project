//
//  SearchTVC.swift
//  Instacoin
//
//  Created by Kunal on 05/04/22.
//

import UIKit

class SearchTVC: UITableViewCell {
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.userImg.layer.cornerRadius = self.userImg.frame.size.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
