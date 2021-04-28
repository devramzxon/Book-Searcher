//
//  SearchPresenter.swift
//  Book Searcher
//
//  Created by Ramzxon Maxmudov on 28/04/21.
//

import Foundation

protocol AnyPresenter {
    var rauter: AnyRouter? { get set }
    var inetractor: AnyInteractor? { get set }
    var view: SearchView? { get set }
    func intetactorDidFetchUsers(with result: [Book])
}


class SearchPresenter: AnyPresenter {
    
    var inetractor: AnyInteractor?
    var view: SearchView?
    var rauter: AnyRouter?

    func intetactorDidFetchUsers(with result: [Book]) {
        view?.update(with: result)
    
    }
    
}
