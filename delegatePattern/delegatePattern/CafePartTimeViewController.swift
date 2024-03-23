//
//  CafePartTimeViewController.swift
//  delegatePattern
//
//  Created by -- on 3/23/24.
//

import UIKit

final class CafePartTimeViewController: UIViewController {
    
    let cafeCallButtonsView = CallButtonsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown
        configureUI()
        // ✨중요! 이 알바생이 대리자임을 지정해줘야 함✨
        cafeCallButtonsView.delegate = self
    }

}

// PartTime 프로토콜 채택했으니 그에 맞는 일을 할 줄 알아야 됨!
extension CafePartTimeViewController: PartTime {
    // 프로토콜 필수 메서드 구현
    func didTapOrderButton() {
        print("아이스아메리카노 두개 주문받았습니다.")
    }
    
    func didTapFinishButton() {
        print("주문하신 음료 나왔습니다. 카운터에서 가져가세요")
    }
    
}

// MARK: - Configiure UI
extension CafePartTimeViewController {
    
    private func configureUI() {
        view.addSubview(cafeCallButtonsView)
        cafeCallButtonsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cafeCallButtonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cafeCallButtonsView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cafeCallButtonsView.heightAnchor.constraint(equalToConstant: 200),
            cafeCallButtonsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
    }
    
}
