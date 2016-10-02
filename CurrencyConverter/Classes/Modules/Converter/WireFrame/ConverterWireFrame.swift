//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

let ConverterViewIdentifier = "ConverterView"

class ConverterWireFrame: ConverterWireFrameProtocol
{
    var rootWireframe : RootWireframe?
    var converterView : ConverterView?
    
    func presentConverterModule(fromView window: AnyObject)
    {
        // Generating module components
        let view = converterViewFromStoryboard()
        let presenter: protocol<ConverterPresenterProtocol, ConverterInteractorOutputProtocol> = ConverterPresenter()
        let interactor: ConverterInteractorInputProtocol = ConverterInteractor()
        let APIDataManager: ConverterAPIDataManagerInputProtocol = ConverterAPIDataManager()
        let localDataManager: ConverterLocalDataManagerInputProtocol = ConverterLocalDataManager()
        let wireFrame: ConverterWireFrameProtocol = ConverterWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager
        converterView = view
        
        rootWireframe?.showRootViewController(view, inWindow: window as! UIWindow)
    }
    

    func converterViewFromStoryboard() -> ConverterView {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(ConverterViewIdentifier) as! ConverterView
        return viewController
    }

    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
}