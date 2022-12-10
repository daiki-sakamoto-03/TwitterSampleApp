//
//  MainTableViewCell.swift
//  TwitterSampleApp
//
//  Created by 坂本　大貴 on 2022/12/10.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
