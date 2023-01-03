//
//  MainViewModel.swift
//  iOS_MVVM
//
//  Created by Gaisie on 2023/1/2.
//

import Foundation

class MainViewModel {
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[Movie]> = Observable(nil)
    var dataSource: TrendingMovieModel?
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRow(in section: Int) -> Int {
        self.dataSource?.results.count ?? 0
    }
    
    func getData(){
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        APICaller.getTrendingMovies { [weak self] result in
             self?.isLoading.value = false
            switch result {
            case .success(let data):
                print("Top Trending Counts \(data.results.count)")
                self?.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData(){
        self.cellDataSource.value = self.dataSource?.results ?? []
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }
}
