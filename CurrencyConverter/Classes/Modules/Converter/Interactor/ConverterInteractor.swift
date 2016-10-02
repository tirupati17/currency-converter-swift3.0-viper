//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

class ConverterInteractor: ConverterInteractorInputProtocol
{
    weak var presenter: ConverterInteractorOutputProtocol?
    var APIDataManager: ConverterAPIDataManagerInputProtocol?
    var localDatamanager: ConverterLocalDataManagerInputProtocol?
    
    init() {}
}