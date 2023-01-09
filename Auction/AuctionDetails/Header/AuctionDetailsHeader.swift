//
//  AuctionDetailsHeader.swift
//  Auction
//
//  Created by jobzella on 09/01/2023.
//

import UIKit

class AuctionDetailsHeader: UIView {
    @IBOutlet weak var detailsArrow:UIImageView!{
        didSet{
            
            detailsArrow.markSelectedWith(color: #colorLiteral(red: 0.9008410573, green: 0, blue: 0.3175038099, alpha: 1))
        }
    }
    @IBOutlet weak var reviewArrow:UIImageView!{
        didSet{
            
            reviewArrow.markSelectedWith(color: #colorLiteral(red: 0.9008410573, green: 0, blue: 0.3175038099, alpha: 1))
        }
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
