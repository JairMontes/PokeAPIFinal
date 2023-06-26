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
//        label.layer.cornerRadius = 15
//        label.layer.masksToBounds = true
        return label

    }()
    
    private let lblAbilities : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Abilities"
        label.textColor = .blue
        label.textColor = .red
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
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
    
    private let lblSpeed : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .systemOrange
        label.text = "Speed"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        view.addSubview(lblSpeed)
        
        NSLayoutConstraint.activate([
            PokemonImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            PokemonImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            PokemonImageView.widthAnchor.constraint(equalToConstant: 300),
            PokemonImageView.heightAnchor.constraint(equalToConstant: 300),
            //            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            //            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblNombre.bottomAnchor.constraint(equalTo: PokemonImageView.bottomAnchor, constant: 45),
            lblNombre.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblNombre.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            //            lblNombre.bottomAnchor.constraint(equalTo: lblAbilities.bottomAnchor, constant: 45),
            //            lblNombre.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //            lblNombre.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            lblAbilities.bottomAnchor.constraint(equalTo: lblNombre.bottomAnchor, constant: 45),
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
            lblSpeed.bottomAnchor.constraint(equalTo: lblSepcialDefense.bottomAnchor, constant: 45),
            lblSpeed.leftAnchor.constraint(equalTo: view.leftAnchor),
            lblSpeed.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
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
   }
    }
    

   


