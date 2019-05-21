//
//  RecipesTableViewController.swift
//  Recipes
//
//  Created by Jordan Davis on 5/20/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
        let recipe = recipes[indexPath.row]
        
        cell.detailTextLabel?.text = recipe.instructions
        cell.textLabel?.text = recipe.name
        
        return cell
    }
 
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetail" {
            guard let detailVC = segue.destination as? RecipeDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else { return }
            detailVC.recipe = recipes[indexPath.row]
        }
        
    }
 

    //MARK: - Properties
    
    var recipes: [Recipe] = [] {
        didSet {
        }
    }
}
