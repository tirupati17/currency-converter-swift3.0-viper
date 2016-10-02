//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

protocol ConvertedListViewProtocol: class
{
    var presenter: ConvertedListPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol ConvertedListWireFrameProtocol: class
{
    func presentConvertedListModule(fromView view: AnyObject)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol ConvertedListPresenterProtocol: class
{
    var view: ConvertedListViewProtocol? { get set }
    var interactor: ConvertedListInteractorInputProtocol? { get set }
    var wireFrame: ConvertedListWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
}

protocol ConvertedListInteractorOutputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol ConvertedListInteractorInputProtocol: class
{
    var presenter: ConvertedListInteractorOutputProtocol? { get set }
    var APIDataManager: ConvertedListAPIDataManagerInputProtocol? { get set }
    var localDatamanager: ConvertedListLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}

protocol ConvertedListDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol ConvertedListAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol ConvertedListLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
