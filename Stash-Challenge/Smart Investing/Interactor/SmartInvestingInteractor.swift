//
//  SmartInvestingInteractor.swift
//  Stash-Challenge
//
//  Created by Benjamin Staffan on 3/21/21.
//

import Foundation


protocol SmartInvestingInteractorInput: class {
    var interactorOutput: SmartInvestingInteractorOutput? {get set}
    func getAchievements()
}


class SmartInvestingInteractor : SmartInvestingInteractorInput{
    weak var interactorOutput: SmartInvestingInteractorOutput?
    var testVar:Bool = false
    var returnedData: AchievementsResponseModel!
    func getAchievements() {
        fakeBackendCall()
    }
    
    func fakeBackendCall(){
        do {
            if let achievementPath = Bundle.main.path(forResource: "achievements", ofType: "json"), let jsonData = try String(contentsOfFile: achievementPath).data(using: .utf8) {
                do {
                    let achievementData = try JSONDecoder().decode(AchievementsResponseModel.self, from: jsonData)
                    if achievementData.success ?? false{
                        returnedData = achievementData
                        //Return achievements to presenter
                        self.interactorOutput?.achievementsReturned(response: achievementData)
                    }else{
                        self.interactorOutput?.backEndFailure(status: achievementData.status)
                    }
                } catch {
                    debugPrint(error.localizedDescription)
                }
            }
            else{
                debugPrint("Failed to load file")
            }
        } catch {
            debugPrint("Failed")
        }
    }
}
    



