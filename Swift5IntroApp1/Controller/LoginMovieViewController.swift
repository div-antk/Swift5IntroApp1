//
//  LoginMovieViewController.swift
//  Swift5IntroApp1
//
//  Created by Takuya Ando on 2021/01/05.
//

import UIKit
import AVFoundation

class LoginMovieViewController: UIViewController {

  var player = AVPlayer()
  
    override func viewDidLoad() {
        super.viewDidLoad()

      let path = Bundle.main.path(forResource: "ファイル名", ofType: "拡張子")
      player = AVPlayer(url: URL(fileURLWithPath: path!))
      
      // AVPlayer用のレイヤーを生成
      let playerLayer = AVPlayerLayer(player: player)
        
      playerLayer.frame = CGRect(
        x: 0,
        y: 0,
        width: view.frame.size.width,
        height: view.frame.size.height
      )
      
      playerLayer.videoGravity = .resizeAspectFill
      
      // 下のリピート再生のための処理
      playerLayer.repeatCount = 0
      
      // 上に表示するボタンのために -1 する
      playerLayer.zPosition = -1
      
      view.layer.insertSublayer(playerLayer, at: 0)
      
      // リピート再生の処理
      NotificationCenter.default.addObserver(
        forName: .AVPlayerItemDidPlayToEndTime,
        object: player.currentItem,
        queue: .main) { (_) in
        // プレーヤーの0秒に移動する
        self.player.seek(to: .zero)
        self.player.play()
      }
    }
  
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
