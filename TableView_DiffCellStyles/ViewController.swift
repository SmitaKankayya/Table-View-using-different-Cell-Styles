//
//  ViewController.swift
//  TableView_DiffCellStyles
//
//  Created by Smita Kankayya on 14/12/23.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var studentTableView: UITableView!
    
    var studentName = ["Smita", "Komal", "Harsh", "Devashri", "Chandrika", "Gajanan", "Hrutik", "Ashitosh", "Sambhaji", "Aaditya"]
    var secondViewController : SecondViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentTableView.dataSource = self
        studentTableView.delegate = self
    }
    
    @IBAction func btnClick(_ sender: Any) {
        secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
        self.navigationController?.pushViewController(secondViewController!, animated: true)
    }
    
}

//MARK : UITableViewDataSource
extension ViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        studentName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let basicCell = self.studentTableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        basicCell.textLabel?.text = studentName[indexPath.row]
        basicCell.backgroundColor = randomColourGenerator()
        basicCell.textLabel?.textColor = .black
        return basicCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.studentTableView.beginUpdates()
            self.studentName.remove(at: indexPath.row)
            self.studentTableView.deleteRows(at: [indexPath], with: .fade)
            self.studentTableView.endUpdates()
        }
    }
}

func randomColourGenerator() -> UIColor{
    debugPrint(drand48())
    let red = CGFloat(drand48())
    let green = CGFloat(drand48())
    let blue = CGFloat(drand48())
    return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
}

//MARK : UITableViewDelegate
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
    
}





