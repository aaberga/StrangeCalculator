//
//  AnalysisViewController.swift
//  FXWorld
//
//  Created by Aldo Bergamini on 28/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//

import UIKit

class AnalysisViewController: FXWSubjectViewController {
    
    // MARK: VC Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if let analysisCoordinator = self.coordinator as? AnalysisCoordinator {
            
            if self.subjectTable != nil {
                
                self.subjectTable.isHidden = true
                
                self.loadingIndicator.isHidden = false
                self.loadingIndicator.startAnimating()
                analysisCoordinator.updateAnalysisData()
            }
        }
    }
    
    
    // MARK: • Life Cycle Helpers
    
    override func prepare() {
        
        super.prepare()

        self.subject = .analysis
        
        if self.coordinator == nil {

            self.coordinator = AnalysisCoordinator(viewController: self)
        }
    }
        
        
    // MARK: - UITableViewDataSource Protocol Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let analysisCoordinator = self.coordinator as? AnalysisCoordinator {
            
            return analysisCoordinator.analysisItemsNumber()
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let analysisTableCell = UITableViewCell()
        if let analysisCoordinator = self.coordinator as? AnalysisCoordinator {
            
            let newsItem = analysisCoordinator.analysisItem(at: indexPath.row)
            analysisTableCell.textLabel?.text = "\(newsItem.title)"
        }
        return analysisTableCell
        
    }
    
    // MARK: - UITableViewDelegate Protocol Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    // MARK: - FXDataDisplay Protocol Methods
    
    //    func updateDisplay()
    
    //    INHERITED!!
    
}
