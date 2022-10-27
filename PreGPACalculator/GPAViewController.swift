import UIKit
class GPAViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Data model: These strings will be the data for the table view cells
    
    var currentPoints = 0.0
    var submittedDegreeCredits = 0
    var numCourses = 0
    var cellDataCredits = [String]()
    var cellDataLetter = [String]()
    
    @IBOutlet weak var projectGPALabel: UILabel!
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    // don't forget to hook this up from the storyboard
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numCourses
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        //self.tableView.cell
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! CourseTableViewCell
        
        let formatted = cell as! CourseTableViewCell
        //formatted.viewController = self
        formatted.credits.text = nil
        formatted.Grade.text = nil
        //cell.accessoryType = UITableViewCell.AccessoryType.none;
        /*
        if (cellDataCredits.count != 0 && cellDataCredits.count >= indexPath.item) {
            formatted.credits.text = cellDataCredits[indexPath.item]
            formatted.Grade.text = cellDataLetter[indexPath.item]
        } else {
            formatted.credits.text = nil
            formatted.Grade.text = nil
        }
        */
        

        //let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellReuseIdentifier)

        
        //collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        
        // set the text from the data model
        cell.textLabel?.text = "Course " + String(indexPath.item + 1)
        cell.textLabel?.textColor = UIColor.white
        
        
        return cell
    }
    
    
    
    @IBAction func onCalculate(_ sender: Any) {
        let getCells = self.tableView.visibleCells as! Array<CourseTableViewCell>
        var cellHours = 0
        var cellPoints = 0.0
        var gradeEquivalent = 0.0
        var semPoints = 0.0;

        for aCell in getCells {
            gradeEquivalent = 0.0
            //aCell.Grade
            switch aCell.Grade.text {
            case "A+":
                gradeEquivalent = 4.3
            case "A":
                gradeEquivalent = 4
            case "A-":
                gradeEquivalent = 3.667
            case "B+":
                gradeEquivalent = 3.333
            case "B":
                gradeEquivalent = 3
            case "B-":
                gradeEquivalent = 2.667
            case "C+":
                gradeEquivalent = 2.333
            case "C":
                gradeEquivalent = 2
            case "C-":
                gradeEquivalent = 1.667
            case "D+":
                gradeEquivalent = 1.333
            case "D":
                gradeEquivalent = 1
            case "D-":
                gradeEquivalent = 0.667
            case "F":
                gradeEquivalent = 0
            default:
                print("not found")
            }
            cellHours += Int(aCell.credits.text!)!
            semPoints = gradeEquivalent * Double(aCell.credits.text!)!
            cellPoints += semPoints
        }
        
        let allHours = submittedDegreeCredits
        + cellHours
        
        let allPoints = currentPoints + cellPoints
        
        var projectedGPA = allPoints / Double(allHours)
        projectedGPA = round(projectedGPA * 1000) / 1000.0
        projectGPALabel.text = String(projectedGPA)
        
        print(String(cellHours))
        print(String(allPoints))
        
    }
    @IBAction func onClear(_ sender: Any) {
        let getCells = self.tableView.visibleCells as! Array<CourseTableViewCell>
        for aCell in getCells {
            aCell.Grade.text = nil
            aCell.credits.text = nil
        }
    }
    
}
