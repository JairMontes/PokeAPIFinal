//
//  PokemonViewModel.swift
//  PokeApi
//
//  Created by Jair Montes on 25/06/23.
//

import Foundation
import UIKit
import CoreData

class PokemonViewModel {
    static func GetPokemon (paginacion: String,responseResult : @escaping(Pokemons?,Error?) -> Void) {
        
        let url = URL(string: "\(paginacion)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 200 {
                if let dataSource = data{
                    let decoder = JSONDecoder()
                    let result =  try!
                    decoder.decode(Pokemons.self, from: dataSource)
                    responseResult(result,nil)
                }
                if let errorSource = error{
                    responseResult(nil,errorSource)
                }
                
            }else{
                print("Error")
                responseResult(nil,error)
            }
            
            
            
        }.resume()
        
    }
    
    static func GetByName (namePokemon: String,responseResult : @escaping(Pokemon?,Error?) -> Void) {
        
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(namePokemon)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 200 {
                if let dataSource = data{
                    let decoder = JSONDecoder()
                    let result =  try!
                    decoder.decode(Pokemon.self, from: dataSource)
                    responseResult(result,nil)
                }
                if let errorSource = error{
                    responseResult(nil,errorSource)
                }
            }else{
                print("No se encontro el pokemon")
                
                responseResult(nil,error)
            }
        }.resume()
        
    }
    
    static func GetAllTipo(resp: @escaping(Root?, Error?) -> Void){
        let url = URL(string: "https://pokeapi.co/api/v2/type")!
        
        URLSession.shared.dataTask(with: url){data, response, error in
            let httpResponse = response as! HTTPURLResponse
            if 200...299 ~= httpResponse.statusCode{
                if let dataSource = data{
                    let decoder = JSONDecoder()
                    let jsonString = String(data: dataSource, encoding: String.Encoding.utf8)
                    let result = try! decoder.decode(Root.self, from: dataSource)
                    resp(result, nil)
                }
                if let errorSource = error{
                    resp(nil, errorSource)
                }
            }
            
        }.resume()
    }
    
    static func GetByElemento (elemento: String,responseResult : @escaping(Tipos?,Error?) -> Void) {
        
        let url = URL(string: "https://pokeapi.co/api/v2/type/\(elemento)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 200 {
                if let dataSource = data{
                    let decoder = JSONDecoder()
                    let result =  try!
                    decoder.decode(Tipos.self, from: dataSource)
                    responseResult(result,nil)
                }
                if let errorSource = error{
                    responseResult(nil,errorSource)
                }
                
            }else{
                print("Error, no se encontro el tipo")
                responseResult(nil,error)
            }
            
        }.resume()
        
    }
    

    
    //    CoreData
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func Add(_ user : LoginPokemon) -> Result {
        
        var result = Result()
       
        do{
            let context = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Login", in: context)
            let pokemon = NSManagedObject(entity: entity!, insertInto: context)
            
            // Primero: Que se inserta. Segundo: En donde (columna/llave)
            pokemon.setValue(user.username, forKey: "username")
            pokemon.setValue(user.password, forKey: "password")
            
            
            // Guardar
            try context.save()
            
            result.Correct = true
        }
        catch let error{
            result.Correct = false
            result.ErrorMessage = error.localizedDescription
            result.Ex = error
        }
        
        return result
    }
    
}
