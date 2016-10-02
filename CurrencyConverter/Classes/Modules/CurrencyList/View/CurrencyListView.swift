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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configureView() {
        navigationItem.title = "Currency List"
    }
    
    func reloadTableViewWithCurrencyList(currencyList : [CurrencyListItem]) {
        self.listArray = currencyList
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        let numberOfSections = 1
        return numberOfSections
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (self.listTableView!.dequeueReusableCellWithIdentifier("cell\(indexPath.row)")! as UITableViewCell)
        
        self.configureCellForTableView(tableView, withCell: cell, withIndexPath: indexPath)
        return cell
    }
    
    func configureCellForTableView(tableView: UITableView, withCell cell: UITableViewCell, withIndexPath indexPath: NSIndexPath) {
        let currencyListItem = self.listArray[indexPath.row] 
        print("currencyListItem  #\(currencyListItem)!")

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let currencyListItem = self.listArray[indexPath.row]
        print("currencyListItem  #\(currencyListItem)!")
    }

}