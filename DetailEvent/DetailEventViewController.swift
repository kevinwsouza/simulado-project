//
//  DetailEventViewController.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 05/07/21.
//

import Foundation
import UIKit

class DetailEventViewController: UIViewController {
    
    var viewModel: DetailEventViewModel
    var baseView: DetailEventView
    
    //MARK: - init
    
    required init(viewModel: DetailEventViewModel) {
        self.viewModel = viewModel
        self.baseView = DetailEventView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - life cicle

extension DetailEventViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Events"
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                              NSAttributedString.Key.font: UIFont(name: "Rockwell", size: 21)!
        ]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        setup()
        
    }
}

// MARK: - View Codable

extension DetailEventViewController: ViewCodable {
    func viewSetup() {
        
        
    }
    
    func constraintsSetup() {
        
        view.addSubview(baseView)

        baseView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        baseView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        baseView.topAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        baseView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
