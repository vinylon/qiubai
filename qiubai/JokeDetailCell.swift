//
//  JokeDetailCell.swift
//  qiubai
//
//  Created by 马威 on 15/12/14.
//  Copyright © 2015年 vinylon. All rights reserved.
//

import UIKit
import Haneke
class JokeDetailCell: UITableViewCell {

    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var notlikeLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var pubishDtLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // 处理头像，圆形
        iconImage.layer.cornerRadius = iconImage.frame.size.width / 2.0
        iconImage.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func drawCell(joke: Joke){
        nameLabel.text = joke.user.name
        pubishDtLabel.text = Utils.formatData(joke.content.publishedAt)
        if joke.user.icon != ""{
            let iocnImageURL = Utils.getAvatarURL(joke.user.id, icon: joke.user.icon)
            iconImage.hnk_setImageFromURL(iocnImageURL)
        }
        contentLabel.text = joke.content.content
        likeLabel.text = "好笑(\(joke.votes.up))"
        notlikeLabel.text = "无聊(\(joke.votes.down))"
        commentLabel.text = "评论(\(joke.content.commentsCount))"
        contentImage.image = nil
        if joke.content.image != "" {
            contentImage.image = UIImage(named: "avatar")
            let imageURL = Utils.getImageURL(joke.content.id, image: joke.content.image, type: "small")
            contentImage.hnk_setImageFromURL(imageURL)
        }
    }

}
