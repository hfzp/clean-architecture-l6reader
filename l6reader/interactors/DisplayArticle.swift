//
//  DisplayArticle.swift
//  l6reader
//
//  Created by woi on 3/7/17.
//  Copyright © 2017 woi. All rights reserved.
//

import Foundation

protocol DisplayArticle {
    func display() -> [Article];
}

class DisplayArticleImpl : DisplayArticle {
    
    init(l6Service: L6Service) {
        self.l6Service = l6Service
    }
    
    func display() -> [Article] {
        return [Article()]
    }
    
    private var l6Service: L6Service
}
