//
//  ViewController.swift
//  ViewControllerLifeCycle
//
//  Created by 제민우 on 9/26/24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var pushButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Push", for: .normal)
        return button
    }()
    
    lazy var presentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Present", for: .normal)
        return button
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureSubviews()
        configureLayout()
        configureAddTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("1 - 뷰가 곧 등장할 예정")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("1 - 나야 들기름")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("1 - 뷰가 곧 사라질 예정")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("1 - 뷰가 완전 사라짐.")
    }
}

extension ViewController {
    private func configureSubviews() {
        [pushButton, presentButton].forEach {
            stackView.addArrangedSubview($0)
        }
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor)
        ])
    }
}

extension ViewController {
    private func configureAddTarget() {
        pushButton.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
        presentButton.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
    }
    
    @objc private func pushButtonTapped() {
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func presentButtonTapped() {
        let vc = SecondViewController()
        modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}
