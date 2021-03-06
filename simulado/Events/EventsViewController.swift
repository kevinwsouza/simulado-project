//
//  EventsViewController.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 01/07/21.
//

import Foundation
import UIKit

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel: EventsViewModel
    var refreshView: RefreshView
    
    //MARK: - init
    
    required init(viewModel: EventsViewModel, refreshView: RefreshView) {
        self.viewModel = viewModel
        self.refreshView = refreshView
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
    
    //MARK: - TableView config
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EventsTableViewCell else {
            return UITableViewCell()
        }
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
}
//MARK: - life cicle

extension EventsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarConfig()
        eventsTableViewConfig()
        setup()
        getData()
    }
    
    func navigationBarConfig() {
        self.navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Events"
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                              NSAttributedString.Key.font: UIFont(name: "Rockwell", size: 21)
        ]
        navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
    }
    
    func getData() {
        DispatchQueue.main.async {
            Spinner.start()
        }
        viewModel.getEvents(onComplete: { success in
            DispatchQueue.main.async { [weak self] in
                if success {
                    self?.eventsTableView.reloadData()
                } else {
                    self?.refreshViewConstrainsSetup()
                }
                Spinner.stop()
            }
        })
    }
}

//MARK: - view Codable

extension EventsViewController: ViewCodable {
    func viewSetup() {
        refreshView.buttonError.addTarget(self, action: #selector(refreshViewError), for: .touchUpInside)
        
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

//MARK: - events TableView config

extension EventsViewController {
    
    func eventsTableViewConfig() {
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        eventsTableView.register(EventsTableViewCell.self, forCellReuseIdentifier: "cell")
        eventsTableView.backgroundColor = .gray
        eventsTableView.separatorColor = .black
    }
}

//MARK: - Actions
extension EventsViewController {
    
    @objc func refreshViewError(){
        
        self.refreshView.removeFromSuperview()
        getData()
    }
}

//MARK: - Refresh View Constrains Setup

extension EventsViewController {
    
    func refreshViewConstrainsSetup() {
        self.view.addSubview(self.refreshView)
        
        self.refreshView.translatesAutoresizingMaskIntoConstraints = false
        
        self.refreshView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.refreshView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.refreshView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.refreshView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
    }
    
}
