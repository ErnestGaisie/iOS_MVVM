//
//  NetworkConstant.swift
//  iOS_MVVM
//
//  Created by Gaisie on 2023/1/3.
//

import Foundation

class NetworkConstant {
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init(){
        //Singletone
    }
    
    public var apiKey: String {
        get {
            //API Key
            return "529286fcb1197ff929936ed730a83a26"
        }
    }
    
    public var serverAddress : String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String{
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
