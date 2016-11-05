//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation
import UIKit
import Mixpanel

class CurrencyListView: UIViewController, CurrencyListViewProtocol, UITextFieldDelegate, UISearchBarDelegate
{
    var presenter: CurrencyListPresenterProtocol?
    var listArray = [CurrencyListItem]()
    var searchedListArray = [CurrencyListItem]()
    var isSearch = Bool()
    @IBOutlet var listTableView : UITableView!

    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)!
    }

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
    
    @IBAction func cancelAction(sender : UIButton) {
        self.dismiss(animated: true) { 
            
        };
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
        if isSearch {
            return self.searchedListArray.count
        } else {
            return self.listArray.count
        }
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
        var currencyListItems = [CurrencyListItem]()
        if isSearch {
            currencyListItems = self.searchedListArray
        } else {
            currencyListItems = self.listArray
        }
        if let currencyListItem = currencyListItems[safe: (indexPath as NSIndexPath).row] {
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
        var currencyListItems = [CurrencyListItem]()
        if isSearch {
            currencyListItems = self.searchedListArray
        } else {
            currencyListItems = self.listArray
        }
        if let currencyListItem = currencyListItems[safe: (indexPath as NSIndexPath).row] {
            Mixpanel.mainInstance().track(event: "CurrencyListSelection",
                                          properties: ["Code" : currencyListItem.code, "CurrencyName" : currencyListItem.currencyName])
            self.presenter?.selectCurrencyListItem(currencyListItem)
        }
    }

    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.isSearch = true
        self.searchedListArray = self.listArray.filter({ (currencyListItem) -> Bool in
            if searchText.isEmpty {
                return true
            } else {
                return (currencyListItem.country.lowercased().contains(searchText.lowercased())) || (currencyListItem.code.lowercased().contains(searchText.lowercased())) || (currencyListItem.currencyName.lowercased().contains(searchText.lowercased()))
            }
        })
        self.listTableView.reloadData()
    }

    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.isSearch = false
        self.listTableView.reloadData()
        searchBar.resignFirstResponder()
    }

}
