//
//  AuctionDetailsHeader.swift
//  Auction
//
//  Created by jobzella on 09/01/2023.
//

import UIKit
import Cosmos
class AuctionDetailsHeader: UIView {
    lazy var cosmosView:CosmosView = {
        let view  = CosmosView()
        view.settings.filledImage = #imageLiteral(resourceName: "start")
        view.settings.emptyImage = #imageLiteral(resourceName: "stardark")
        view.settings.totalStars = 5
        view.settings.updateOnTouch = false
        view.rating = 4
        return view
    }()
    @IBOutlet weak var gradientView:UIView!{
        didSet{
            let gradient: CAGradientLayer = CAGradientLayer()

            gradient.colors = [UIColor.white.cgColor, #colorLiteral(red: 0.9976976514, green: 0.8943514228, blue: 0.9307848811, alpha: 1).cgColor]
            gradient.locations = [0.0 , 1.0]
            gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
            gradient.frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 80)

            self.gradientView.layer.insertSublayer(gradient, at: 0)
        }
    }

    @IBOutlet weak var starsContainer:UIView!{
        didSet{
            starsContainer.addSubview(cosmosView)
            cosmosView.pinEdgesToSuperviewBounds()

        }
    }

    @IBOutlet weak var dateContainer:UIView!{
        didSet{
            dateContainer.layer.masksToBounds = false
            dateContainer.layer.shadowColor = UIColor.black.cgColor
            dateContainer.layer.shadowOffset = CGSize(width: 0, height: 0)
            dateContainer.layer.shadowOpacity = 0.2
            dateContainer.layer.shadowRadius = 4.0

        }
    }

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
