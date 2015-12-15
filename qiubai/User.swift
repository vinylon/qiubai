//
//  User.swift
//  qiubai
//
//  Created by 马威 on 15/12/13.
//  Copyright © 2015年 vinylon. All rights reserved.
//

import Foundation
import SwiftyJSON

// 用户
class User{
    var id : Int! // 用户id
    var name : String! // 用户名称
    var icon : String! // 用户头像
    var device : String! // 用户设备类型
    var createdAt : Int! // 创建时间
    
    init(json : JSON){
        id = json["id"].intValue
        name = json["login"].stringValue
        icon = json["icon"].stringValue
        device = json["last_device"].stringValue
        createdAt = json["last_visited_at"].intValue
    }
}