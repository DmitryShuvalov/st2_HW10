//
//  DetailedViewController.swift
//  st2_HW10
//
//  Created by qwerty on 25.03.2020.
//  Copyright © 2020 Dmitry Shuvalov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var currentHero: Hero!
    
    @IBOutlet var heroImage: UIImageView!
    
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var originLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    private func updateUI() {
        nameLabel.text = currentHero.name
        statusLabel.text = currentHero.status
        genderLabel.text = currentHero.gender
        speciesLabel.text = currentHero.species
        originLabel.text = currentHero.origin?.name
        locationLabel.text = currentHero.location?.name
        
        DispatchQueue.main.async {
            guard let url = URL(string: self.currentHero.image ?? "") else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            guard let image = UIImage(data: data) else { return }
            self.heroImage.image = image

        }

        
    }
}
