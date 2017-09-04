//
//  MyPageViewController.swift
//  PageViewControllerExample
//
//  Created by Karsten Gresch on 25.08.17.
//  Copyright © 2017 Funny Tryouts. All rights reserved.
//

import UIKit

class MyPageViewController: UIPageViewController {
  var labelTexts = ["Label 1", "Label 2", "Label 3", "Label 4", "Label 5"]
  var pageTexts = ["Text 1", "Text 2", "Text 3", "Text 4", "Text 5"]
  var currentIndex: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
     
        dataSource = self
      
      
      if let mySingleViewController = newMySingleViewController(currentIndex ?? 0) {
        let viewControllers = [mySingleViewController]
        setViewControllers(viewControllers,
                           direction: .forward,
                           animated: false,
                           completion: nil)
      }
    
    }
  
  func newMySingleViewController(_ index: Int) -> MySingleViewController? {
    if let storyboard = storyboard,
      let mySingleViewController = storyboard.instantiateViewController(withIdentifier: "MySingleViewControllerID") as? MySingleViewController {
      mySingleViewController.labelText = labelTexts[index]
      mySingleViewController.textViewText = pageTexts[index]
      mySingleViewController.pageIndex = index
      return mySingleViewController
    }
    return nil
  }

}

extension MyPageViewController: UIPageViewControllerDataSource {

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
    if  let mySingleViewController = viewController as? MySingleViewController,
        let index = mySingleViewController.pageIndex,
        index > 0 {
      return newMySingleViewController(index - 1)
    }
    
    return nil
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    if let mySingleViewController = viewController as? MySingleViewController,
      let index = mySingleViewController.pageIndex,
      (index + 1) < labelTexts.count {
      return newMySingleViewController(index + 1)
    }
    return nil
  }
  
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return labelTexts.count
  }
  
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    return currentIndex ?? 0
  }
  
}


