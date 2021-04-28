//
//  SearchTVC.swift
//  Book Searcher
//
//  Created by Ramzxon Maxmudov on 28/04/21.
//

import UIKit
import SDWebImage

class SearchTVC: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var authorsLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.addShadow(shadowColor: .black, offSet: CGSize(width: 2, height: 2), opacity: 0.4, shadowRadius: 5, cornerRadius: 5, corners: .allCorners, frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-32, height: 100))
    }
    
    func updateCell(book: Book) {
        nameLbl.text = book.name
        subtitleLbl.text = book.subtitle
        authorsLbl.text = book.authors
        indicator.startAnimating()
        imgView.sd_setImage(with: URL(string: book.imageURL)) {(img, _, _, _) in
            if let _ = img {self.indicator.stopAnimating()}
        }
        

    }
}
