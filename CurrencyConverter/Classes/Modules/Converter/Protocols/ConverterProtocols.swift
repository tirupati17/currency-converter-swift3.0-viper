//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

protocol ConverterViewProtocol: class
{
    var presenter: ConverterPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol ConverterWireFrameProtocol: class
{
    func presentConverterModule(fromView window: AnyObject)
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
}

protocol ConverterInteractorOutputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol ConverterInteractorInputProtocol: class
{
    var presenter: ConverterInteractorOutputProtocol? { get set }
    var APIDataManager: ConverterAPIDataManagerInputProtocol? { get set }
    var localDatamanager: ConverterLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
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
}

protocol ConverterLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
