//
//  CommentCell.swift
//  qiubai
//
//  Created by 马威 on 15/12/14.
//  Copyright © 2015年 vinylon. All rights reserved.
//

import UIKit
import Haneke

class CommentCell: UITableViewCell {

    var comment : Comment!
    @IBOutlet weak var floorLabel: UILabel!
   
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        iconImage.layer.cornerRadius = iconImage.frame.size.width / 2.0
        iconImage.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func drawCell(comment:Comment){
        floorLabel.text = "\(comment.content.floor)楼"
        contentLabel.text = comment.content.content
        nameLabel.text = comment.user.name
        if comment.user.icon != "" {
            iconImage.image = UIImage(named: "avatar")
            let imageURL = Utils.getAvatarURL(comment.user.id, icon: comment.user.icon)
            iconImage.hnk_setImageFromURL(imageURL)
        }
    }

}
