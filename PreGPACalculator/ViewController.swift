//
//  ViewController.swift
//  PreGPACalculator
//
//  Created by Sharonda Daniels on 10/17/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gpaField: UITextField!
    
    @IBOutlet weak var degreeField: UITextField!
    
    @IBOutlet weak var courseField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        courseField.keyboardType = UIKeyboardType.numberPad
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passInfo" {
            let controller = segue.destination as! GPAViewController
            controller.numCourses = (Int(courseField.text!)!)
            controller.currentPoints = Double(gpaField.text!)! * Double(degreeField.text!)!
            controller.submittedDegreeCredits = Int(degreeField.text!)!
        }
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
