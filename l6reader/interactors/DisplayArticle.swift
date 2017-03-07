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
    func display() -> [Article] {
        return [Article()]
    }
}
