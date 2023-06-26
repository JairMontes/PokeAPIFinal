//
//  Pokemones.swift
//  PokeApi
//
//  Created by Jair Montes on 25/06/23.
//

import Foundation


struct PokemonPaginacion : Codable {
    var pokemons : [Pokemons]
}

struct Pokemons: Codable {

  var count    : Int
  var next     : String?
  var previous : String?
  var results  : [Results]


 
}

struct Results: Codable {
    
    var name : String? = nil
    var url  : String? = nil
    
    init() {
        self.name = ""
        self.url = ""
    }

}
