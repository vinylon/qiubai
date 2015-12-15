//
//  Votes.swift
//  qiubai
//
//  Created by 马威 on 15/12/13.
//  Copyright © 2015年 vinylon. All rights reserved.
//

import Foundation
import SwiftyJSON

// 投票
class Votes{
    var down : Int! // 踩
    var up : Int! // 顶
    init(json : JSON){
        down = -json["down"].intValue
        up = json["up"].intValue
    }
}