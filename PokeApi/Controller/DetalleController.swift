//
//  DetalleController.swift
//  PokeApi
//
//  Created by Jair Montes on 25/06/23.
//

import UIKit

class DetalleController: UIViewController {
    
    var pokemonName : String = ""
    var url : String = ""
    //    var Stat = Specs<Stats>(stats: [], types: [])
    var pokemonStats : [Stats] = []
    var pokemonTypes : [Types] = []
    //    let colors: [String: UIColor] = ["normal": UIColor(named: "normal")!]
    
    private let PokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "imagedefault" )
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        
        imageView.layer.cornerRadius = 150
        imageView.layer.borderWidth = 10
        imageView.layer.borderColor = UIColor.blue.cgColor
        
        return imageView
    }()
    
    private let lblNombre : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .blue
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.blue.cgColor
        return label

    }()
//    private let lblNombre : UILabel = {
//            let lblNombre = UILabel()
//            lblNombre.numberOfLines = 0
//            lblNombre.textAlignment = .center
////            lblNombre.text = "Elemento"
//            lblNombre.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
//            lblNombre.translatesAutoresizingMaskIntoConstraints = false
//            // lblNombre.backgroundColor = UIColor.red
//            lblNombre.layer.cornerRadius = 15
//            lblNombre.layer.masksToBounds = true
//            return lblNombre
//        }()
    
    private let lblAbilities : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Abilities"
//        label.textColor = .blue
//        label.textColor = .red
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.blue.cgColor
        return label
    }()
    
    private let lblHp : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .systemCyan
        label.text = "Hp"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lblAttack : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .systemCyan
        label.text = "Attack"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lblDefense : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .systemCyan
        label.text = "Defense"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lblSepcialAttack : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .purple
        label.text = "SepcialAttack"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lblSepcialDefense : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .purple
        label.text = "SepcialDefense"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lblTipo : UILabel = {
        let lblNombre = UILabel()
        lblNombre.numberOfLines = 0
        lblNombre.textAlignment = .center
        lblNombre.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
        lblNombre.translatesAutoresizingMaskIntoConstraints = false
        // lblNombre.backgroundColor = UIColor.red
        lblNombre.layer.cornerRadius = 15
        lblNombre.layer.masksToBounds = true
        lblNombre.layer.borderWidth = 3
        lblNombre.layer.borderColor = UIColor.blue.cgColor
        return lblNombre
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        lblNombre.text = String(pokemonName)
        
        
        view.addSubview(lblNombre)
        
        view.addSubview(lblAbilities)
        view.addSubview(PokemonImageView)
        view.addSubview(lblNombre)
        view.addSubview(lblHp)
        view.addSubview(lblAttack)
        view.addSubview(lblDefense)
        view.addSubview(lblSepcialAttack)
        view.addSubview(lblSepcialDefense)
        view.addSubview(lblTipo)
        
        NSLayoutConstraint.activate([
            PokemonImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            PokemonImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            PokemonImageView.widthAnchor.constraint(equalToConstant: 300),
            PokemonImageView.heightAnchor.constraint(equalToConstant: 300),
            //            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            //            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            lblNombre.bottomAnchor.constraint(equalTo: PokemonImageView.bottomAnchor, constant: 45),
//            lblNombre.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            lblNombre.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            //            lblNombre.bottomAnchor.constraint(equalTo: lblAbilities.bottomAnchor, constant: 45),
            //            lblNombre.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //            lblNombre.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            lblNombre.bottomAnchor.constraint(equalTo: PokemonImageView.bottomAnchor, constant: 45),
            lblNombre.leftAnchor.constraint(equalTo: view.leftAnchor),
            lblNombre.centerXAnchor.constraint(equalTo: view.centerXAnchor),        lblAbilities.bottomAnchor.constraint(equalTo: lblNombre.bottomAnchor, constant: 45),
            lblAbilities.leftAnchor.constraint(equalTo: view.leftAnchor),
            lblAbilities.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lblHp.bottomAnchor.constraint(equalTo: lblAbilities.bottomAnchor, constant: 45),
            lblHp.leftAnchor.constraint(equalTo: view.leftAnchor),
            lblHp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblAttack.bottomAnchor.constraint(equalTo: lblHp.bottomAnchor, constant: 45),
            lblAttack.leftAnchor.constraint(equalTo: view.leftAnchor),
            lblAttack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblDefense.bottomAnchor.constraint(equalTo: lblAttack.bottomAnchor, constant: 45),
            lblDefense.leftAnchor.constraint(equalTo: view.leftAnchor),
            lblDefense.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblSepcialAttack.bottomAnchor.constraint(equalTo: lblDefense.bottomAnchor, constant: 45),
            lblSepcialAttack.leftAnchor.constraint(equalTo: view.leftAnchor),
            lblSepcialAttack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblSepcialDefense.bottomAnchor.constraint(equalTo: lblSepcialAttack.bottomAnchor, constant: 45),
            lblSepcialDefense.leftAnchor.constraint(equalTo: view.leftAnchor),
            lblSepcialDefense.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblTipo.bottomAnchor.constraint(equalTo: lblSepcialDefense.bottomAnchor, constant: 45),
            lblTipo.leftAnchor.constraint(equalTo: view.leftAnchor),
            lblTipo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
        
        updateUI()
        
        //        PokemonViewModel.Stat(url: url) { result, error in
        //            if let resultSource = result{
        //                self.Stat = resultSource
        //                DispatchQueue.main.async {
        //                    self.lblHp.text = "Hp: \((self.Stat.stats[0].base_stat?.description)!)"
        //                    self.lblAttack.text = "Attack: \((self.Stat.stats[1].base_stat?.description)!)"
        //                    self.lblDefense.text = "Defense: \((self.Stat.stats[2].base_stat?.description)!)"
        //                    self.lblSepcialAttack.text = "SepcialAttack: \((self.Stat.stats[3].base_stat?.description)!)"
        //                    self.lblSepcialDefense.text = "SepcialDefense: \((self.Stat.stats[4].base_stat?.description)!)"
        //                    self.lblSpeed.text = "Speed: \((self.Stat.stats[5].base_stat?.description)!)"
        //
        //
        //                }
        //            }
        //        }
        
        
        
        func updateUI(){
            PokemonViewModel.GetByName(namePokemon: self.pokemonName ) { result, error in
                DispatchQueue.main.async{
                    if result! != nil {
                        var pokemon = Pokemon()
                        pokemon.id = result?.id
                        pokemon.name = result?.name
                        pokemon.height = result?.height
                        pokemon.weight = result?.weight
                        pokemon.sprites?.front_shiny = result?.sprites?.front_shiny
                        pokemon.sprites?.front_shiny = result?.sprites?.front_default
                        
                        
                        for objPoke in result!.stats!{
                            let pokeStat = objPoke as Stats
                            self.pokemonStats.append(pokeStat)
                        }
                        
                        for objPoke in result!.types!{
                            let pokeType = objPoke as! Types
                            self.pokemonTypes.append(pokeType)
                        }
                        
                        let imageURLString = "\(result!.sprites!.front_default!)"
                        UIImage.loadImageFromURL(imageURLString) { [self] (image) in
                            if let image = image {
                                // La imagen se cargó exitosamente desde la URL
                                // self.imageView.image = image
                                self.PokemonImageView.image = image
                                
                                
                            } else {
                                print("error al cargar la imagen")
                            }
                            let imageURLString = "\(result!.sprites!.front_shiny!)"
                            UIImage.loadImageFromURL(imageURLString) { [self] (image) in
                                if let image = image {
                                    // La imagen se cargó exitosamente desde la URL
                                    
                                    self.PokemonImageView.image = image
                                    
                                    
                                } else {
                                    print("error al cargar la imagen")
                                }
                                self.lblNombre.text = result?.name
                                self.lblHp.text = "  \(self.pokemonStats[0].stat!.name!) : \(self.pokemonStats[0].base_stat!)"
                                self.lblDefense.text = "  \(self.pokemonStats[1].stat!.name!) : \(self.pokemonStats[1].base_stat!)"
                                self.lblAttack.text = "  \(self.pokemonStats[2].stat!.name!) : \(self.pokemonStats[2].base_stat!)"
                                self.lblSepcialAttack.text = "  \(self.pokemonStats[3].stat!.name!) : \(self.pokemonStats[3].base_stat!)"
                                self.lblSepcialDefense.text = "  \(self.pokemonStats[4].stat!.name!) : \(self.pokemonStats[4].base_stat!)"
                                self.lblTipo.text = "Tipo: \(self.pokemonTypes[0].type!.name!)"
//                                self.lblSpeed.text = "Speed: \((self.Stat.stats[5].base_stat?.description)!)"
                                
                                //                                  if let color = colors[self.pokemonTypes[0].type!.name!]{
                                //                                                                 DispatchQueue.main.async {
                                //                                                                     self.lblTipo.backgroundColor = color
                                //                                                                     self.lblNombre.backgroundColor = color
                                //                                                                     self.PokemonImageView.backgroundColor = color
                                if self.pokemonTypes[0].type!.name! == "normal"{
                                    //                                  view.backgroundColor = .green
                                    self.lblNombre.backgroundColor = .systemPink
                                    self.lblTipo.backgroundColor = .systemPink
                                    self.lblAbilities.backgroundColor = .systemPink
                                    self.PokemonImageView.backgroundColor = .systemPink
                                    self.lblTipo.textColor = .white
                                    self.lblNombre.textColor = .white
                                    self.lblAbilities.textColor = .white
                                }
                                
                                if self.pokemonTypes[0].type!.name! == "grass"{
                                                                    //                                  view.backgroundColor = .green
                                    self.lblNombre.backgroundColor = .green
                                    self.lblTipo.backgroundColor = .green
                                    self.lblAbilities.backgroundColor = .green
                                    self.PokemonImageView.backgroundColor = .green
                                    self.lblTipo.textColor = .red
                                    self.lblNombre.textColor = .black
                                    self.lblAbilities.textColor = .red
                                                                }
                                if self.pokemonTypes[0].type!.name! == "fighting"{
                                                                    //                                  view.backgroundColor = .green
                                    self.lblNombre.backgroundColor = .blue
                                    self.lblTipo.backgroundColor = .blue
                                    self.lblAbilities.backgroundColor = .blue
                                    self.PokemonImageView.backgroundColor = .blue
                                    self.lblTipo.textColor = .white
                                    self.lblNombre.textColor = .white
                                    self.lblAbilities.textColor = .white
                                    self.lblNombre.layer.borderColor = UIColor.green.cgColor
                                    self.lblTipo.layer.borderColor = UIColor.green.cgColor
                                    self.lblAbilities.layer.borderColor = UIColor.green.cgColor
                                    self.PokemonImageView.layer.borderColor = UIColor.green.cgColor
                                                                }
                                if self.pokemonTypes[0].type!.name! == "flying"{
                                                                    //                                  view.backgroundColor = .green
                                    self.lblNombre.backgroundColor = .purple
                                    self.lblTipo.backgroundColor = .purple
                                    self.lblAbilities.backgroundColor = .purple
                                    self.PokemonImageView.backgroundColor = .purple
                                                                }
                                if self.pokemonTypes[0].type!.name! == "poison"{
                                                                    //                                  view.backgroundColor = .green
                                    self.lblNombre.backgroundColor = .black
                                    self.lblTipo.backgroundColor = .black
                                    self.lblAbilities.backgroundColor = .black
                                    self.PokemonImageView.backgroundColor = .black
                                    self.lblTipo.textColor = .white
                                    self.lblNombre.textColor = .white
                                    self.lblAbilities.textColor = .white
                                                                }
                                if self.pokemonTypes[0].type!.name! == "ground"{
                                                                    //                                  view.backgroundColor = .green
                                    self.lblNombre.backgroundColor = .clear
                                    self.lblTipo.backgroundColor = .clear
                                    self.lblAbilities.backgroundColor = .clear
                                    self.PokemonImageView.backgroundColor = .clear
                                                                }
                                if self.pokemonTypes[0].type!.name! == "rock"{
                                                                    //                                  view.backgroundColor = .green
                                    self.lblNombre.backgroundColor = .cyan
                                    self.lblTipo.backgroundColor = .cyan
                                    self.lblAbilities.backgroundColor = .cyan
                                    self.PokemonImageView.backgroundColor = .cyan
                                                                }
                                if self.pokemonTypes[0].type!.name! == "bug"{
                                                                    //                                  view.backgroundColor = .green
                                    self.lblNombre.backgroundColor = .gray
                                    self.lblTipo.backgroundColor = .gray
                                    self.lblAbilities.backgroundColor = .gray
                                    self.PokemonImageView.backgroundColor = .gray
                                    self.lblTipo.textColor = .white
                                    self.lblNombre.textColor = .white
                                    self.lblAbilities.textColor = .white
                                                                }
                                if self.pokemonTypes[0].type!.name! == "ghost"{
                                                                    //                                  view.backgroundColor = .green
                                    self.lblNombre.backgroundColor = .systemIndigo
                                    self.lblTipo.backgroundColor = .systemIndigo
                                    self.lblAbilities.backgroundColor = .systemIndigo
                                    self.PokemonImageView.backgroundColor = .systemIndigo
                                    self.lblTipo.textColor = .white
                                    self.lblNombre.textColor = .white
                                    self.lblAbilities.textColor = .white
                                                                }
                                if self.pokemonTypes[0].type!.name! == "steel"{
                                                                    //                                  view.backgroundColor = .green
                                    self.lblNombre.backgroundColor = .systemMint
                                    self.lblTipo.backgroundColor = .systemMint
                                    self.lblAbilities.backgroundColor = .systemMint
                                    self.PokemonImageView.backgroundColor = .systemMint
                                                                }
                                if self.pokemonTypes[0].type!.name! == "fire"{
                                    
                                    self.lblNombre.backgroundColor = .orange
                                    self.lblTipo.backgroundColor = .orange
                                    self.lblAbilities.backgroundColor = .orange
                                    self.PokemonImageView.backgroundColor = .orange
                                    self.lblTipo.textColor = .white
                                    self.lblNombre.textColor = .white
                                    self.lblAbilities.textColor = .white
                                }
                                if self.pokemonTypes[0].type!.name! == "water"{
                                                            
                                    self.lblNombre.backgroundColor = .systemTeal
                                    self.lblTipo.backgroundColor = .systemTeal
                                    self.lblAbilities.backgroundColor = .systemTeal
                                    self.PokemonImageView.backgroundColor = .systemTeal
                                    self.lblTipo.textColor = .white
                                    self.lblNombre.textColor = .white
                                    self.lblAbilities.textColor = .white
                                                                }
                                if self.pokemonTypes[0].type!.name! == "electric"{
                                                            
                                    self.lblNombre.backgroundColor = .yellow
                                    self.lblTipo.backgroundColor = .yellow
                                    self.lblAbilities.backgroundColor = .yellow
                                    self.PokemonImageView.backgroundColor = .yellow
                                                                }
                                if self.pokemonTypes[0].type!.name! == "psychic"{
                                                            
                                    self.lblNombre.backgroundColor = .red
                                    self.lblTipo.backgroundColor = .red
                                    self.lblAbilities.backgroundColor = .red
                                    self.PokemonImageView.backgroundColor = .red
                                    self.lblTipo.textColor = .white
                                    self.lblNombre.textColor = .white
                                    self.lblAbilities.textColor = .white
                                                                }
                                if self.pokemonTypes[0].type!.name! == "ice"{
                                                            
                                    self.lblNombre.layer.borderColor = UIColor.systemTeal.cgColor
                                    self.lblTipo.layer.borderColor = UIColor.systemTeal.cgColor
                                    self.lblAbilities.layer.borderColor = UIColor.systemTeal.cgColor
                                    self.PokemonImageView.layer.borderColor = UIColor.systemTeal.cgColor
                                                                }
                                if self.pokemonTypes[0].type!.name! == "dragon"{
                                                            
                                    self.lblNombre.layer.borderColor = UIColor.red.cgColor
                                    self.lblTipo.layer.borderColor = UIColor.red.cgColor
                                    self.lblAbilities.layer.borderColor = UIColor.red.cgColor
                                    self.PokemonImageView.layer.borderColor = UIColor.red.cgColor
                                                                }
                                if self.pokemonTypes[0].type!.name! == "dark"{
                                                            
                                    self.lblNombre.layer.borderColor = UIColor.black.cgColor
                                    self.lblTipo.layer.borderColor = UIColor.black.cgColor
                                    self.lblAbilities.layer.borderColor = UIColor.black.cgColor
                                    self.PokemonImageView.layer.borderColor = UIColor.black.cgColor
                                                                }
                                if self.pokemonTypes[0].type!.name! == "fairy"{
                                                            
                                    self.lblNombre.layer.borderColor = UIColor.systemPink.cgColor
                                    self.lblTipo.layer.borderColor = UIColor.systemPink.cgColor
                                    self.lblAbilities.layer.borderColor = UIColor.systemPink.cgColor
                                    self.PokemonImageView.layer.borderColor = UIColor.systemPink.cgColor
                                                                }
                                if self.pokemonTypes[0].type!.name! == "unknown"{
                                                            
                                    self.lblNombre.layer.borderColor = UIColor.orange.cgColor
                                    self.lblTipo.layer.borderColor = UIColor.orange.cgColor
                                    self.lblAbilities.layer.borderColor = UIColor.orange.cgColor
                                    self.PokemonImageView.layer.borderColor = UIColor.orange.cgColor
                                                                }
                                if self.pokemonTypes[0].type!.name! == "shadow"{
                                                            
                                    self.lblNombre.layer.borderColor = UIColor.systemIndigo.cgColor
                                    self.lblTipo.layer.borderColor = UIColor.systemIndigo.cgColor
                                    self.lblAbilities.layer.borderColor = UIColor.systemIndigo.cgColor
                                    self.PokemonImageView.layer.borderColor = UIColor.systemIndigo.cgColor
                                                                }
                                
                                //                                                                 }
                                //                                                             }
                                //
                            }
                        }
                    }
                    
                }
            }
        }
    }
}





