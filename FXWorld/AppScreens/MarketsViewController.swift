//
//  MarketsViewController.swift
//  FXWorld
//
//  Created by Aldo Bergamini on 28/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//

import UIKit

class MarketsViewController: FXWSubjectViewController {
    
    // MARK: VC Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if let marketsCoordinator = self.coordinator as? MarketsCoordinator {
            
            if self.subjectTable != nil {
                self.subjectTable.isHidden = true
                
                self.loadingIndicator.isHidden = false
                self.loadingIndicator.startAnimating()
                marketsCoordinator.updateMarketData()
            }
        }
    }

    // MARK: • Life Cycle Helpers
    
    override func prepare() {
        
        super.prepare()

        self.subject = .markets
        
        if self.coordinator == nil {

            self.coordinator = MarketsCoordinator(viewController: self)
        }
    }
    
    
    // MARK: - UITableViewDataSource Protocol Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let marketsCoordinator = self.coordinator as? MarketsCoordinator {
            
            return marketsCoordinator.marketItemsNumber(for: section)
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let marketsTableCell = UITableViewCell()
        if let marketsCoordinator = self.coordinator as? MarketsCoordinator {
            
            let marketsItem = marketsCoordinator.marketItem(at: indexPath.row, for: indexPath.section)
            marketsTableCell.textLabel?.text = "\(marketsItem.displayName)"
        }
        return marketsTableCell
        
    }
    
    // MARK: - UITableViewDelegate Protocol Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    // MARK: - FXDataDisplay Protocol Methods
    
    //    func updateDisplay()
    
    //    INHERITED!!
    
}
