//
//  CheckInViewController.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 02/08/21.
//

import Foundation
import UIKit

class CheckInViewController: UIViewController {
    
    var viewModel: CheckInViewModel
    var baseView: CheckInView
    
    
    //MARK: - init
    
    required init(viewModel: CheckInViewModel) {
        self.viewModel = viewModel
        self.baseView = CheckInView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - life cicle

extension CheckInViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Events"
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                              NSAttributedString.Key.font: UIFont(name: "Rockwell", size: 21)!
        ]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        setup()
    }
}

// MARK: - View Codable

extension CheckInViewController: ViewCodable {
    func viewSetup() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow"), style: .plain, target: self, action: #selector(popToPrevious))
    }
    
    func constraintsSetup() {
        
        view = baseView
    }
}

//MARK: - Actions
extension CheckInViewController {
    
    @objc func popToPrevious(){
        navigationController?.popViewController(animated: true)
        
    }
}
