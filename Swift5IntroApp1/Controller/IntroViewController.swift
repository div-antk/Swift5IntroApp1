//
//  IntroViewController.swift
//  Swift5IntroApp1
//
//  Created by Takuya Ando on 2021/01/03.
//

import UIKit
import Lottie

class IntroViewController: UIViewController, UIScrollViewDelegate {

  @IBOutlet weak var scrollView: UIScrollView!
  
  var onboardArray = ["1","2","3","4","5"]
  var onboardStringArray = ["(´・ω・｀)", "（´ω｀）", "⊂( ・∇・)⊃", "(`Д´)", "( ´∀｀)",]
  
  override func viewDidLoad() {
        super.viewDidLoad()

    scrollView.isPagingEnabled = true
    setUpScroll()
    
    for i in 0...4 {
      
      let animationView = AnimationView()
      let animation = Animation.named(onboardArray[i])
      animationView.frame = CGRect(
        x: CGFloat(i) * view.frame.size.width,
        y: 0,
        width: view.frame.size.width,
        height: view.frame.size.height
      )
      animationView.animation = animation
      animationView.contentMode = .scaleAspectFit
      animationView.loopMode = .loop
      animationView.play()
      scrollView.addSubview(animationView)
    }
  }
    
  // ナビゲーションバーを消す
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    self.navigationController?.isNavigationBarHidden = true
    
  }
  
  // スクロール
  func setUpScroll() {
    
    scrollView.delegate = self
    
    // 可動領域
    // ページングしたいページの数だけ横幅を乗算する
    scrollView.contentSize = CGSize(width: view.frame.size.width * 5, height: scrollView.frame.size.height)
    
    for i in 0...4 {
      
      let onboardLabel = UILabel(frame: CGRect(
                                  x: CGFloat(i) * view.frame.size.width,
                                  // 画面を3分割して下に持ってくる
                                  y: view.frame.size.height / 3,
                                  width: scrollView.frame.size.width,
                                  height: scrollView.frame.size.height)
      )
      onboardLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
      onboardLabel.textAlignment = .center
      onboardLabel.text = onboardStringArray[i]
      scrollView.addSubview(onboardLabel)
    }
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
