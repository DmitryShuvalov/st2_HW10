//
//  HeroCell.swift
//  st2_HW10
//
//  Created by qwerty on 24.03.2020.
//  Copyright © 2020 Dmitry Shuvalov. All rights reserved.
//

import UIKit

class HeroCell: UITableViewCell {

    @IBOutlet var heroImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var idLabel: UILabel!
    
    func configure(with hero: Hero) {
        
        nameLabel.text = hero.name
        speciesLabel.text = hero.species
        genderLabel.text = hero.gender
        locationLabel.text = hero.location?.name
        idLabel.text = "#\(hero.id ?? 0)"
       
        backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        
        heroImage.layer.cornerRadius = heroImage.bounds.width / 2
        
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: hero.image ?? "") else { return }
            guard let dataImage = try? Data(contentsOf: imageUrl) else { return }

            DispatchQueue.main.async {
                self.heroImage.image = UIImage(data: dataImage)
            }
            
        }
    }
  
}
