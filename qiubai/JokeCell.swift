//
//  JokeCell.swift
//  qiubai
//
//  Created by 马威 on 15/12/13.
//  Copyright © 2015年 vinylon. All rights reserved.
//

import UIKit
import Haneke

class JokeCell: UITableViewCell {

    var delegate : UserInfoDelegate!
    
    var joke : Joke!
    
    @IBOutlet weak var iocnImageView: UIImageView!
    
 
    @IBOutlet weak var commentLabel: UILabel!
  
    @IBOutlet weak var dislikeLabel: UILabel!
  
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // 处理头像，圆形
        iocnImageView.layer.cornerRadius = iocnImageView.frame.size.width / 2.0
        iocnImageView.clipsToBounds = true
        
        // 图片支持点击手势
        //iocnImageView.userInteractionEnabled = true
        
        //contentImageView.userInteractionEnabled = true
        
        // 给头像、内容图片添加点击手势
        
        let singleIocnTapGesture = UITapGestureRecognizer(target: self, action: "iocnImageViewTapped:")
        singleIocnTapGesture.delegate = self
        iocnImageView.addGestureRecognizer(singleIocnTapGesture)
        
        let singleImageTapGesture = UITapGestureRecognizer(target: self, action: "contentImageViewTapped:")
        singleImageTapGesture.delegate = self
        
        contentImageView.addGestureRecognizer(singleImageTapGesture)

    }
    
    func drawCell(index: Int) {
        userNameLabel.text = joke.user.name
        publishDateLabel.text = Utils.formatData(joke.content.publishedAt)
        let iocnImageURL = Utils.getAvatarURL(joke.user.id, icon: joke.user.icon)
        iocnImageView.tag = index
        contentImageView.tag = index
        iocnImageView.hnk_setImageFromURL(iocnImageURL)
        contentLabel.text = joke.content.content
        likeLabel.text = "好笑(\(joke.votes.up))"
        dislikeLabel.text = "无聊(\(joke.votes.down))"
        commentLabel.text = "评论(\(joke.content.commentsCount))"
        contentImageView.image = nil
        if joke.content.image != "" {
            contentImageView.image = UIImage(named: "avatar")
            let imageURL = Utils.getImageURL(joke.content.id, image: joke.content.image, type: "small")
            contentImageView.hnk_setImageFromURL(imageURL)
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func iocnImageViewTapped(sender: AnyObject) {
        let iocnImageView = sender as! UITapGestureRecognizer
        delegate.showUserInfo(iocnImageView.view!.tag)
    }
    
    func contentImageViewTapped(sender: AnyObject) {
        let imageView = sender as! UITapGestureRecognizer
        delegate.showImageInfo(imageView.view!.tag)
    }
}
