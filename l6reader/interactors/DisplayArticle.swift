//
//  DisplayArticle.swift
//  l6reader
//
//  Created by woi on 3/7/17.
//  Copyright © 2017 woi. All rights reserved.
//

import Foundation
import RxSwift

protocol DisplayArticle {
    func display() -> Observable<[Article]>;
}

class DisplayArticleImpl : DisplayArticle {
    
    init(l6Service: L6Service) {
        self.l6Service = l6Service
    }
    
    func display() -> Observable<[Article]> {
        return l6Service.getArticles()
    }
    
    private var l6Service: L6Service
}
