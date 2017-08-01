//
//  CommentsTableViewCell.swift
//  PlayGround2
//
//  Created by Kevin on 7/27/17.
//  Copyright © 2017 Kevin. All rights reserved.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    @IBOutlet weak var playerComment: UILabel!
    @IBOutlet weak var playerUsername: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
