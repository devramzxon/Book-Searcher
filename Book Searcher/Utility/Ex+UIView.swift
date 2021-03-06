//
//  Ex+UIView.swift
//  Book Searcher
//
//  Created by Ramzxon Maxmudov on 28/04/21.
//

import UIKit

extension UIView {
    func addShadow(shadowColor: UIColor, offSet: CGSize, opacity: Float, shadowRadius: CGFloat, cornerRadius: CGFloat, corners: UIRectCorner, fillColor: UIColor = .white, frame: CGRect) {
        let shadowLayer = CAShapeLayer()
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let cgPath = UIBezierPath(roundedRect: frame, byRoundingCorners: corners, cornerRadii: size).cgPath //1
        shadowLayer.path = cgPath //2
        shadowLayer.fillColor =  fillColor.cgColor //3
        shadowLayer.shadowColor = shadowColor.cgColor //4
        shadowLayer.shadowPath = cgPath
        shadowLayer.shadowOffset = offSet //5
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowRadius = shadowRadius
        self.layer.insertSublayer(shadowLayer, at: 0)
    }
}
