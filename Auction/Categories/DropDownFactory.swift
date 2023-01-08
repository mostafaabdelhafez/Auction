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
        dropDown.placeHolder.text = placeholder
        dropDown.textField.didSelect { selectedText, index, id in
            completion(model[index])
        }
        stack.addArrangedSubview(dropDown)
                
    }
}
