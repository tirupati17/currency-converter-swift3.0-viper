//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation
import UIKit

protocol ConverterViewProtocol: class
{
    var presenter: ConverterPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    func reloadTableViewWithData(_ converterItems: [ConverterItem])
    func initWithBaseAndReload(currencyName: String, country: String, code: String, symbol: String, amount: String)
    func noContentFromServer()
}

protocol ConverterWireFrameProtocol: class
{
    func presentConverterModule(fromView window: AnyObject)
    func showCurrencyListViewController()
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol ConverterPresenterProtocol: class
{
    var view: ConverterViewProtocol? { get set }
    var interactor: ConverterInteractorInputProtocol? { get set }
    var wireFrame: ConverterWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    func getCurrencyListWithData(_ baseConverterItem: ConverterItem)
    func showCurrencyListView()
    func loadView()
}

protocol ConverterInteractorOutputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    func initWithBaseConverterItem(_ converterItem: ConverterItem)
    func fetchedConvertedCurrency(_ convertedCurrency:[ConverterItem])
}

protocol ConverterInteractorInputProtocol: class
{
    var presenter: ConverterInteractorOutputProtocol? { get set }
    var APIDataManager: ConverterAPIDataManagerInputProtocol? { get set }
    var localDatamanager: ConverterLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func getCurrencyWithData(_ baseConverterItem: ConverterItem)
    func initWithBaseCurrencyAndLoad()
}

protocol ConverterDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol ConverterAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
    func fetchCurrencyFromServerWithData(_ baseCurrencyCode: String, completion: ((AnyObject) -> Void)!, failed:((AnyObject) -> Void)!)
}

protocol ConverterLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
