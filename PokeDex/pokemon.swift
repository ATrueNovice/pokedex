//
//  pokemon.swift
//  PokeDex
//
//  Created by New on 2/21/17.
//  Copyright © 2017 HSI. All rights reserved.
//

import Foundation


class Pokemon {

    fileprivate var _name: String!
    fileprivate var _pokedexId: Int!

    //Remember, when getting information from someplace, you need getters. This passes the information from a variable to another. Variables cannot hold information by default but, it can be passsed into values to be stored.
    var name: String {
        return _name
    }

    var pokedexId: Int {
        return _pokedexId
    }


    //Initalizes each object so we can pass data. From name to _name and _pokedexId = pokedexID
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
    }
}
