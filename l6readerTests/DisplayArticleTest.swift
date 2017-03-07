//
//  DisplayArticleTest.swift
//  l6reader
//
//  Created by woi on 3/7/17.
//  Copyright © 2017 woi. All rights reserved.
//

import XCTest
@testable import l6reader

class DisplayArticleTest: XCTestCase {
    
    func testDisplay() {
        let displayArticle = DisplayArticleImpl()
        let articles = displayArticle.display()
        XCTAssertGreaterThan(articles.count, 0)
    }
}
