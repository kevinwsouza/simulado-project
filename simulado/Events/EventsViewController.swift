//
//  EventsViewController.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 01/07/21.
//

import Foundation
import UIKit

class EventsViewController: UIViewController {
    
    var baseView: EventsTableView
    var viewModel: EventsViewModel
    
    
//MARK: - init
    
    required init(viewModel: EventsViewModel) {
        self.viewModel = viewModel
        self.baseView = EventsTableView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - life cicle

extension EventsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Events"
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                              NSAttributedString.Key.font: UIFont(name: "Rockwell", size: 21)!
        ]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        setup()
        viewModel.getEvents()
    }
}

//MARK: - view Codable

extension EventsViewController: ViewCodable {
    func viewSetup() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow"), style: .plain, target: self, action: #selector(popToPrevious))
    }
    
    func constraintsSetup() {
        view.addSubview(baseView)
        
        baseView.translatesAutoresizingMaskIntoConstraints = false
        
        baseView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        baseView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        baseView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        baseView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

//MARK: - Actions
extension EventsViewController {

@objc func popToPrevious(){
    navigationController?.popViewController(animated: true)
    
    }
}

//MARK: - Table View

//extension EventsViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventsTableView
//        cell.setupConstrains()
//        let indexData = viewModel.worker[indexPath.row]
//        cell.createCells(with: indexData)
//        return cell
//    }
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.worker.count
//    }
//}
