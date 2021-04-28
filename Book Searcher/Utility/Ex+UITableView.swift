//
//  Ex+UITableView.swift
//  Book Searcher
//
//  Created by Ramzxon Maxmudov on 28/04/21.
//

import UIKit
import Lottie

extension UITableView {
    func setEmptyBgView() {
        let v = UIView(frame: self.frame)
        v.backgroundColor = .clear
        
        let animateView = AnimationView()
        animateView.animation = Animation.named("no-data-error")
        animateView.animationSpeed = 1.0
        animateView.loopMode = .loop
        animateView.play()
        v.addSubview(animateView)
        animateView.edgesToSuperview(insets: .bottom(60))
        self.backgroundView = v
        v.center = self.center
    }
}
