//
//  CourseTableViewCell.swift
//  PreGPACalculator
//
//  Created by Sharonda Daniels on 10/17/22.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    @IBOutlet weak var Grade: UITextField!
    
    @IBOutlet weak var credits: UITextField!
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        credits.keyboardType = UIKeyboardType.decimalPad
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /*
    override func prepareForReuse() {
        let modifyMyArrays = self.viewController
        modifyMyArrays?.cellDataLetter.append(Grade.text ?? "")
        modifyMyArrays?.cellDataCredits.append(credits.text ?? "")
        /*
        controller.numCourses = (Int(courseField.text!)!)
        controller.currentPoints = Double(gpaField.text!)! * Double(degreeField.text!)!
        controller.submittedDegreeCredits = Int(degreeField.text!)!*/
    }
     */
}
