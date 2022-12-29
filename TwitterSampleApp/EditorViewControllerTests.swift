//
//  EditorViewControllerTests.swift
//  TwitterSampleAppTests
//
//  Created by 坂本　大貴 on 2022/12/28.
//

import XCTest
@testable import TwitterSampleApp

class EditorViewControllerTests: XCTestCase {
    
    let evc = EditorViewController()

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    
    // 今回はこのメソッドを使用
    func testtextFieldDidChangeSelection() throws {
        let tweet = (evc.inputTweetTextField.text?.count)!
        XCTAssertTrue(tweet > 140)
    }

    
    
    
    func testPerformanceExample() throws {
        self.measure {}
    }

}
