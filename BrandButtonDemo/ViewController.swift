//
//  ViewController.swift
//  BrandButtonDemo
//
//  Created by Abhishek Srivastava on 10/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    // Create stack view for the first column
    lazy var primaryButtonStackView = createButtonStackView()
    
    // Create stack view for the second column
    lazy var secondaryButtonStackView = createButtonStackView()
    
    // Primary Button
    let primaryGreenBtn: BrandButton = BrandButton.init(type: .primaryGreen)
    let primaryBlueBtn: BrandButton = BrandButton.init(type: .primaryBlue)
    
    static let iconName = "stop.fill"
    let primaryGreenLeftIconBtn: BrandButton = BrandButton.init(type: .primaryGreen,
                                                                     icon: UIImage.init(systemName: iconName),
                                                                     leadingIcon: true)
    let primaryBlueLeftIconBtn: BrandButton = BrandButton.init(type: .primaryBlue,
                                                                    icon: UIImage.init(systemName: iconName),
                                                                    leadingIcon: true)
    let primaryGreenRightIconBtn: BrandButton = BrandButton.init(type: .primaryGreen,
                                                                      icon: UIImage.init(systemName: iconName),
                                                                      leadingIcon: false)
    let primaryBlueRightIconBtn: BrandButton = BrandButton.init(type: .primaryBlue,
                                                                     icon: UIImage.init(systemName: iconName),
                                                                     leadingIcon: false)
    
    // Secondary Button
    let secondaryGreenBtn: BrandButton = BrandButton.init(type: .secondaryGreen)
    let secondaryBlueBtn: BrandButton = BrandButton.init(type: .secondaryBlue)
    let secondaryGreenLeftIconBtn: BrandButton = BrandButton.init(type: .secondaryGreen,
                                                                       icon: UIImage.init(systemName: iconName),
                                                                       leadingIcon: true)
    let secondaryBlueLeftIconBtn: BrandButton = BrandButton.init(type: .secondaryBlue,
                                                                      icon: UIImage.init(systemName: iconName),
                                                                      leadingIcon: true)
    let secondaryGreenRightIconBtn: BrandButton = BrandButton.init(type: .secondaryGreen,
                                                                        icon: UIImage.init(systemName: iconName),
                                                                        leadingIcon: false)
    let secondaryBlueRightIconBtn: BrandButton = BrandButton.init(type: .secondaryBlue,
                                                                       icon: UIImage.init(systemName: iconName),
                                                                       leadingIcon: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
    }
    
    func configureButton() {
        configureStackView()
        configureTargets()
        setTitles()
    }
}

extension ViewController {
    fileprivate func configureStackView() {
        // Create stack view to hold both columns
        let columnsStackView = UIStackView(arrangedSubviews: [primaryButtonStackView, secondaryButtonStackView])
        columnsStackView.axis = .horizontal
        columnsStackView.spacing = 20
        columnsStackView.distribution = .fillEqually
        // Add the combined stack view to the main view
        view.addSubview(columnsStackView)
        
        // Set constraints for the combined stack view
        columnsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            columnsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            columnsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            columnsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            columnsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -350)
        ])
        
        primaryButtonStackView.distribution = .fillEqually
        secondaryButtonStackView.distribution = .fillEqually
        // primary button
        primaryButtonStackView.addArrangedSubview(primaryGreenBtn)
        primaryButtonStackView.addArrangedSubview(primaryBlueBtn)
        primaryButtonStackView.addArrangedSubview(primaryGreenLeftIconBtn)
        primaryButtonStackView.addArrangedSubview(primaryBlueLeftIconBtn)
        primaryButtonStackView.addArrangedSubview(primaryGreenRightIconBtn)
        primaryButtonStackView.addArrangedSubview(primaryBlueRightIconBtn)
        // secondary button
        secondaryButtonStackView.addArrangedSubview(secondaryGreenBtn)
        secondaryButtonStackView.addArrangedSubview(secondaryBlueBtn)
        secondaryButtonStackView.addArrangedSubview(secondaryGreenLeftIconBtn)
        secondaryButtonStackView.addArrangedSubview(secondaryBlueLeftIconBtn)
        secondaryButtonStackView.addArrangedSubview(secondaryGreenRightIconBtn)
        secondaryButtonStackView.addArrangedSubview(secondaryBlueRightIconBtn)
    }
    
    fileprivate func setTitles() {
        // primary button
        primaryGreenBtn.setTitle("Primary", for: .normal)
        primaryBlueBtn.setTitle("Primary", for: .normal)
        primaryGreenLeftIconBtn.setTitle("Primary", for: .normal)
        primaryGreenRightIconBtn.setTitle("Primary", for: .normal)
        primaryBlueLeftIconBtn.setTitle("Primary", for: .normal)
        primaryBlueRightIconBtn.setTitle("Primary", for: .normal)
        
        // secondary button
        secondaryGreenBtn.setTitle("Secondary", for: .normal)
        secondaryBlueBtn.setTitle("Secondary", for: .normal)
        secondaryGreenLeftIconBtn.setTitle("Secondary", for: .normal)
        secondaryBlueLeftIconBtn.setTitle("Secondary", for: .normal)
        secondaryGreenRightIconBtn.setTitle("Secondary", for: .normal)
        secondaryBlueRightIconBtn.setTitle("Secondary", for: .normal)
    }
    
    // Function to create a stack view for buttons
    private func createButtonStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }
}


extension ViewController {
    fileprivate func configureTargets() {
        primaryGreenBtn.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        primaryBlueBtn.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        primaryGreenLeftIconBtn.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        primaryBlueLeftIconBtn.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        primaryGreenRightIconBtn.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        primaryBlueRightIconBtn.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        secondaryGreenBtn.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        secondaryBlueBtn.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        secondaryGreenLeftIconBtn.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        secondaryBlueLeftIconBtn.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        secondaryGreenRightIconBtn.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        secondaryBlueRightIconBtn.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
    }
    
    @objc func buttonTapped(sender: BrandButton) {
        let blockOps = BlockOperation.init()
        blockOps.addExecutionBlock {
            DispatchQueue.main.async {
                sender.isEnabled = false
            }
        }
        
        blockOps.addExecutionBlock {
            DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: DispatchTime.now() + 2) {
                DispatchQueue.main.async {
                    sender.isEnabled = true
                }
            }
        }
        
        let operationQueue = OperationQueue()
        operationQueue.addOperation(blockOps)
    }
}
