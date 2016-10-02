//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation
import UIKit

class ConverterView: UIViewController, ConverterViewProtocol, UITextFieldDelegate, VENCalculatorInputViewDelegate
{
    var presenter: ConverterPresenterProtocol?
    @IBOutlet var mainTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configureView() {
        navigationItem.title = "Currency Converter"
    }

    func returnCellForIndexPath(indexPath : NSIndexPath) -> UITableViewCell {
        return self.mainTableView.cellForRowAtIndexPath(indexPath)! as UITableViewCell
    }
    
    func returnAmountField() -> UITextField {
        return self.returnCellForIndexPath(NSIndexPath.init(forRow: 0, inSection: 0)).viewWithTag(111) as! UITextField
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        let numberOfSections = 1
        return numberOfSections
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 130.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (self.mainTableView!.dequeueReusableCellWithIdentifier("cell\(indexPath.row)")! as UITableViewCell)
        
        self.configureCellForTableView(tableView, withCell: cell, withIndexPath: indexPath)
        return cell
    }
    
    func configureCellForTableView(tableView: UITableView, withCell cell: UITableViewCell, withIndexPath indexPath: NSIndexPath) {
        switch (indexPath.row) {
        case 0:
            let textField:VENCalculatorInputTextField = cell.viewWithTag(111) as! VENCalculatorInputTextField
            
            let inputView = VENCalculatorInputView()
            textField.inputView = inputView
            inputView.delegate = self
            
            break;
        case 1:
            let textField:UITextField = cell.viewWithTag(221) as! UITextField
            textField.delegate = self

            break;
        default:
            break;
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
    
    func calculatorInputView(inputView: VENCalculatorInputView!, didTapKey key: String!) {
        let textField = self.returnAmountField()
        textField.insertText(key)
    }
    
    func calculatorInputViewDidTapBackspace(calculatorInputView: VENCalculatorInputView!) {
        let textField = self.returnAmountField()
        textField.deleteBackward()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true;
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let filtered = string.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString:"0123456789.").invertedSet).joinWithSeparator("")
        if (string == filtered) {
            var txtAfterUpdate: NSString = textField.text! as NSString
            txtAfterUpdate = txtAfterUpdate.stringByReplacingCharactersInRange(range, withString: string)
            
            print("Double value #\(txtAfterUpdate.doubleValue)!")
            return true
        } else {
            return false
        }
    }
    */
}

