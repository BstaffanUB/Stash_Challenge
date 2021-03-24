//
//  SmartInvestingModels.swift
//  Stash-Challenge
//
//  Created by Benjamin Staffan on 3/21/21.
//

import Foundation

//Response modelfor if it was returned from a backend
struct AchievementsResponseModel: Codable{
    var success: Bool?
    var status: Int?
    var overview: OverviewModel?
    var achievements:[AchievementValuesModel]?
}

struct OverviewModel: Codable{
    var title: String?
}

struct AchievementValuesModel: Codable{
    // I didn't see a use for Id, if there was I apologize.
    var id: Int?
    
    var level: String?
    var progress: Int?
    var total: Int?
    var bg_image_url: String?
    var accessible: Bool?
}
