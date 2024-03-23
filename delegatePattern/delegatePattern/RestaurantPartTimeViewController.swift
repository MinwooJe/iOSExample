//
//  RestaurantViewController.swift
//  delegatePattern
//
//  Created by -- on 3/23/24.
//

import UIKit

final class RestaurantPartTimeViewController: UIViewController {
    
    let restaurantCallButtonsView = CallButtonsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        // 대리자 채택! 
        restaurantCallButtonsView.delegate = self
    }

}

extension RestaurantPartTimeViewController: PartTime {
    
    func didTapOrderButton() {
        print("짬뽕 두개 주문받았습니다.")
    }
    
    func didTapFinishButton() {
        print("주문하신 짬뽕 나왔습니다. 맛있게 드세요.")
    }
    
    
}

// MARK: - Configiure UI
extension RestaurantPartTimeViewController {
    
    private func configureUI() {
        view.addSubview(restaurantCallButtonsView)
        restaurantCallButtonsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            restaurantCallButtonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            restaurantCallButtonsView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            restaurantCallButtonsView.heightAnchor.constraint(equalToConstant: 200),
            restaurantCallButtonsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
    }
    
}
