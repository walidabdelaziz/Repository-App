//
//  ReposTVCell.swift
//  Repository-App
//
//  Created by Walid Ahmed on 13/06/2023.
//

import UIKit

class ReposTVCell: UITableViewCell {

    @IBOutlet weak var detailsLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bgV: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgV.dropShadow(radius: 1, opacity: 0.06, offset: CGSize(width: 1, height: 1))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
