//
//  ViewController.swift
//  Accenture_iOS
//
//  Created by XTGlobal on 21/12/20.
//  Copyright © 2020 Goutham. All rights reserved.
//

import UIKit
import SDWebImage


class ViewController: UIViewController{
    
    
    private var factViewModel : FactsViewModel!
    
    private var dataSource : FactTableDataSource<FactTableCell,Rows>!
    
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.tintColor = UIColor.darkGray
        activity.hidesWhenStopped = true
        activity.style = .large
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()
    
    private let refreshControl = UIRefreshControl()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        callToViewModelForUIUpdate()
        
    }
    
    
    func setupUI(){
        view.backgroundColor = UIColor.white
        self.view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        tableView.register(FactTableCell.self, forCellReuseIdentifier: "FactTableCell")

        
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(callToViewModelForUIUpdate), for: .valueChanged)
        
        self.view.addSubview(activityIndicator)
        
        activityIndicator.widthAnchor.constraint(equalToConstant: 35.0).isActive = true
        activityIndicator.heightAnchor.constraint(equalToConstant: 35.0).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        activityIndicator.startAnimating()
    }
    
    
    
    
    
    @objc func callToViewModelForUIUpdate(){
        self.factViewModel =  FactsViewModel()
        self.factViewModel.bindViewModelToController = {
            self.updateDataSource()
        }
    }
    
    
    func updateDataSource(){
        self.dataSource = FactTableDataSource(cellIdentifier: "FactTableCell", items: self.factViewModel.empData.rows!, configureCell: { (cell, evm) in
            cell.selectionStyle = .none
            cell.titleTxt.text = evm.title
            cell.descriptionTxt.text = evm.description
            
            let imgStr = evm.imageHref == nil ? "" : evm.imageHref
            if let url = URL(string: imgStr!) {
                cell.img.sd_setImage(with: url, placeholderImage: UIImage(named: "image-placeholder"), options: .refreshCached, completed: nil)
            }
            else {
                cell.img.image = UIImage(named: "image-placeholder")
            }
            
        })
        
        DispatchQueue.main.async {
            self.navigationItem.title = self.factViewModel.empData.flatMap{$0.title}
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
            self.activityIndicator.stopAnimating()
        }
    }
    
   
}

