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
    func testtextFieldDidChangeSelection() throws {
        let evc = EditorViewController()
        let tweet = evc.inputTweetTextField.text!.count
        XCTAssertTrue(tweet > evc.maxTweetLength)
        
    }

    
    
    
    func testPerformanceExample() throws {
        self.measure {}
    }

}
