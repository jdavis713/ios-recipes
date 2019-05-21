//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by Jordan Davis on 5/20/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

    }
    
    //MARK: - Functions
    
    func updateViews() {
        guard isViewLoaded,
            let recipe = recipe else { return }
        recipeLabel.text = recipe.name
        recipeTextView.text = recipe.instructions
    }
    
    
    //MARK: - Properties
    
    var recipe: Recipe? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet var recipeLabel: UILabel!
    @IBOutlet var recipeTextView: UITextView!
    

}
