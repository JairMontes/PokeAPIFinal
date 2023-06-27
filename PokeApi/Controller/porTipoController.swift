//
//  porTipoController.swift
//  PokeApi
//
//  Created by Jair Montes on 25/06/23.
//

import UIKit

class porTipoController: UIViewController {

    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var collectionPorTipo: UICollectionView!
    
    
    var pokemonsList : [Results] = []
    var paginacion : String = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20"
    var text : String = ""
    var url : String = ""
    var pokemonName : String = ""
    var result = Tipos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblNombre.text = String(pokemonName)
        
        collectionPorTipo.delegate = self
        collectionPorTipo.dataSource = self
        collectionPorTipo.register(UINib(nibName: "pokemonCell", bundle: .main), forCellWithReuseIdentifier:"pokemonCell")
        updateUI()
    }
    

    @IBAction func btnBuscar(_ sender: Any) {
        
        PokemonViewModel.GetByElemento(elemento: self.pokemonName) { result, error in
            self.pokemonsList.removeAll()
            if let resultSource = result {
                self.result = resultSource
                for ObjPokemon in result!.pokemon!{
                    var pokemonElement = Results()
                    pokemonElement.name = ObjPokemon.pokemon.name
                    pokemonElement.url = ObjPokemon.pokemon.url
                    self.pokemonsList.append(pokemonElement)
                }
                DispatchQueue.main.async {
                    self.collectionPorTipo.reloadData()
                }
                
            }else {
                print("No existe esa categoria")//podria ser una alerta que no hay categoria
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Mensaje", message: "No existe ese nombre,id o elemento.Tambien puede estar mal escrito.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Aceptar", style: .default)
                    alert.addAction(action)
                    
                    self.present(alert, animated: true)
                    self.pokemonsList.removeAll()
                    self.collectionPorTipo.reloadData()
                    
                }
            }
            
        }
        
    }
    
    
    
//    func updateUI(){
//        PokemonViewModel.GetAllTipo { result, error in
//            if let resultSource = result{
//                for objpokemons in resultSource.results!{
//                    let pokemon = objpokemons
//                    self.pokemonsList.append(pokemon)
//                }
//                DispatchQueue.main.async {
//                    self.collectionPorTipo.reloadData()
//                }
//            }
//        }
//    }
//}

func updateUI(){
PokemonViewModel.GetByElemento(elemento: self.pokemonName) { result, error in
    self.pokemonsList.removeAll()
    if let resultSource = result {
        self.result = resultSource
        for ObjPokemon in result!.pokemon!{
            var pokemonElement = Results()
            pokemonElement.name = ObjPokemon.pokemon.name
            pokemonElement.url = ObjPokemon.pokemon.url
            self.pokemonsList.append(pokemonElement)
        }
        DispatchQueue.main.async {
            self.collectionPorTipo.reloadData()
        }
    }
}
}
}

    
    
    extension porTipoController: UICollectionViewDelegate,UICollectionViewDataSource{
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return self.pokemonsList.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as! pokemonCell
            
           
           
            cell.lblNombre.text = pokemonsList[indexPath.row].name!
                
                cell.layer.cornerRadius = 10
                cell.layer.masksToBounds = true
                self.text = pokemonsList[indexPath.row].url!
                
                            let textId = self.text.split(separator: "/")
                            // print(textId.last!)
                            let imageURLString = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(textId.last!).png"
                            self.url = imageURLString
                
                
                
                            UIImage.loadImageFromURL(imageURLString) { (image) in
                                if let image = image {
                                    // La imagen se cargó exitosamente desde la URL
                                    cell.ImageView.image = image
                                    //  print(image)
                                    //   print("la imagen se cargo correcramente")
                
                                } else {
                                    print("error al cargar la imagen")
                                }
                            }
            
            
            

                
                return cell
            }
        


func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    self.pokemonName = self.pokemonsList[indexPath.row].name!
    self.performSegue(withIdentifier: "SegueDetalleTipo1", sender: self)
    
    
}
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //controlar que hacer antes de ir a la siguiente vista
    
    if segue.identifier == "SegueDetalleTipo1" {
        let formControl = segue.destination as! DetalleController
        formControl.pokemonName = self.pokemonName
        formControl.url = self.url
        //formControl.id = self.id
        
        
    }
    
}
}
