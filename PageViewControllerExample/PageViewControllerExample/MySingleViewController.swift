//
//  MySinglePageViewController.swift
//  PageViewControllerExample
//
//  Created by Karsten Gresch on 25.08.17.
//  Copyright © 2017 Funny Tryouts. All rights reserved.
//

import UIKit

class MySingleViewController: UIViewController {
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var textView: UITextView!
  
  var labelText: String?
  var textViewText: String?
  var pageIndex: Int!
  

    override func viewDidLoad() {
        super.viewDidLoad()
      if let labelText = labelText {
        label.text = labelText
      }
      if let textViewText = textViewText {
        textView.text = textViewText
      }
      
    }
  
}
