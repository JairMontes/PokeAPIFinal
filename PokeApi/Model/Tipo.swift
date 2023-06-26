//
//  Tipo.swift
//  PokeApi
//
//  Created by Jair Montes on 25/06/23.
//

import Foundation

struct Tipos: Codable {
var id : Int? = nil
var name : String? = nil
var pokemon : [pokemons]? = []
  }


struct pokemons: Codable {
    var pokemon : pokemon
    var slot : Int
}

struct pokemon: Codable {
    var name : String?
    var url : String?
}
