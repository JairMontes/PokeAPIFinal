//
//  Login.swift
//  PokeApi
//
//  Created by Admin on 03/07/23.
//

import Foundation

struct LoginPokemon : Codable{
    
    var username : String
    var password : String
    
    
    init(){
        self.username = ""
        self.password = ""
        
    }
}
