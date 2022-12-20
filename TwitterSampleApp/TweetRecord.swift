//
//  TweetRecord.swift
//  TwitterSampleApp
//
//  Created by 坂本　大貴 on 2022/12/12.
//

import Foundation
import RealmSwift

class TweetRecord: Object {
    override static func primaryKey() -> String? {
        return "id"
    }
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var userName = ""
    @objc dynamic var tweetText = ""

    
}
