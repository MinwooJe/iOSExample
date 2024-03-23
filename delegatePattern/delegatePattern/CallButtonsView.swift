//
//  callButtonsView.swift
//  delegatePattern
//
//  Created by -- on 3/23/24.
//

import UIKit

protocol PartTime {
    func didTapOrderButton()
    func didTapFinishButton()
}

final class CallButtonsView: UIView {
    
    var delegate: PartTime?
    
    // 주문 버튼
    private let orderButton: UIButton = {
       let button = UIButton()
        button.setTitle("(손님용 버튼)주문할 때 눌러주세요", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemCyan
        return button
    }()
    
    // 음식이 완료됨을 알바생에게 알리는 버튼
    private let finishButton: UIButton = {
        let button = UIButton()
        button.setTitle("(직원용 버튼)음식이 완성되면 눌러주세요", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemCyan
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        configureLayout()
        configureAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Configure Action
extension CallButtonsView {
    private func configureAddTarget() {
        orderButton.addTarget(self, action: #selector(didTapOrderButton), for: .touchUpInside)
        finishButton.addTarget(self, action: #selector(didTapFinishButton), for: .touchUpInside)
    }
    
    @objc private func didTapOrderButton() {
        delegate?.didTapOrderButton()           // 대리자(알바생)에게 일을 시키는 것!
    }
    
    @objc private func didTapFinishButton() {
        delegate?.didTapFinishButton()          // 대리자(알바생)에게 일을 시키는 것!
    }
    
}

// MARK: - Configure UI
extension CallButtonsView {
    
    private func configureSubviews() {
        [orderButton, finishButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            orderButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            orderButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            orderButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            finishButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            finishButton.topAnchor.constraint(equalTo: orderButton.bottomAnchor, constant: 10),
            finishButton.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
}
