//
//  PokemonController.swift
//  PokeApi
//
//  Created by Jair Montes on 25/06/23.
//

import UIKit

class PokemonController: UIViewController {
    
    @IBOutlet weak var txtBuscar: UITextField!
    
    @IBOutlet weak var collectionPokemon: UICollectionView!
    
    @IBOutlet weak var lblVacio: UILabel!
    var pokemonsList : [Results] = []
    var pokemonInfo : [Pokemon] = []
    var pokemonName : String = ""
    var text : String = ""
    var url : String = ""
    var paginacion : String = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20"
    var nextPaginacion : String = ""
    var previusPaginacion : String? = nil
    var id : String = ""
    var color = UIColor.red.cgColor
    var color2 = UIColor.white.cgColor
    var elemento : String = ""
    var result = Tipos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionPokemon.delegate = self
        collectionPokemon.dataSource = self
        collectionPokemon.register(UINib(nibName: "pokemonCell", bundle: .main), forCellWithReuseIdentifier:"pokemonCell")
        updateUI()
        
    }
    
    func updateUI(){
        self.pokemonsList.removeAll()
        collectionPokemon.reloadData()
        PokemonViewModel.GetPokemon(paginacion: self.paginacion) { result, error in
            DispatchQueue.main.async {
                if result! != nil {
                    self.previusPaginacion = result?.previous ?? nil
                    self.nextPaginacion = result!.next!
                    for objPokemon in result!.results {
                        
                        
                        
                        self.pokemonsList.append(objPokemon)
                        
                    }
                    self.collectionPokemon.reloadData()
                    // print(self.pokemonName)
                }
                self.collectionPokemon.reloadData()
                
            }
        }
    }
    
    
    @IBAction func btnNext(_ sender: Any) {
        self.paginacion = self.nextPaginacion
        updateUI()
    }
    
    @IBAction func btnPrevious(_ sender: Any) {
        print("paginacion: \(self.previusPaginacion)")
        if  self.previusPaginacion == nil{
            
        }else{
            self.paginacion = self.previusPaginacion!
            //  print(self.paginacion)
            updateUI()
        }
    }
    
    
    @IBAction func btnBuscar(_ sender: Any) {
        self.pokemonName = ""
        self.pokemonName = txtBuscar.text!.lowercased()
        guard txtBuscar.text != "" else {
            
            lblVacio.text =  "El campo no puede ser vacio"
            txtBuscar.layer.borderColor = UIColor.red.cgColor
            txtBuscar.layer.borderWidth = 2
            return
        }
        if txtBuscar.text! == ""{
            
            self.updateUI()
        }else{
            
            lblVacio.text =  ""
            txtBuscar.layer.borderColor = UIColor.black.cgColor
            txtBuscar.layer.borderWidth = 2
            
            PokemonViewModel.GetByName(namePokemon: self.pokemonName) { result, error in
                self.pokemonsList.removeAll()
                
                if let resultSource = result {
                    DispatchQueue.main.async{
                        var objpoke = Results()
                        objpoke.name = result?.name
                        self.id = String(result!.id!)
                        var url1 : String = "https://pokeapi.co/api/v2/pokemon/\(self.id)"
                        objpoke.url = url1
                        self.pokemonsList.append(objpoke)
                        self.collectionPokemon.reloadData()
                        
                    }
                }
            }
        }
    }
}

extension PokemonController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.pokemonsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as! pokemonCell
        
        self.text = pokemonsList[indexPath.row].url!
        
        let textId = self.text.split(separator: "/")
        // print(textId.last!)
        let imageURLString = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(textId.last!).png"
        self.url = imageURLString
        
        
        
        UIImage.loadImageFromURL(imageURLString) { (image) in
            if let image = image {
                
                cell.ImageView.image = image
                
            } else {
                print("No se cargó la imagen")
            }
        }
        pokemonsList[indexPath.row].url
        //        cell.lblNombre.text = "#\(textId.last!) \(pokemonsList[indexPath.row].name!)"
        cell.lblNombre.text = pokemonsList[indexPath.row].name!
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.pokemonName = self.pokemonsList[indexPath.row].name!
        self.performSegue(withIdentifier: "SegueDetalle", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueDetalle" {
            let formControl = segue.destination as! DetalleController
            formControl.pokemonName = self.pokemonName
            formControl.url = self.url
            
        }
        
    }
}

extension UIImage {
    static func loadImageFromURL(_ urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                completion(image)
            }
        }.resume()
    }
}
