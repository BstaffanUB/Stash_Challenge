//
//  StackView.swift
//  Stash-Challenge
//
//  Created by Benjamin Staffan on 3/22/21.
//

import Foundation
import UIKit

class LevelViewCell: UITableViewCell {

    @IBOutlet weak var levelTitleView: UIView!
    @IBOutlet weak var urlImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var maskLayer: UIView!
    @IBOutlet weak var levelNumberLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var viewModel: AchievementValuesModel!
    func set(withModel: AchievementValuesModel) {
        viewModel = withModel
        
        levelTitleView.layer.cornerRadius = levelTitleView.bounds.width / 2
        
        //Mask if progress isnt started
        if viewModel.progress ?? 0 > 0{
            maskLayer.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.0)
        }else{
            maskLayer.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.6)
        }
        
        //Progress bar UI and label info for it
        progressBar.progress = Float(viewModel.progress ?? 0)/Float(viewModel.total ?? 0)
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 2)
        progressLabel.text = "\(viewModel.progress ?? 0)pts"
        totalLabel.text = "\(viewModel.total ?? 0)pts"
        
        levelNumberLabel.text = viewModel.level ?? ""
        
        guard let checkedURL = URL(string: self.viewModel.bg_image_url ?? "") else {
            debugPrint("\(self.viewModel.bg_image_url) not available")
            return
        }
        urlImageView.load(url: checkedURL)
    }
}

extension UIImageView{
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        
                        self?.image = image
                    }
                }
            }
        }
    }
}
