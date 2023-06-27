//
//  TiposController.swift
//  PokeApi
//
//  Created by Jair Montes on 25/06/23.
//

import UIKit

class TiposController: UIViewController {
    
    @IBOutlet weak var txtBuscar: UITextField!
    @IBOutlet weak var collectionTipo: UICollectionView!
    
    var pokemonsList : [Results] = []
    var paginacion : String = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20"
    var text : String = ""
    var url : String = ""
    var pokemonName : String = ""
    var result = Tipos()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionTipo.delegate = self
        collectionTipo.dataSource = self
        collectionTipo.register(UINib(nibName: "pokemonCell", bundle: .main), forCellWithReuseIdentifier:"pokemonCell")
        updateUI()
    }
    
    func updateUI(){
        PokemonViewModel.GetAllTipo { result, error in
            if let resultSource = result{
                for objpokemons in resultSource.results!{
                    let pokemon = objpokemons
                    self.pokemonsList.append(pokemon)
                }
                DispatchQueue.main.async {
                    self.collectionTipo.reloadData()
                }
            }
        }
    }
}
    

extension TiposController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.pokemonsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as! pokemonCell
        

            cell.lblNombre.text = pokemonsList[indexPath.row].name!
            cell.ImageView.image = UIImage(named: "\(pokemonsList[indexPath.row].name!)")
            
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true

        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.pokemonName = self.pokemonsList[indexPath.row].name!
        self.performSegue(withIdentifier: "SeguePorTipo", sender: self)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "SeguePorTipo" {
            let formControl = segue.destination as! porTipoController
            formControl.pokemonName = self.pokemonName
            formControl.url = self.url
        
        }
        
    }
}
