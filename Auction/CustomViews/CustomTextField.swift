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
   class func reset(tf:TitledTextField){
        tf.placeHolder = nil
        tf.textField.optionArray.removeAll()
       tf.textField.text = nil
       tf.isHidden = true
    }
    var placeHolder:String?{
        didSet{
            placeHolderLabel.text = placeHolder ?? ""
            
        }
    }

    let textField = DropDown()

//    let dropDown = DropDown()
    let container:UIView = {
        let v = UIView()
        v.roundedView(radius: 10)
        v.layer.borderWidth = 1
        v.layer.borderColor = #colorLiteral(red: 0.8265652657, green: 0.8315371871, blue: 0.8314493299, alpha: 1)
        return v
    }()
    let placeHolderLabel:UILabelPadding = {
        let label = UILabelPadding()
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
        addSubview(container)
        container.pinEdgesToSuperviewBounds()
        container.addSubview(textField)
        textField.Anchor(Top: container.topAnchor, Left: container.leftAnchor, Bottom: container.bottomAnchor, Right: container.rightAnchor, TopPadding: 0, LeftPadding: 8, BottomPadding: 0, RightPadding: -24, Width: 0, Height: 0)

        addSubview(placeHolderLabel)
        placeHolderLabel.Anchor(Top: nil, Left: container.leftAnchor, Bottom: nil, Right: nil, TopPadding: 0, LeftPadding: 24, BottomPadding: 0, RightPadding: 0, Width: 0, Height: 0)
        placeHolderLabel.centerYAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
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

        addSubview(placeHolderLabel)
        placeHolderLabel.Anchor(Top: nil, Left: container.leftAnchor, Bottom: nil, Right: nil, TopPadding: 0, LeftPadding: 24, BottomPadding: 0, RightPadding: 0, Width: 0, Height: 0)
        
        placeHolderLabel.centerYAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
        textField.selectedRowColor = .clear
        textField.checkMarkEnabled = false
    }
}

class UILabelPadding: UILabel {

    let padding = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize : CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let heigth = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }



}
class OtherTextField:UITextField{
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.placeholder = "Specify here"
        self.borderStyle = .roundedRect
        
}
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.placeholder = "Specify here"
        self.borderStyle = .roundedRect

    }

}
