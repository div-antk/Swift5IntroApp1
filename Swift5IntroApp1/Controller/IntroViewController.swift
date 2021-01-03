//
//  IntroViewController.swift
//  Swift5IntroApp1
//
//  Created by Takuya Ando on 2021/01/03.
//

import UIKit
import Lottie

class IntroViewController: UIViewController {

  @IBOutlet weak var scrollView: UIScrollView!
  
  var onboardArray = ["1","2","3","4","5"]
  var onboardString = ["(´・ω・｀)", "（´ω｀）", "⊂( ・∇・)⊃", "(`Д´)", "( ´∀｀)", ]
  
  override func viewDidLoad() {
        super.viewDidLoad()

    scrollView.isPagingEnabled = true
  }
    
  // ナビゲーションバーを消す
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    self.navigationController?.isNavigationBarHidden = true
    
  }
  
  func setUpScroll() {
    
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
