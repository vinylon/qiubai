//
//  Joke.swift
//  qiubai
//
//  Created by 马威 on 15/12/13.
//  Copyright © 2015年 vinylon. All rights reserved.
//

import Foundation
import SwiftyJSON

// 糗事类
class Joke{
    var votes : Votes! // 投票
    var content : JokeContent!  // 糗事内容
    var user : User! // 发布糗事用户
    init(votes : Votes,content : JokeContent,user : User){
        self.votes = votes
        self.content = content
        self.user = user
    }
}
