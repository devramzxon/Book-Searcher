//
//  BookVC.swift
//  Book Searcher
//
//  Created by Ramzxon Maxmudov on 28/04/21.
//

import UIKit
import SDWebImage
class BookVC: UIViewController {

    var book: Book?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var authorsLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
    }

    func viewSetup() {
        nameLbl.text = book?.name
        subtitleLbl.text = book?.subtitle
        authorsLbl.text = book?.authors
        indicator.startAnimating()
        imageView.sd_setImage(with: URL(string: book?.imageURL ?? "")) {(img, _, _, _) in
            if let _ = img {self.indicator.stopAnimating()}
        }
        descLbl.text = book?.desc
    }
}
