//
//  ViewController.swift
//  TechPod
//
//  Created by 渡辺奈実 on 2020/09/16.
//  Copyright © 2020 Watanabe nami. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    //曲を入れるための配列
    var songNameArray = [String]()
    //曲のファイル名を入れるための配列
    var fileNameArray = [String]()
    //音楽家の画像を入れるための配列
    var imageNameArray = [String]()
    
    //音楽を再生するための変数
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //テーブルビューのデータソースメソッドはViewControllerクラスに書く
        table.dataSource = self
        
        //テーブルビューのデリゲートメソッドはViewControllerメソッドに書く
        table.delegate = self
        
        //songNameArrayに曲名を入れていく
        songNameArray = ["カノン", "エリーゼのために", "G線上のアリア"]
        
        //fileNameArrayにファイル名を入れていく
        fileNameArray = ["cannon", "elise", "aria"]
        
        //imageNameArrayに曲の画像を入れていく
        imageNameArray = ["Pachelbel.jpg", "Beethoven.jpg", "Bach.jpg"]
    }
    
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //セルの数をsongNameArrayの数にする
        return songNameArray.count
    }
    
    //ID付きのセルを取得して，セル付属のtextLabelに「テスト」と表示させてみる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //セルにsongNameArrayの曲名を表示する
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        return cell!
    }
    
    //セルが押された時に呼ばれた時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました")
        
        //音楽ファイルの設定
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        audioPlayer.play()
    }

}

