//
//  MainViewController.swift
//  iOS_MVVM
//
//  Created by Gaisie on 2023/1/2.
//

import UIKit

class MainViewController: UIViewController {
    
    //TableView:
    let movieTable: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    //Activity IIndicator
    var activityView: UIActivityIndicatorView?
    
    //ViewModel:
    var viewModel: MainViewModel = MainViewModel()
    
    //variables
    var cellDataSource: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(movieTable)
        configView()
        bindViewModel()
    }
    
    override func viewDidLayoutSubviews() {
        movieTable.frame = view.bounds
    }
    
    private func configView(){
        view.backgroundColor = .systemBackground
        title = "Main View"
        
        setupTableView()
    }
    
    private func bindViewModel(){
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.showActivityIndicator()
                } else {
                    self.hideActivityIndicator()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
    
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }

    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }

}


