import Foundation
import RxSwift
import EVReflection
import Alamofire

class RssResponse : EVNetworkingObject {
	var channel: [ChannelResponse] = []
}

class ChannelResponse: EVNetworkingObject {
    var title: String?
	var item = [ArticleResponse]()
}

class ArticleResponse: EVNetworkingObject {
    var title: String?
	var _description: String?
}

enum L6FeedServiceError : Error {
	case fetchDataError
}

class L6FeedService : L6Service {
	private let subject = PublishSubject<[Article]>()

	func getArticles() -> Observable<[Article]> {
	
		let l6FeedUrl = "http://www.liputan6.com/rss"
		
		Alamofire.request(l6FeedUrl)
			.responseObjectFromXML {
				[weak self] (response: DataResponse<RssResponse>) in
				if let articlesResponse =
					response.result.value?.channel[0].item
				{
					let articles = articlesResponse
						.map { response in
							Article(
								title: response.title ?? "",
								content: response._description ?? "")
						}
					self?.subject.onNext(articles)
				}
				else {
					self?.subject.onError(L6FeedServiceError.fetchDataError)
				}
		}
	
		return subject
	}
}
