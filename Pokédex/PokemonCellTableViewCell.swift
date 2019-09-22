//
//  PokemonCellTableViewCell.swift
//  Pokédex
//
//  Created by Charles Yang on 9/19/19.
//  Copyright © 2019 Charles Yang. All rights reserved.
//

import UIKit

class PokemonCellTableViewCell: UITableViewCell {

   
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonType1: UILabel!
    @IBOutlet weak var pokemonType2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
