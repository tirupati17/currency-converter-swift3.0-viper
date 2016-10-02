//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

class ConvertedListPresenter: ConvertedListPresenterProtocol, ConvertedListInteractorOutputProtocol
{
    weak var view: ConvertedListViewProtocol?
    var interactor: ConvertedListInteractorInputProtocol?
    var wireFrame: ConvertedListWireFrameProtocol?
    
    init() {}
}