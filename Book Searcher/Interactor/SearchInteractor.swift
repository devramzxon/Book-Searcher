//
//  SearchInteractor.swift
//  Book Searcher
//
//  Created by Ramzxon Maxmudov on 28/04/21.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? {get set}
    func getBook(for key: String)
}

class SearchInteractor: AnyInteractor {
    
    var presenter: AnyPresenter?
    
    func getBook(for key: String) {
        Net.req(urlAPI: "https://www.googleapis.com/books/v1/volumes", method: .get, params: ["q" : key]) { data in
            if let data = data {
                print(data)
                var users = [Book]()
                for i in data["items"].arrayValue {
                    users.append(Book(name: i["volumeInfo"]["title"].stringValue.html2String,
                                      imageURL: i["volumeInfo"]["imageLinks"]["smallThumbnail"].stringValue.html2String,
                                      desc: i["searchInfo"]["textSnippet"].stringValue.html2String,
                                      subtitle: i["volumeInfo"]["subtitle"].stringValue.html2String,
                                      authors: i["volumeInfo"]["authors"][0].stringValue.html2String,
                                      category: i["volumeInfo"]["categories"][0].stringValue.html2String))
                }
                self.presenter?.intetactorDidFetchUsers(with: users)
            }
        }
    }
}
