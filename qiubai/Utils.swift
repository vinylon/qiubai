//
//  Utils.swift
//  qiushibaike
//
//  Created by lingdd on 15/10/21.
//  Copyright © 2015年 lingdd. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
    class func formatData(date: Int) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.stringFromDate(NSDate(timeIntervalSince1970: NSTimeInterval(Double(date))))
    }
    
    class func getAvatarURL(id: Int, icon: String) -> NSURL {
        let idString = "\(id)" as NSString
        var prefix: NSString
        if idString.length > 4 {
            prefix = idString.substringToIndex(idString.length - 4)
        } else {
            prefix = idString
        }
        return NSURL(string: avatarURL + "\(prefix)/\(id)/medium/" + icon)!
    }
    
    class func getImageURL(id: Int, image: String, type: String) -> NSURL {
        let idString = "\(id)" as NSString
        var prefix: NSString
        if idString.length > 4 {
            prefix = idString.substringToIndex(idString.length - 4)
        } else {
            prefix = idString
        }
        return NSURL(string: imageURL + "\(prefix)/\(id)/\(type)/" + image)!
    }
}



extension String {
    var length: Int {
        return self.characters.count
    }
}