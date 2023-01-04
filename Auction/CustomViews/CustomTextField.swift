//
//  CustomTextField.swift
//  Auction
//
//  Created by jobzella on 04/01/2023.
//

import Foundation
import UIKit
class TitledTextField:UIView{
    let container:UIView = {
        let v = UIView()
        v.roundedView(radius: 10)
        v.layer.borderWidth = 1
        v.layer.borderColor = #colorLiteral(red: 0.8265652657, green: 0.8315371871, blue: 0.8314493299, alpha: 1)
        return v
    }()
    let placeHolder:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.3960784376, green: 0.396078378, blue: 0.3960784376, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Category"
        label.backgroundColor = .white
        label.textAlignment = .center

        return label
    }()
    let arrow:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    let categoryName:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        addSubview(container)
        container.pinEdgesToSuperviewBounds()
        addSubview(placeHolder)
        placeHolder.Anchor(Top: nil, Left: container.leftAnchor, Bottom: nil, Right: nil, TopPadding: 0, LeftPadding: 24, BottomPadding: 0, RightPadding: 0, Width: 100, Height: 0)
        placeHolder.centerYAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
    }
}
