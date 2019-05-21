//
//  MainViewController.swift
//  Recipes
//
//  Created by Jordan Davis on 5/20/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        networkClient.fetchRecipes { (recipes, error) in
            if let error = error {
                NSLog("Error loading recipes from file: \(String(describing: error))")
                return
            }
           
        DispatchQueue.main.async {
            if let recipes = recipes {
                self.allRecipes = recipes
            }
        }
    }
}
    
    //MARK: -Actions

    @IBAction func textField(_ sender: Any) {
        resignFirstResponder()
        filterRecipes()
    }
    
    //MARK: - Functions
    
    private func filterRecipes() {
        guard let searchTerm = textField.text, !searchTerm.isEmpty else {
            filteredRecipes = allRecipes
            return
        }
        filteredRecipes = allRecipes.filter {
            $0.name.contains(searchTerm) || $0.instructions.contains(searchTerm)
        
        }
    }
    
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToRecipes" {
            let recipesVC = segue.destination as! RecipesTableViewController
            recipesTableViewController = recipesVC
        }
    }
    
    
    
    //MARK: - Properties
    
    var allRecipes: [Recipe] = [] {
        didSet {
            filterRecipes()
        }
    }
    var filteredRecipes: [Recipe] = [] {
        didSet {
            recipesTableViewController?.recipes = filteredRecipes
        }
    }
    
    let networkClient = RecipesNetworkClient()
    
    var recipesTableViewController: RecipesTableViewController? {
        didSet {
            recipesTableViewController?.recipes = filteredRecipes
        }
    }
    
    
    @IBOutlet var textField: UITextField!
    
    
}
