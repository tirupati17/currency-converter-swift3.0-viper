//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

class ConvertedListInteractor: ConvertedListInteractorInputProtocol
{
    weak var presenter: ConvertedListInteractorOutputProtocol?
    var APIDataManager: ConvertedListAPIDataManagerInputProtocol?
    var localDatamanager: ConvertedListLocalDataManagerInputProtocol?
    
    init() {}
}