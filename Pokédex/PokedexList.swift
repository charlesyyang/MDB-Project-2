//
//  PokedexListVC.swift
//  Pokédex
//
//  Created by Charles Yang on 9/19/19.
//  Copyright © 2019 Charles Yang. All rights reserved.
//

import UIKit

class PokedexListVC: UITableViewController {
    
    var displayedPoke: [Pokemon] = []
    var pokeList: [Pokemon] = []
    var minAttack: Int = 0
    var minHealth: Int = 0
    var minDefense: Int = 0
    var currPokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        loadPokemon()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    func loadPokemon() {
        if let path = Bundle.main.path(forResource: "pokeData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [Pokemon] {
                    pokeList = jsonResult
                }
            } catch {
                // handle error
            }
        }
    }
    
    func setupNavBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! PokemonCellTableViewCell

        // Configure the cell...
        let pokemon = pokeList[indexPath.row]
        cell.pokemonName.text = pokemon.name
        guard let url = URL(string: pokemon.imageUrl) else { return cell }
        let data = try! Data(contentsOf: url)
        //let image = UIImage(data: data)
        /*
        guard let imageURL = pokemon.imageUrl as? URL else {
            return cell
        }
        let data = try! Data(contentsOf: imageURL)
         */
        cell.pokemonImage.image = UIImage(data: data)
        cell.pokemonType1.text = pokemon.types[1]
        cell.pokemonType2.text = pokemon.types[2]
        
        return cell
    }
 

    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 
    }
    
    
    //When a certain cell is tapped this gets called
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        self.performSegue(withIdentifier: "PokemonInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! PokemonInfoVC
        
    }
}

