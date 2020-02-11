//
//  BriefingsViewController.swift
//  FXWorld
//
//  Created by Aldo Bergamini on 28/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//

import UIKit

class BriefingsViewController: FXWSubjectViewController {
    
    // MARK: VC Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if let briefingsCoordinator = self.coordinator as? BriefingsCoordinator {
            
            if self.subjectTable != nil {
                
                self.subjectTable.isHidden = true
                
                self.loadingIndicator.isHidden = false
                self.loadingIndicator.startAnimating()
                briefingsCoordinator.updateBriefingsData()
            }
        }
    }
    
    
    // MARK: • Life Cycle Helpers
    
    override func prepare() {
        
        super.prepare()
        
        self.subject = .briefings
        
        if self.coordinator == nil {
            
            self.coordinator = BriefingsCoordinator(viewController: self)
        }
    }
    
    
    // MARK: - UITableViewDataSource Protocol Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let briefingsCoordinator = self.coordinator as? BriefingsCoordinator {
            
            return briefingsCoordinator.briefingsItemsNumber(for: section)
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let briefingTableCell = UITableViewCell()
        if let briefingsCoordinator = self.coordinator as? BriefingsCoordinator {
            
            let brifiengItem = briefingsCoordinator.briefingItem(at: indexPath.row, for: indexPath.section)
            briefingTableCell.textLabel?.text = "\(brifiengItem.title)"
        }
        return briefingTableCell
        
    }
    
    // MARK: - UITableViewDelegate Protocol Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    // MARK: - FXDataDisplay Protocol Methods
    
    //    func updateDisplay()
    
    //    INHERITED!!
    
}
