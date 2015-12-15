//
//  JokeContent.swift
//  qiubai
//
//  Created by 马威 on 15/12/13.
//  Copyright © 2015年 vinylon. All rights reserved.
//

import Foundation
import SwiftyJSON

// 糗事内容
class JokeContent{
    var id : Int! // ?这个是什么id？
    var publishedAt : Int! // 发布时间
    var content : String! // 内容
    var commentsCount : Int! //评论数
    var image : String! // 图片
    
    init(json:JSON){
        id = json["id"].intValue
        publishedAt = json["published_at"].intValue
        content = json["content"].stringValue
        commentsCount = json["comments_count"].intValue
        image = json["image"].stringValue
    }
}