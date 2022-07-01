//
//  ViewController.swift
//  Lab2
//
//  Created by Shane Canfield on 6/24/22.
//

import UIKit


class ViewController: UIViewController, UIColorPickerViewControllerDelegate {
    
    @IBOutlet weak var nicknameButton: UIButton!
    @IBOutlet weak var animalImage: UIImageView!
    
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var petView: UIView!
    
    @IBOutlet weak var dogButton: UIButton!
    
    @IBOutlet weak var catButton: UIButton!
    @IBOutlet weak var birdButton: UIButton!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var bunnyButton: UIButton!
    
    @IBOutlet weak var feedButton: UIButton!
    @IBOutlet weak var fishButton: UIButton!
    @IBOutlet weak var happinessBar: DisplayView!
    @IBOutlet weak var happinessLevel: UILabel!
    @IBOutlet weak var foodLevel: UILabel!
    @IBOutlet weak var foodBar: DisplayView!
    
    
    //Holds current animal
    var chosenAnimal: Animal!
    
    //Declare each pet
    var petDog: Animal!
    var petCat: Animal!
    var petBird: Animal!
    var petBunny: Animal!
    var petFish: Animal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Allow variable button titles
        nicknameButton.titleLabel?.adjustsFontSizeToFitWidth = true
        nicknameButton.titleLabel?.minimumScaleFactor = 0.5
        
        //Preloads animals
        petDog = Animal(name: .dog, bgColor: UIColor.red, image: UIImage(named: "pet_images/dog@2x")!)
        petCat = Animal(name: .cat, bgColor: UIColor.blue, image: UIImage(named: "pet_images/cat@2x.png")!)
        petBird = Animal(name: .bird, bgColor: UIColor.yellow, image: UIImage(named: "pet_images/bird@2x.png")!)
        petBunny = Animal(name: .bunny, bgColor: UIColor.green, image: UIImage(named: "pet_images/bunny@2x.png")!)
        petFish = Animal(name: .fish, bgColor: UIColor.purple, image: UIImage(named: "pet_images/fish@2x.png")!)
        // Do any additional setup after loading the view.
        chosenAnimal = petDog
        setNewAnimal()
        
    }
    
    
    @IBAction func pressPlay(_ sender: Any) {

        chosenAnimal.playAnimal()
        
        if chosenAnimal.foodLevel != 0 {
            print("Played with animal")
        } else {
            print("Feed animal before you can play.")
        }
        updateMoodBars()
    }
    
    @IBAction func pressFeed(_ sender: Any) {
        chosenAnimal.feedAnimal()
        updateMoodBars()
    }
    
    
    @IBAction func changePet(_ sender: UIButton!) {
        
        let changeTo: String = sender.currentTitle!
        let petType = Animal.Pets(rawValue: changeTo)
        
        switch petType!{
            case .dog:
                chosenAnimal = petDog
            case .cat:
                chosenAnimal = petCat
            case .bird:
                chosenAnimal = petBird
            case .bunny:
                chosenAnimal = petBunny
            case .fish:
                chosenAnimal = petFish
        }
        setNewAnimal()
        
    }
    func setNewAnimal(){
        
        petView.backgroundColor = chosenAnimal.bgColor
        animalImage.image = chosenAnimal.image
        happinessBar.color = chosenAnimal.bgColor
        foodBar.color = chosenAnimal.bgColor
        updateNickname(nickname: chosenAnimal.nickname)
        updateMoodBars()
        
    }

    func updateNickname(nickname: String){
        nicknameButton.setTitle(nickname, for: .normal)
    }
    
    func updateMoodBars(){
        happinessBar.animateValue(to: CGFloat(Double(chosenAnimal.happinessLevel)/10))
        happinessLevel.text = "played: " + String(chosenAnimal.timesPlayedWith)
        
        foodBar.animateValue(to: CGFloat(Double(chosenAnimal.foodLevel)/10))
        foodLevel.text = "fed: " + String(chosenAnimal.timesFed)
    }
    
    @IBAction func changeNickname(_ sender: Any) {
        let alert = UIAlertController(title: "Nickname", message: "Please enter new nickname", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Type nickname  here"
        }

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            let nickname = textField?.text ?? "Name"
            self.chosenAnimal.changeNickname(name: nickname)
            self.updateNickname(nickname: nickname)
        }))

        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func changeBackgrndColor(_ sender: Any) {
        
        let colorPickerVC = UIColorPickerViewController()
            colorPickerVC.delegate = self
            present(colorPickerVC, animated: true)
        
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        
        let color = viewController.selectedColor
        chosenAnimal.bgColor = color
        setNewAnimal()
        
    }
    
}
   
