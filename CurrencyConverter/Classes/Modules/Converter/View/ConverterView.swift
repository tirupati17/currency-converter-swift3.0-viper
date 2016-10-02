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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configureView() {
        navigationItem.title = "Currency Converter"
    }

    func returnCellForIndexPath(_ indexPath : IndexPath) -> UITableViewCell {
        return self.mainTableView.cellForRow(at: indexPath)! as UITableViewCell
    }
    
    func returnAmountField() -> UITextField {
        return self.returnCellForIndexPath(IndexPath.init(row: 0, section: 0)).viewWithTag(111) as! UITextField
    }

    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int {
        let numberOfSections = 1
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (self.mainTableView!.dequeueReusableCell(withIdentifier: "cell\((indexPath as NSIndexPath).row)")! as UITableViewCell)
        
        self.configureCellForTableView(tableView, withCell: cell, withIndexPath: indexPath)
        return cell
    }
    
    func configureCellForTableView(_ tableView: UITableView, withCell cell: UITableViewCell, withIndexPath indexPath: IndexPath) {
        switch ((indexPath as NSIndexPath).row) {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        print("You selected cell #\((indexPath as NSIndexPath).row)!")
    }
    
    func calculatorInputView(_ inputView: VENCalculatorInputView!, didTapKey key: String!) {
        let textField = self.returnAmountField()
        textField.insertText(key)
    }
    
    func calculatorInputViewDidTapBackspace(_ calculatorInputView: VENCalculatorInputView!) {
        let textField = self.returnAmountField()
        textField.deleteBackward()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
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

