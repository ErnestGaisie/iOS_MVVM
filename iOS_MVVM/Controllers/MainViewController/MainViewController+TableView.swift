//
//  MainViewController+TableView.swift
//  iOS_MVVM
//
//  Created by Gaisie on 2023/1/2.
//

import Foundation
import UIKit

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        self.movieTable.delegate = self
        self.movieTable.dataSource = self
        
        self.movieTable.backgroundColor = .clear
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.movieTable.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let movideData = cellDataSource[indexPath.row]
        cell.textLabel?.text =  self.viewModel.getMovieTitle(movideData)
        cell.tintColor = .red
        return cell
    }
    
    
}
