//
//  SearchRouter.swift
//  Book Searcher
//
//  Created by Ramzxon Maxmudov on 28/04/21.
//

import UIKit

typealias EntryPoint = SearchView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? {get}
    static func start() -> SearchRouter
    static func openBookVC(with book: Book) -> UIViewController
}

class SearchRouter: AnyRouter {
        
    var entry: EntryPoint?
    
    static func start() -> SearchRouter {
        
        let router = SearchRouter()
        var view: SearchView = SearchVC()
        var presenter: AnyPresenter = SearchPresenter()
        var interactor: AnyInteractor = SearchInteractor()

        view.presenter = presenter

        interactor.presenter = presenter
        presenter.rauter = router
        presenter.view = view
        presenter.inetractor = interactor
        router.entry = view as? EntryPoint
        return router
    }
    
    static func openBookVC(with book: Book) -> UIViewController {
        let vc = BookVC(nibName: "BookVC", bundle: nil)
        return vc
    }
}
