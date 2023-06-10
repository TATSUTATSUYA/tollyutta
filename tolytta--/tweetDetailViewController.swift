//
//  tweetDetailViewController.swift
//  tolytta--
//
//  Created by 岡本竜弥 on 2023/06/09.
//

import Foundation
import UIKit

class tweetDetailViewController: UIViewController{
var text: String = ""
   var recordDate: Date = Date()
   
   var dateFormat: DateFormatter {
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy年MM月dd日"
       return dateFormatter
   }
   
   override func viewDidLoad() {
       super.viewDidLoad()
       displayData()
   }
   
   func configure(memo: User) {
       text = memo.text
       recordDate = memo.recordDate
       print("データは\(text)と\(recordDate)です！")
   }
   
   func displayData() {
       textView.text = text
       navigationItem.title = dateFormat.string(from: recordDate)
   }
}
