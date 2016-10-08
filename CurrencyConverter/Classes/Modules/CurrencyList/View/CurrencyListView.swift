//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation
import UIKit

class CurrencyListView: UIViewController, CurrencyListViewProtocol, UITextFieldDelegate
{
    var presenter: CurrencyListPresenterProtocol?
    @IBOutlet var listTableView : UITableView!
    var listArray = [CurrencyListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.updateView()
    }
    
    func configureView() {
        navigationItem.title = "Currency List"
    }
    
    func reloadTableViewWithCurrencyList(_ currencyList : [CurrencyListItem]) {
        self.listArray = currencyList
        self.listTableView.reloadData()
    }
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int {
        let numberOfSections = 1
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (self.listTableView!.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell)
        
        self.configureCellForTableView(tableView, withCell: cell, withIndexPath: indexPath)
        return cell
    }
    
    func configureCellForTableView(_ tableView: UITableView, withCell cell: UITableViewCell, withIndexPath indexPath: IndexPath) {
        if let currencyListItem = self.listArray[safe: (indexPath as NSIndexPath).row] {
            let codeLabel:UILabel = cell.viewWithTag(113) as! UILabel
            let imageView:UIImageView = cell.viewWithTag(111) as! UIImageView
            let symbolLabel:UILabel = cell.viewWithTag(114) as! UILabel
            let currencyNameLabel:UILabel = cell.viewWithTag(112) as! UILabel
            
            codeLabel.text = currencyListItem.code
            symbolLabel.text = currencyListItem.symbol
            currencyNameLabel.text = currencyListItem.currencyName
            imageView.image = UIImage.init(named: "\(currencyListItem.country).png")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        if let currencyListItem = self.listArray[safe: (indexPath as NSIndexPath).row] {
            self.presenter?.selectCurrencyListItem(currencyListItem)
        }
    }

}
