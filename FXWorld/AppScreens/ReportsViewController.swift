//
//  ReportsViewController.swift
//  FXWorld
//
//  Created by Aldo Bergamini on 28/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//

import UIKit

class ReportsViewController: FXWSubjectViewController {
    
    // MARK: VC Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if let reportsCoordinator = self.coordinator as? ReportsCoordinator {
            
            if self.subjectTable != nil {
                self.subjectTable.isHidden = true
                
                self.loadingIndicator.isHidden = false
                self.loadingIndicator.startAnimating()
                reportsCoordinator.updateReportData()
            }
        }
    }

    // MARK: • Life Cycle Helpers

    override func prepare() {
        
        super.prepare()

        self.subject = .reports
        
        if self.coordinator == nil {

            self.coordinator = ReportsCoordinator(viewController: self)
        }
    }
    
    
    // MARK: - UITableViewDataSource Protocol Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let reportsCoordinator = self.coordinator as? ReportsCoordinator {
            
            return reportsCoordinator.reportItemsNumber()
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reportsTableCell = UITableViewCell()
        if let reportsCoordinator = self.coordinator as? ReportsCoordinator {
            
            let reportItem = reportsCoordinator.reportsItem(at: indexPath.row)
            reportsTableCell.textLabel?.text = "\(reportItem.title)"
        }
        return reportsTableCell
        
    }
    
    // MARK: - UITableViewDelegate Protocol Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    // MARK: - FXDataDisplay Protocol Methods
    
    //    func updateDisplay()
    
    //    INHERITED!!
    
}
