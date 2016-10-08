//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

class CurrencyListPresenter: CurrencyListPresenterProtocol, CurrencyListInteractorOutputProtocol
{
    weak var view: CurrencyListViewProtocol?
    var interactor: CurrencyListInteractorInputProtocol?
    var wireFrame: CurrencyListWireFrameProtocol?
    
    init() {}
    
    func updateView() {
        self.interactor?.getCurrencyList()
    }

    func fetchedCurrencyList(_ currencyList : [CurrencyListItem]) {
        self.view?.reloadTableViewWithCurrencyList(currencyList)
    }
    
    func selectCurrencyListItem(_ currencyListItem : CurrencyListItem) {
        self.wireFrame?.dismissCurrencyListWithSelectedData(currencyListItem)
    }
}
