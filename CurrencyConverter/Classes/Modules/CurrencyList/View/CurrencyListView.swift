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
    }
    
    func configureView() {
        navigationItem.title = "Currency List"
    }
    
    func reloadTableViewWithCurrencyList(_ currencyList : [CurrencyListItem]) {
        self.listArray = currencyList
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
        let cell:UITableViewCell = (self.listTableView!.dequeueReusableCell(withIdentifier: "cell\((indexPath as NSIndexPath).row)")! as UITableViewCell)
        
        self.configureCellForTableView(tableView, withCell: cell, withIndexPath: indexPath)
        return cell
    }
    
    func configureCellForTableView(_ tableView: UITableView, withCell cell: UITableViewCell, withIndexPath indexPath: IndexPath) {
        let currencyListItem = self.listArray[(indexPath as NSIndexPath).row] 
        print("currencyListItem  #\(currencyListItem)!")

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        let currencyListItem = self.listArray[(indexPath as NSIndexPath).row]
        print("currencyListItem  #\(currencyListItem)!")
    }

}
