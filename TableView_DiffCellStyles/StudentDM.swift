//
//  StudentDM.swift
//  TableView_DiffCellStyles
//
//  Created by Smita Kankayya on 15/12/23.
//


import UIKit

struct Student{
    var studentName : String
    var rollNumber : Int
}

class BaseViewController : UIViewController{
    var studentInfo : [Student] = [Student(studentName: "Smita", rollNumber: 11),
                                   Student(studentName: "Komal", rollNumber: 12),
                                   Student(studentName: "Harsh", rollNumber: 13),
                                   Student(studentName: "Devashri", rollNumber: 14),
                                   Student(studentName: "Chandrika", rollNumber: 15),
                                   Student(studentName: "Gajanan", rollNumber: 16),
                                   Student(studentName: "Hrutik", rollNumber: 17),
                                   Student(studentName: "Ashitosh", rollNumber: 18),
                                   Student(studentName: "Sambhaji", rollNumber: 19),
                                   Student(studentName: "Aaditya", rollNumber: 20)
    ]
    
}




