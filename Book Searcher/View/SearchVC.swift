//
//  SearchVC.swift
//  Book Searcher
//
//  Created by Ramzxon Maxmudov on 28/04/21.
//

import UIKit
import TinyConstraints

protocol SearchView {
    var presenter: AnyPresenter? {get set}
    func update(with books: [Book])
    
}

class SearchVC: UIViewController, SearchView {
    
    var presenter: AnyPresenter?


    private let tableView : UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        table.register(UINib(nibName: "SearchTVC", bundle: nil), forCellReuseIdentifier: "SearchTVC")
        return table
    }()
    
    private let searchController = UISearchController(searchResultsController: nil)

    var books = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
    }
    
    private func viewSetup() {
        title = "Search"
        addSearchBar()
        self.view.backgroundColor = .white
        
        self.view.addSubview(tableView)
        tableView.edgesToSuperview()
        tableView.delegate = self
        tableView.dataSource = self
    }
    private func addSearchBar() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
    }
    
    func update(with books: [Book]) {
        self.books = books
        if books.isEmpty {
            tableView.setEmptyBgView()
        } else {
            tableView.backgroundView = nil
        }
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }

}
//MARK: - Search Bar -
extension SearchVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            if text.count > 0 {
                presenter?.inetractor?.getBook(for: text)
            } else {
                Alert.showAlert(forState: .warning, message: "Enter the word")
            }
        } else {
            Alert.showAlert(forState: .warning, message: "Enter the word")
        }
    }
}

//MARK: - Table View -
extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTVC", for: indexPath) as? SearchTVC else {return UITableViewCell()}
        cell.updateCell(book: books[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        116
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = BookVC(nibName: "BookVC", bundle: nil)
        vc.book = books[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
