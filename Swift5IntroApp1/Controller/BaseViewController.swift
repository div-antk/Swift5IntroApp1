//
//  BaseViewController.swift
//  Swift5IntroApp1
//
//  Created by Takuya Ando on 2021/01/05.
//

import UIKit
// タブの付いた遷移ができる
import SegementSlide

// 親コントローラを変更
class BaseViewController: SegementSlideDefaultViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    reloadData()
    defaultSelectedIndex = 0
    // Do any additional setup after loading the view.
  }
  
  override func segementSlideHeaderView() -> UIView? {
    let headerView = UIImageView()
    headerView.isUserInteractionEnabled = true
    headerView.contentMode = .scaleToFill
    headerView.image = UIImage(named: "header")
    headerView.translatesAutoresizingMaskIntoConstraints = false
    
    let headerHeight: CGFloat
    
    if #available(iOS 11.0, *) {
      headerHeight = view.bounds.height / 4 + view.safeAreaInsets.top
    } else {
      headerHeight = view.bounds.height / 4 + topLayoutGuide.length
    }
    headerView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true
    
    return headerView
  }
  
  override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
    switch index {
    case 0:
      return Page1ViewController()
    case 1:
      return Page2ViewController()
    case 2:
      return Page3ViewController()
    case 3:
      return Page4ViewController()
    case 4:
      return Page5ViewController()
    case 5:
      return Page6ViewController()
    default:
      return Page1ViewController()
    }
  }
  // ナビゲーションバーの表示を消す
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.isNavigationBarHidden = true
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
