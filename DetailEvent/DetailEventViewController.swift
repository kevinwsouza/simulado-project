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
        self.baseView = DetailEventView(with: viewModel.event)
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
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = false
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

extension DetailEventViewController: ViewCodable {
    func viewSetup() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow"), style: .plain, target: self, action: #selector(popToPrevious))
    }
    
    func constraintsSetup() {
        
        view.addSubview(baseView)
        
        
        baseView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        baseView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        baseView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        baseView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
    }
}

//MARK: - Actions
extension DetailEventViewController {
    
    @objc func popToPrevious(){
        navigationController?.popViewController(animated: true)
        
    }
}
