//
//  ViewController.swift
//  MVVMTutorial
//
//  Created by 제민우 on 9/27/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var datetimeLabel: UILabel!
    
    @IBAction func onYesterday() {
    }
    
    @IBAction func onNow() {
    }
    
    @IBAction func onTomorrow() {
    }
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onUpdated = { [weak self] in
            self?.datetimeLabel?.text = self?.viewModel.dateTimeString
        }
        viewModel.reloadData()
    }
}
