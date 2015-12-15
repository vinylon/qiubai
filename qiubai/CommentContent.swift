//
//  CommentContent.swift
//  qiubai
//
//  Created by 马威 on 15/12/13.
//  Copyright © 2015年 vinylon. All rights reserved.
//

import Foundation
import SwiftyJSON

// 评论
class CommentContent{
    var id : Int! // 评论id
    var floor : Int! // 几楼
    var content : String! // 内容
    
    init(json:JSON){
        id = json["id"].intValue
        floor = json["floor"].intValue
        content = json["content"].stringValue
    }
}