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
        viewModel.changeDate(day: -1)
    }
    
    @IBAction func onNow() {
        viewModel.reloadData()
    }
    
    @IBAction func onTomorrow() {
        viewModel.changeDate(day: 1)
    }
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.datetimeLabel?.text = self?.viewModel.dateTimeString
            }
        }
        viewModel.reloadData()
    }
}
