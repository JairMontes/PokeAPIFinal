//
//  Stat.swift
//  PokeApi
//
//  Created by Jair Montes on 25/06/23.
//

import Foundation

//struct Specs<T : Codable> : Codable{
//
//    var id : Int
//    var stats : [T]
//    var types : [T]
//
//    init(stats : [Codable], types : [Codable]) {
//        self.id = 0
//        self.stats = []
//        self.types = []
//    }
//
//}
//
//struct Stats : Codable{
//    var base_stat : Int?
//
//
//    init(){
//
//        self.base_stat = 0
//
//    }
//}
struct Root: Codable {
    
    var count: Int = 0
    var next: String? = nil
    var previous: String? = nil
    var results: [Results]? = nil
    
}
