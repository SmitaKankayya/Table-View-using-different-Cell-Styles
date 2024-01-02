//
//  SecondViewController.swift
//  TableView_DiffCellStyles
//
//  Created by Smita Kankayya on 14/12/23.
//

import UIKit

class SecondViewController: BaseViewController{
    
    @IBOutlet weak var studentInfoTableView: UITableView!
    var thirdViewController : ThirdViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentInfoTableView.dataSource = self
        studentInfoTableView.delegate = self
    }
    
    @IBAction func btnAddRecord(_ sender: Any) {
        thirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController
        self.navigationController?.pushViewController(thirdViewController!, animated: true)
    }
}

//MARK : UITableViewDataSource
extension SecondViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        studentInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leftBasicCell = self.studentInfoTableView.dequeueReusableCell(withIdentifier: "LeftBasicCell", for: indexPath)
        leftBasicCell.textLabel?.text = studentInfo[indexPath.row].studentName
        leftBasicCell.textLabel?.font = .boldSystemFont(ofSize: 15)
        leftBasicCell.detailTextLabel?.text = String("\tRoll_Number: \(studentInfo[indexPath.row].rollNumber)")
        
        if indexPath.row % 2 == 0{
            leftBasicCell.backgroundColor = .orange
        }
        else{
            leftBasicCell.backgroundColor = .blue
        }
        leftBasicCell.textLabel?.textColor = .black
        
        
        return leftBasicCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.studentInfoTableView.beginUpdates()
            self.studentInfo.remove(at: indexPath.row)
            self.studentInfoTableView.deleteRows(at: [indexPath], with: .fade)
            self.studentInfoTableView.endUpdates()
        }
    }
}

//MARK : UITableViewDelegate
extension SecondViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
}

