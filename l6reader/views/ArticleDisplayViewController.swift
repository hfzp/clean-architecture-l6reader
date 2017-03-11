//
//  ArticleDisplayViewController.swift
//  l6reader
//
//  Created by Hafiz Pariabi on 3/11/17.
//  Copyright © 2017 Hafiz Pariabi. All rights reserved.
//

import UIKit

class ArticleDisplayViewController: UIViewController {

	var article: Article?
	
	@IBOutlet weak var contentTextView: UITextView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		article.map { load(article: $0) }
    }

	private func load(article: Article)
	{
		self.title = article.title;
		self.contentTextView.text = article.content;
	}
}
