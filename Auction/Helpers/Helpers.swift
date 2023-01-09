//
//  Helpers.swift
//  Auction
//
//  Created by jobzella on 08/01/2023.
//

import Foundation
import UIKit
class StackViewHelper{
   class func removeStackArrangedViewsFrom(stack:UIStackView,except childView:UIView){


        for _ in (0...stack.arrangedSubviews.count - 1).reversed(){
            
                if let lastView = stack.arrangedSubviews.last{
                if lastView != childView{
                    lastView.removeFromSuperview()
                }
                else{
                    
                }
            }
        }
    }

}
