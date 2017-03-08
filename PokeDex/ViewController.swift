//
//  ViewController.swift
//  PokeDex
//
//  Created by New on 2/21/17.
//  Copyright © 2017 HSI. All rights reserved.
//

import UIKit

//Delegate = We will be making changes on behalf of the UI View, DataSource = THis is where data will originate,  DelegateFlowLayout = Modify and set layout for collection view

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //This is needed to manipulate the collection view. Remember Weak Var changes.
    @IBOutlet weak var collection: UICollectionView!

    var pokemon = [Pokemon]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        collection.dataSource = self
        collection.delegate = self

        parsePokemonCSV()
    }


    func parsePokemonCSV() {

            //creates the path to the csv file
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!

        do {

            //Using the parsing file to pull out each row
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            print(rows)

            for row in rows  {

                //Pulll the poke id and name
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!


                // The object poke is attached to the array with the name and the id number.
                let poke = Pokemon(name: name, pokedexId: pokeId)
                pokemon.append(poke)
            }

        } catch  let err  as NSError {
            print(err.debugDescription)
        }

    }

        //Deques the cells and sets them up
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            // Deque ReUsable cell loads the exact number of items to be displayed at a time. Else, return an empty cell
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {

            // Each time the cell is called,
            let poke = pokemon[indexPath.row]

            //Receives the data from the configure cell function that we've created before from the pokecell page
            
            cell.configureCell(poke)
            
            return cell

        } else {

            return UICollectionViewCell()
        }
    }

        //Executes code when cell is tapped
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }

        //Returns number of items in the section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1

    }

        //Sets the hight and width of all cells in collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }

}

