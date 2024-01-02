//
//  FourthViewController.swift
//  TableView_DiffCellStyles
//
//  Created by Smita Kankayya on 14/12/23.
//

import UIKit

class FourthViewController : BaseViewController {
    
    @IBOutlet weak var studentInfoTv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentInfoTv.dataSource = self
        studentInfoTv.delegate = self
    }
}
//MARK : UITableViewDataSource
extension FourthViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        studentInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subtitleCell = self.studentInfoTv.dequeueReusableCell(withIdentifier: "SubtitleCell", for: indexPath)
        subtitleCell.textLabel?.text = studentInfo[indexPath.row].studentName
        subtitleCell.detailTextLabel?.text = String("Roll_Number:\(studentInfo[indexPath.row].rollNumber)")
        
        if indexPath.row % 2 == 0{
            subtitleCell.backgroundColor = .orange
        }
        else{
            subtitleCell.backgroundColor = .blue
        }
        subtitleCell.textLabel?.textColor = .black
        return subtitleCell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.studentInfoTv.beginUpdates()
            self.studentInfo.remove(at: indexPath.row)
            self.studentInfoTv.deleteRows(at: [indexPath], with: .fade)
            self.studentInfoTv.endUpdates()
        }
    }
}

//MARK : UITableViewDelegate
extension FourthViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
}
