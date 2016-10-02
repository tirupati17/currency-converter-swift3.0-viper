//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

class ConverterPresenter: ConverterPresenterProtocol, ConverterInteractorOutputProtocol
{
    weak var view: ConverterViewProtocol?
    var interactor: ConverterInteractorInputProtocol?
    var wireFrame: ConverterWireFrameProtocol?
    
    init() {}
}