//
//  CustomTextField.swift
//  Auction
//
//  Created by jobzella on 04/01/2023.
//

import Foundation
import UIKit
import SearchTextField
//import DropDown
import iOSDropDown
class TitledTextField:UIView{
    let textField = DropDown()

//    let dropDown = DropDown()
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
        label.backgroundColor = .white
        label.textAlignment = .center

        return label
    }()
    let arrow:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "bottomarrow")
        return image
    }()
    let categoryName:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    @objc func searchDidTapped(){
//        textField.showList()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        textField.textAlignment = .left
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(searchDidTapped))
//        textField.addGestureRecognizer(gesture)
        addSubview(container)
        container.pinEdgesToSuperviewBounds()
        container.addSubview(textField)
        textField.Anchor(Top: container.topAnchor, Left: container.leftAnchor, Bottom: container.bottomAnchor, Right: container.rightAnchor, TopPadding: 0, LeftPadding: 8, BottomPadding: 0, RightPadding: -24, Width: 0, Height: 0)

        addSubview(placeHolder)
        placeHolder.Anchor(Top: nil, Left: container.leftAnchor, Bottom: nil, Right: nil, TopPadding: 0, LeftPadding: 24, BottomPadding: 0, RightPadding: 0, Width: 100, Height: 0)
        placeHolder.centerYAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
        textField.selectedRowColor = .clear
        textField.checkMarkEnabled = false

    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        textField.textAlignment = .left
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(searchDidTapped))
//        textField.addGestureRecognizer(gesture)
        addSubview(container)
        container.pinEdgesToSuperviewBounds()
        container.addSubview(textField)
        textField.Anchor(Top: container.topAnchor, Left: container.leftAnchor, Bottom: container.bottomAnchor, Right: container.rightAnchor, TopPadding: 0, LeftPadding: 8, BottomPadding: 0, RightPadding: -24, Width: 0, Height: 0)

        addSubview(placeHolder)
        placeHolder.Anchor(Top: nil, Left: container.leftAnchor, Bottom: nil, Right: nil, TopPadding: 0, LeftPadding: 24, BottomPadding: 0, RightPadding: 0, Width: 100, Height: 0)
        placeHolder.centerYAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
        textField.selectedRowColor = .clear
        textField.checkMarkEnabled = false
    }
}
