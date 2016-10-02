//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

class CurrencyListWireFrame: CurrencyListWireFrameProtocol
{
    func presentCurrencyListModule(fromView view: AnyObject)
    {
        // Generating module components
        let view: CurrencyListViewProtocol = CurrencyListView()
        let presenter: protocol<CurrencyListPresenterProtocol, CurrencyListInteractorOutputProtocol> = CurrencyListPresenter()
        let interactor: CurrencyListInteractorInputProtocol = CurrencyListInteractor()
        let APIDataManager: CurrencyListAPIDataManagerInputProtocol = CurrencyListAPIDataManager()
        let localDataManager: CurrencyListLocalDataManagerInputProtocol = CurrencyListLocalDataManager()
        let wireFrame: CurrencyListWireFrameProtocol = CurrencyListWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager
    }
}