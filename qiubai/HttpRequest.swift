//
//  HttpRequest.swift
//  qiushibaike
//
//  Created by lingdd on 15/10/21.
//  Copyright © 2015年 lingdd. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HttpRequest {
    
    // 获得热门糗事
    class func getHotJokeForPage(page: Int, completionHandler: [Joke] -> Void) {
        Alamofire.request(.GET, HotJokeURL + "\(page)")
            .responseJSON { response in
                
                var jokes = [Joke]()

                if let value = response.result.value {
                    
                    let json = JSON(value)
                    jokes = HttpRequest.anyObjectToJokes(json)
                }
                
                completionHandler(jokes)
        }
    }
    
    // 获得最新糗事
    class func getLatestJokeForPage(page: Int, completionHandler: [Joke] -> Void) {
        Alamofire.request(.GET, LatestJokeURL + "\(page)")
            .responseJSON { response in
                
                var jokes = [Joke]()
                
                if let value = response.result.value {
                    
                    let json = JSON(value)
                    jokes = HttpRequest.anyObjectToJokes(json)
                }
                
                completionHandler(jokes)
        }
    }
    
    // 获得真相糗事
    class func getImgRankJokeForPage(page: Int, completionHandler: [Joke] -> Void) {
        Alamofire.request(.GET, ImgRankJokeURL + "\(page)")
            .responseJSON { response in
                
                var jokes = [Joke]()
                
                if let value = response.result.value {
                    
                    let json = JSON(value)
                    jokes = HttpRequest.anyObjectToJokes(json)
                }
                
                completionHandler(jokes)
        }
    }
    
    // 获取评论
    class func getCommentByJokeIDAndForPage(jokeID: Int, page: Int, completionHandler: [Comment] -> Void) {
        Alamofire.request(.GET, CommentURLPrefix + "\(jokeID)" + CommentURLSuffix + "\(page)")
            .responseJSON() { response in
                
                var comments = [Comment]()
                
                if let value = response.result.value {
                    
                    let value = JSON(value)
                    let items = value["items"]
                    
                    if let itemArr = items.array {
                        for item in itemArr {
                            let user = User(json: item["user"])
                            let content = CommentContent(json: item)
                            
                            comments.append(Comment(user: user, content: content))
                        }
                    }

                }
                
                completionHandler(comments)
        }
    }
    
    // 帮助函数
    class func anyObjectToJokes(value: JSON) -> [Joke] {
        
        var jokes = [Joke]()
        let items = value["items"]
        
        if let itemArr = items.array {
            for item in itemArr {
                let votes = Votes(json: item["votes"])
                let content = JokeContent(json: item)
                let user = User(json: item["user"])
                
                jokes.append(Joke(votes: votes, content: content, user: user))
            }
        }
        
        return jokes
    }
}