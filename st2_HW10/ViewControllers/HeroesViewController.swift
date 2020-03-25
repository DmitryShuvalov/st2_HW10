//
//  HeroesViewController.swift
//  st2_HW10
//
//  Created by qwerty on 24.03.2020.
//  Copyright © 2020 Dmitry Shuvalov. All rights reserved.
//

import UIKit

class HeroesViewController: UITableViewController {
    
    private var heroes: [Hero] = []
    private let apiHeroesUrl = "https://rickandmortyapi.com/api/character/"

    override func viewDidLoad() {
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroCell
          cell.configure(with: heroes[indexPath.row])
           
           return cell
       }
    
       func fetchData() {
           guard let url = URL(string: apiHeroesUrl) else {return}
           
           URLSession.shared.dataTask(with: url) { (data, _, _) in
               guard let data = data else {return}
               do {
                   let heroesFull = try JSONDecoder().decode(Heroes.self, from: data)
                   self.heroes = heroesFull.results!
                   print(self.heroes)
               } catch let error {
                   print(error)
               }
               
           }.resume()
    
       }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let detailVC = segue.destination as! DetailViewController
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            detailVC.currentHero = heroes[indexPath.row]
        }
    }



}
