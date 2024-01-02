//
//  ThirdViewController.swift
//  TableView_DiffCellStyles
//
//  Created by Smita Kankayya on 14/12/23.
//

import UIKit

class ThirdViewController: BaseViewController {
    
    @IBOutlet weak var studentInfoTV: UITableView!
    var fourthViewController : FourthViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentInfoTV.dataSource = self
        studentInfoTV.delegate = self
    }
    
    @IBAction func btnClick(_ sender: Any) {
        fourthViewController = self.storyboard?.instantiateViewController(withIdentifier: "FourthViewController") as? FourthViewController
        self.navigationController?.pushViewController(fourthViewController!, animated: true)
    }
}

//MARK : UITableViewDataSource
extension ThirdViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        studentInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rightBasicCell = self.studentInfoTV.dequeueReusableCell(withIdentifier: "RightBasicCell", for:indexPath)
        rightBasicCell.textLabel?.text = studentInfo[indexPath.row].studentName
        rightBasicCell.detailTextLabel?.text = String("Roll_Number:\(studentInfo[indexPath.row].rollNumber)")
        
        if indexPath.row % 2 == 0{
            rightBasicCell.backgroundColor = .orange
        }else{
            rightBasicCell.backgroundColor = .blue
        }
        rightBasicCell.textLabel?.textColor = .black
        return rightBasicCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.studentInfoTV.beginUpdates()
            self.studentInfo.remove(at: indexPath.row)
            self.studentInfoTV.deleteRows(at: [indexPath], with: .fade)
            self.studentInfoTV.endUpdates()
        }
    }
}

//MARK : UITableViewDelegate
extension ThirdViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
}



