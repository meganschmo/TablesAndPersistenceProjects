//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by Megan Schmoyer on 10/16/23.
//

import UIKit

class FoodTableViewController: UITableViewController {
    var meals: [Meal] {
        let breakfast = Meal(name: "Breakfast", food: [Food(name: "Donuts", description: "Payson Market Fresh"), Food(name: "Waffles", description: "Gussies delicious waffles"), Food(name: "Egg's Benedict", description: "Egg's Benedict from Aroma Cafe")])
        
        let lunch = Meal(name: "Lunch", food: [Food(name: "Chicken Nuggies", description: "Dino shaped chicken nuggets"), Food(name: "Salad", description: "A good salad with hummus and pickled red onions"), Food(name: "Sandwich", description: "Specifically a turkey, bacon, avocado sandwich")])
        
        let dinner = Meal(name: "Dinner", food: [Food(name: "Ice Cream", description: "Yes, sometimes I have ice cream for dinner"), Food(name: "Steak", description: "Pretty good"), Food(name: "Pizza", description: "My hubbies favorite")])
    
            
            return [breakfast, lunch, dinner]
        }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals[section].food.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)

        var content = cell.defaultContentConfiguration()
        
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
        
        content.text = food.name
               content.secondaryText = food.description
               cell.contentConfiguration = content

        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return meals[section].name
        }


}
