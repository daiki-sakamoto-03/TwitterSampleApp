//
//  TweetRecord.swift
//  TwitterSampleApp
//
//  Created by 坂本　大貴 on 2022/12/12.
//

import Foundation
import RealmSwift

class TweetRecord: NSObject {
    var userName: String
    var tweetText: String
    
    init(userName: String, tweetText: String) {
        self.userName = userName as String
        self.tweetText = tweetText as String
    }
}
