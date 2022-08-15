//
//  CreateMealViewController.swift
//  hungr
//
//  Created by Joel Maldonado on 8/11/22.
//

import UIKit

class CreateMealViewController: UIViewController {
    let scrollView = UIScrollView()
    let nameTF = UITextField()
    let imageTF = UITextField()
    let instructionsTF = UITextView()
    var ingredients = [(UITextField, UITextField)]()
    let addIngredientButton = UIButton()
    let saveButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .Background
        configureViews()
        addSubviews()
        layoutConstraints()
        addIngredientField()
        
        DispatchQueue.main.async {
            self.appendScrollViewContentHeight(by: self.nameTF.bounds.height * 2 + self.instructionsTF.bounds.height + 75)
        }
    }
    
    func configureViews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .Background
        scrollView.isUserInteractionEnabled = true
        scrollView.isScrollEnabled = true
        
        nameTF.translatesAutoresizingMaskIntoConstraints = false
        nameTF.borderStyle = .roundedRect
        nameTF.placeholder = "Meal Name"
        
        imageTF.translatesAutoresizingMaskIntoConstraints = false
        imageTF.borderStyle = .roundedRect
        imageTF.placeholder = "Image URL"
        
        instructionsTF.translatesAutoresizingMaskIntoConstraints = false
        instructionsTF.font = UIFont.systemFont(ofSize: 17)
        instructionsTF.layer.borderColor = .init(gray: 1, alpha: 0.5)
        instructionsTF.layer.borderWidth = 2
        instructionsTF.layer.cornerRadius = 5
        
        addIngredientButton.translatesAutoresizingMaskIntoConstraints = false
        addIngredientButton.setTitle("Add Ingredient", for: .normal)
        addIngredientButton.backgroundColor = .AccentOne
        addIngredientButton.setTitleColor(.TextColor, for: .normal)
        addIngredientButton.addTarget(self, action: #selector(addIngredientTapped), for: .touchUpInside)
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Save Meal", for: .normal)
        saveButton.backgroundColor = .AccentOne
        saveButton.setTitleColor(.TextColor, for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    func addSubviews() {
        view.addSubview(scrollView)
            scrollView.addSubview(nameTF)
            scrollView.addSubview(imageTF)
            scrollView.addSubview(instructionsTF)
        view.addSubview(addIngredientButton)
        view.addSubview(saveButton)
    }
    
    func layoutConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: addIngredientButton.topAnchor, constant: -20),
            
            nameTF.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            nameTF.topAnchor.constraint(equalTo: scrollView.topAnchor),
            nameTF.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageTF.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: 10),
            imageTF.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            instructionsTF.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            instructionsTF.topAnchor.constraint(equalTo: imageTF.bottomAnchor, constant: 10),
            instructionsTF.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            instructionsTF.heightAnchor.constraint(equalToConstant: 250),
            
            addIngredientButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            addIngredientButton.bottomAnchor.constraint(equalTo: saveButton.bottomAnchor),
            addIngredientButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5, constant: -30),
            
            saveButton.leadingAnchor.constraint(equalTo: addIngredientButton.trailingAnchor, constant: 10),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            saveButton.widthAnchor.constraint(equalTo: addIngredientButton.widthAnchor)
        ])
    }
    
    func addIngredientField() {
        // Create/Configure ingredient text field, and add as subview to scrollView
        let ingredientTF = UITextField()
        ingredientTF.translatesAutoresizingMaskIntoConstraints = false
        ingredientTF.borderStyle = .roundedRect
        ingredientTF.placeholder = "Ingredient Name"
        scrollView.addSubview(ingredientTF)
        
        // Create/Configure amount text field, and add as subview to scrollView
        let amountTF = UITextField()
        amountTF.translatesAutoresizingMaskIntoConstraints = false
        amountTF.borderStyle = .roundedRect
        amountTF.placeholder = "Amount (eg. 1 tbsp)"
        scrollView.addSubview(amountTF)
        
        // Layout constraints for the ingredient & amount TextFields
        NSLayoutConstraint.activate([
            ingredientTF.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            ingredientTF.topAnchor.constraint(equalTo: ingredients.count > 0 ? ingredients[ingredients.count - 1].0.bottomAnchor : instructionsTF.bottomAnchor, constant: 10),
            ingredientTF.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5, constant: -5),
            
            amountTF.leadingAnchor.constraint(equalTo: ingredientTF.trailingAnchor, constant: 10),
            amountTF.topAnchor.constraint(equalTo: ingredientTF.topAnchor),
            amountTF.widthAnchor.constraint(equalTo: ingredientTF.widthAnchor),
        ])
        
        ingredients.append((ingredientTF, amountTF))
    }
    
    func appendScrollViewContentHeight(by amount: CGFloat) {
            self.scrollView.contentSize.height += amount
    }

    @objc func addIngredientTapped() {
        addIngredientField()
        DispatchQueue.main.async {
            self.appendScrollViewContentHeight(by: self.nameTF.bounds.height + 10)
        }
    }
    
    @objc func saveButtonTapped() {
        guard let name = nameTF.text, let instructions = instructionsTF.text, let imageURL = imageTF.text, name != "", instructions != "" else {
            return
        }
        
        var convertedIngredients: [Meal.Ingredient] = ingredients.map {
            if let name = $0.0.text, let amount = $0.1.text {
                return Meal.Ingredient(name: name, amount: amount)
            }
            
            return Meal.Ingredient(name: "", amount: "")
        }
        
        convertedIngredients = convertedIngredients.filter {
            $0.name != ""
        }
        
        let mealToSave = Meal(id: "", name: name, instructions: instructions, imageURL: imageURL, ingredients: convertedIngredients)
        
        print(mealToSave)
        
        DataManager.shared.saveMeal(type: .custom, meal: mealToSave)
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
