//
//  Comment.swift
//  qiubai
//
//  Created by 马威 on 15/12/13.
//  Copyright © 2015年 vinylon. All rights reserved.
//

import Foundation
import SwiftyJSON

// 评论
class Comment{
    var user : User! // 评论用户
    var content : CommentContent! //评论内容
    
    init(user : User, content : CommentContent){
        self.user = user
        self.content = content
    }
}