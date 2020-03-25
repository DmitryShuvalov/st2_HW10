//
//  ViewController.swift
//  st2_HW10
//
//  Created by qwerty on 24.03.2020.
//  Copyright © 2020 Dmitry Shuvalov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = #imageLiteral(resourceName: "RickAndMorty")
        backgroundImage.contentMode = .scaleToFill
        self.view.insertSubview(backgroundImage, at: 0)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowHeroes" {
            let heroesVC = segue.destination as! HeroesViewController
            heroesVC.fetchData()
        }
        
    }

    @IBAction func startButtonAction() {
        performSegue(withIdentifier: "ShowHeroes", sender: self)
    }
    
}


