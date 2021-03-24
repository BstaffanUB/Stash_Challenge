//
//  SmartInvestingView.swift
//  Stash-Challenge
//
//  Created by Benjamin Staffan on 3/21/21.
//

import Foundation
import UIKit

protocol SmartInvestingViewProtocol: class {
    func showLevelsData(response: AchievementsResponseModel)
    func noDataError(status: Int?)
}

class SmartInvestingView: UIViewController{
    
    @IBOutlet weak var levelsTableView: UITableView!
    
    var presenter: SmartInvestingPresenterProtocol!
    var levelResponseModel:AchievementsResponseModel = AchievementsResponseModel()
    
    let cellSpacingHeight: CGFloat = 16.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let infoButton = UIButton(type: .infoLight)
        let barButton = UIBarButtonItem(customView: infoButton)
        self.navigationItem.rightBarButtonItem = barButton
        //Didn't add a back button because it would auto populate when the view is attatched.
        
        //Needs to start Stashes loading Circle
        levelsTableView.delegate = self
        levelsTableView.dataSource = self
        presenter = SmartInvestingPresenter()
        presenter.achievementsView = self
        presenter.updateView()
    }
}

extension SmartInvestingView: SmartInvestingViewProtocol{
    func noDataError(status: Int?) {
        //Needs to cancel Stash's Loading Circle
        if status != nil{
            //Present error for achievement values == 0
        }else{
            //Present error for error with backend call with status = status
        }
    }
    
    func showLevelsData(response: AchievementsResponseModel) {
        //Needs to cancel Stash's Loading Circle
        levelResponseModel = response
        title = levelResponseModel.overview?.title
        levelsTableView.reloadData()
    
    }
}
extension SmartInvestingView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LevelViewCell", for: indexPath) as! LevelViewCell
        let level = levelResponseModel.achievements?[indexPath.section]

        cell.set(withModel: level!)
        cell.layer.cornerRadius = 8

        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return (levelResponseModel.achievements?.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Do some action for that level
    }
    
    
}
