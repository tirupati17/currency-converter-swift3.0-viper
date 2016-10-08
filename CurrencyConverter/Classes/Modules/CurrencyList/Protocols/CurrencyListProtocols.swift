//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation
import UIKit

protocol CurrencyListViewProtocol: class
{
    var presenter: CurrencyListPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    func reloadTableViewWithCurrencyList(_ currencyList : [CurrencyListItem])
}

protocol CurrencyListWireFrameProtocol: class
{
    func presentCurrencyListModule(fromView view: UIViewController)
    func dismissCurrencyListWithSelectedData(_ converterItem : CurrencyListItem)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol CurrencyListPresenterProtocol: class
{
    var view: CurrencyListViewProtocol? { get set }
    var interactor: CurrencyListInteractorInputProtocol? { get set }
    var wireFrame: CurrencyListWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    func selectCurrencyListItem(_ currencyListItem : CurrencyListItem)
    func updateView()
}

protocol CurrencyListInteractorOutputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    
    func fetchedCurrencyList(_ currencyList : [CurrencyListItem])
}

protocol CurrencyListInteractorInputProtocol: class
{
    var presenter: CurrencyListInteractorOutputProtocol? { get set }
    var APIDataManager: CurrencyListAPIDataManagerInputProtocol? { get set }
    var localDatamanager: CurrencyListLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func getCurrencyList()
}

protocol CurrencyListDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol CurrencyListAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol CurrencyListLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
    func loadCurrencyListArrayFromBundle() -> NSArray
}
