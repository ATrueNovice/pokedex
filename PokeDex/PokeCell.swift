//
//  PokeCell.swift
//  PokeDex
//
//  Created by New on 3/6/17.
//  Copyright © 2017 HSI. All rights reserved.
//

import UIKit


class PokeCell: UICollectionViewCell {

    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!

    //Inherits from the Pokemon Swift file
    var pokemon: Pokemon!

    //This code rounds the corners of the cells

    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)

        layer.cornerRadius = 5.0
    }


    //This method configures the cell.
    func configureCell (_ pokemon: Pokemon) {
        self.pokemon = pokemon

        nameLbl.text = self.pokemon.name.capitalized
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")


    }
}
