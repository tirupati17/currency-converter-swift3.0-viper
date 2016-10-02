//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

class ConvertedListWireFrame: ConvertedListWireFrameProtocol
{
    func presentConvertedListModule(fromView view: AnyObject)
    {
        // Generating module components
        let view: ConvertedListViewProtocol = ConvertedListView()
        let presenter: ConvertedListPresenterProtocol & ConvertedListInteractorOutputProtocol = ConvertedListPresenter()
        let interactor: ConvertedListInteractorInputProtocol = ConvertedListInteractor()
        let APIDataManager: ConvertedListAPIDataManagerInputProtocol = ConvertedListAPIDataManager()
        let localDataManager: ConvertedListLocalDataManagerInputProtocol = ConvertedListLocalDataManager()
        let wireFrame: ConvertedListWireFrameProtocol = ConvertedListWireFrame()
        
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
