//
//  l6readerUITests.swift
//  l6readerUITests
//
//  Created by Hafiz Pariabi on 3/13/17.
//  Copyright © 2017 Hafiz Pariabi. All rights reserved.
//

import XCTest

class l6readerUITests: XCTestCase {
   
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testDisplayArticlesAndOpenOne() {
        let articleList = app.tables.element(boundBy: 0)
        XCTAssertNotNil(articleList)
        
        let firstArticle = articleList.cells.element(boundBy: 0)
        firstArticle.tap()
        
        let contentView = app.textViews.element(boundBy: 0)
        XCTAssertTrue(contentView.isHittable)
    }
    
}
