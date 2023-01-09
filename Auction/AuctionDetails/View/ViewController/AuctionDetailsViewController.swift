//
//  AuctionDetailsViewController.swift
//  Auction
//
//  Created by jobzella on 09/01/2023.
//

import UIKit

class AuctionDetailsViewController: UIViewController {
    let header:AuctionDetailsHeader = UIView.fromNib()

    @IBOutlet weak var tableview:UITableView!{
        didSet{
            header.height(constant: 650)
            header.width(constant: UIScreen.main.bounds.width)
            tableview.tableHeaderView = header
            tableview.delegate = self
            tableview.dataSource = self
            let cellNib = UINib(nibName: "AuctionDetailsTableViewCell", bundle: nil)
            tableview.register(cellNib.self, forCellReuseIdentifier: "AuctionDetailsTableViewCell")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
extension AuctionDetailsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AuctionDetailsTableViewCell", for: indexPath) as? AuctionDetailsTableViewCell
        else{
            return UITableViewCell()
        }
            return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    
    
}
