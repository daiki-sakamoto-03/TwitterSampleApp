//
//  EditorViewControllerTests.swift
//  TwitterSampleAppTests
//
//  Created by 坂本　大貴 on 2022/12/28.
//

import XCTest
@testable import TwitterSampleApp

class EditorViewControllerTests: XCTestCase {
    


    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    
    // 今回はこのメソッドを使用
    func testtrueTextLimit() throws {
        let evc = EditorViewController()
        let number = evc.checkTweetTextCount(count: 140)
        XCTAssertTrue(number)
    }
    
    
    
    func testPerformanceExample() throws {
        self.measure {}
    }

}
