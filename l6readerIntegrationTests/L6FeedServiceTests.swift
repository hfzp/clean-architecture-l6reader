//
//  l6readerIntegrationTests.swift
//  l6readerIntegrationTests
//
//  Created by Hafiz Pariabi on 3/11/17.
//  Copyright © 2017 woi. All rights reserved.
//

import XCTest
import RxSwift
import RxBlocking
import RxTest
@testable import l6reader

class L6FeedServiceTests: XCTestCase {
    
    func testGetArticles() {
		let l6FeedService = L6FeedService()
		let articles = try! l6FeedService.getArticles().toBlocking().first()!
		XCTAssertFalse(articles.isEmpty)
		XCTAssertFalse((articles.first?.title.isEmpty)!)
		XCTAssertFalse((articles.first?.content.isEmpty)!)
    }
}
