//
//  DropDownFactory.swift
//  Auction
//
//  Created by jobzella on 08/01/2023.
//

import Foundation
import iOSDropDown
class DropDownGenerator{
    static func create(dropDown:TitledTextField,with placeholder:String,with source:[String],from model:[DropDownModel], on stack:UIStackView,completion:@escaping(_ child:DropDownModel?)->Void){
        dropDown.height(constant: 60)
        dropDown.textField.optionArray = source
        dropDown.placeHolder = placeholder
        dropDown.textField.didSelect { selectedText, index, id in
            
            if selectedText == "other"{
                stack.addArrangedSubview(DropDownGenerator.createOtherTextField())
            }
            completion(model[index])
            
        }
        stack.addArrangedSubview(dropDown)
        dropDown.textField.listWillAppear {
            for _ in (0...stack.arrangedSubviews.count - 1).reversed(){
                if let lastView = stack.arrangedSubviews.last{
                    if lastView != dropDown{
                        lastView.removeFromSuperview()
                    }
                    else{
                        break
                    }
                }
            }
        }
    }
    static func createOtherTextField()->OtherTextField{
        let tf = OtherTextField()
        tf.height(constant: 60)
        return tf
    }
}
