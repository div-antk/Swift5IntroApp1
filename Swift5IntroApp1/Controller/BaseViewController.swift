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
    // タブの初期位置
    defaultSelectedIndex = 0
  }
  
  // ヘッダーの処理
  override func segementSlideHeaderView() -> UIView? {
    let headerView = UIImageView()
    
    // タップを有効にする
    headerView.isUserInteractionEnabled = true
    
    // 画像をどこに合わせるか
    headerView.contentMode = .scaleToFill
    
    // ヘッダーに画像をつける
    headerView.image = UIImage(named: "header")
    
    headerView.translatesAutoresizingMaskIntoConstraints = false
    
    // ヘッダーの高さ
    let headerHeight: CGFloat
    
    if #available(iOS 11.0, *) {
      headerHeight = view.bounds.height / 4 + view.safeAreaInsets.top
    } else {
      headerHeight = view.bounds.height / 4 + topLayoutGuide.length
    }
    headerView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true
    
    return headerView
  }
  
  override var titlesInSwitcher: [String] {
    return ["TOP", "AbemaNews", "Yahoo!", "IT", "Buzz", "CNN"]
  }
    
  override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
    switch index {
    case 0:
      return Page1TableViewController()
    case 1:
      return Page2TableViewController()
    case 2:
      return Page3TableViewController()
    case 3:
      return Page4TableViewController()
    case 4:
      return Page5TableViewController()
    case 5:
      return Page6TableViewController()
    default:
      return Page1TableViewController()
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
