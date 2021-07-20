//
//  EventsViewController.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 01/07/21.
//

import Foundation
import UIKit

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //var baseView: EventsTableView
    var viewModel: EventsViewModel
    
    
    //MARK: - init
    
    required init(viewModel: EventsViewModel) {
        self.viewModel = viewModel
        //self.baseView = EventsTableView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - TableView
    
    private var eventsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    private var titleEvents: UILabel = {
        let label = UILabel()
        label.text = "EVENTOS"
        label.textColor = .yellow
        label.font = UIFont(name: "Rockwell", size: 16)
        label.textAlignment = .center
        return label
    }()
    private var rootView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    //MARK: - TableView config
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventsTableViewCell
        cell.setup()
        let indexData = viewModel.eventsList[indexPath.row]
        cell.createCells(with: indexData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.eventsList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelect(row: indexPath.row)
    }
}
//MARK: - life cicle

extension EventsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        eventsTableView.register(EventsTableViewCell.self, forCellReuseIdentifier: "cell")
        eventsTableView.backgroundColor = .lightGray
        self.navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Events"
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                              NSAttributedString.Key.font: UIFont(name: "Rockwell", size: 21)!
        ]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        setup()
        viewModel.getEvents(onComplete: {
            DispatchQueue.main.async {
                self.eventsTableView.reloadData()
            }
        })
    }
}

//MARK: - view Codable

extension EventsViewController: ViewCodable {
    func viewSetup() {
        //        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow"), style: .plain, target: self, action: #selector(popToPrevious))
    }
    
    func constraintsSetup() {
        view.addSubview(eventsTableView)
        
        eventsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        eventsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        eventsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        eventsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        eventsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

//MARK: - Actions
extension EventsViewController {
    
    //    @objc func popToPrevious(){
    //        navigationController?.popViewController(animated: true)
    //
    //    }
}


