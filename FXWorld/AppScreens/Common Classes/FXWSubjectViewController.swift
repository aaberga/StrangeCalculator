//
//  FXWMarketsViewController.swift
//  FXWorld
//
//  Created by Aldo Bergamini on 28/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//

import UIKit

enum FXSubject: String {
    
    case news
    case briefings
    case analysis
    case markets
    case reports
}

protocol FXDataDisplay {
    
    func updateDisplay()
}

class FXWSubjectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewTarget {
    

    // MARK: Public Properties
    
    var subject: FXSubject?
    
    
    // MARK: - VC Life Cycle
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.prepare()
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.subjectTable.dataSource = self
        self.subjectTable.delegate = self
        
//        print("<\(self) subject table: \(String(describing: self.subjectTable))>")
    }
   
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.coordinator?.start()
    }

    // MARK: • Life Cycle Helpers
    
    func prepare() { }
    

    // MARK: - UITableViewDataSource Protocol Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }

    // MARK: - UITableViewDelegate Protocol Methods

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    // MARK: - FXDataDisplay Protocol Methods
    
    func updateDisplay() {
        
        DispatchQueue.main.async {
                        
            if self.subjectTable != nil {
                
                self.subjectTable.isHidden = false
                self.loadingIndicator.stopAnimating()
                self.loadingIndicator.isHidden = true
                self.subjectTable.reloadData()
            }
        }
    }


    // MARK: - Properties

    // MARK: • IBOutlets
    
    @IBOutlet weak var subjectTable: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    // MARK: • TargetView Properties

    var coordinator: Coordinator?

}
