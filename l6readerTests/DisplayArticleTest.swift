//
//  DisplayArticleTest.swift
//  l6reader
//
//  Created by woi on 3/7/17.
//  Copyright © 2017 woi. All rights reserved.
//

import XCTest
@testable import l6reader

class L6ServiceMock : L6ServiceBaseMock {
    override func getArticles() -> [Article] {
        return [Article()]
    }
}

class DisplayArticleTest: XCTestCase {
    
    func testDisplay() {
        let l6Service = L6ServiceMock()
        let displayArticle = DisplayArticleImpl(l6Service: l6Service)
        let articles = displayArticle.display()
        XCTAssertGreaterThan(articles.count, 0)
    }
}
