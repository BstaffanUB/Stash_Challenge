//
//  SmartInvestingPresenter.swift
//  Stash-Challenge
//
//  Created by Benjamin Staffan on 3/21/21.
//

import Foundation

protocol SmartInvestingPresenterProtocol: class {
    var achievementsView: SmartInvestingViewProtocol? {get set}
    func updateView()
}

protocol SmartInvestingInteractorOutput: class{
    func achievementsReturned(response:AchievementsResponseModel)
    func backEndFailure(status: Int?)
}

class SmartInvestingPresenter: SmartInvestingPresenterProtocol, SmartInvestingInteractorOutput{
    var interactor: SmartInvestingInteractorInput!
    
    weak var achievementsView: SmartInvestingViewProtocol?
    
    

    func updateView() {
        interactor = SmartInvestingInteractor()
        interactor.interactorOutput = self
        self.interactor.getAchievements()
    }
    
    func achievementsReturned(response: AchievementsResponseModel) {

        achievementsView?.showLevelsData(response: response)
    }
    
    func backEndFailure(status: Int?) {
        achievementsView?.noDataError(status: status)
    }
    
}
