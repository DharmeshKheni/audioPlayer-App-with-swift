//
//  ViewController.swift
//  audioRecorder
//
//  Created by Anil on 08/01/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var volumeControl: UISlider!
    @IBOutlet weak var playAudio: UIButton!
    @IBOutlet weak var stopAudio: UIButton!
    
    var audioPlayer : AVAudioPlayer? = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("we_cant_Stop", ofType: "mp3")!)
        var error : NSError?
        
        audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
        if let err = error{
            println("audioPlayer error \(err.localizedDescription)")
        }else{
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
        }
    }

    @IBAction func playTapped(sender: AnyObject) {
        
        if let player = audioPlayer{
            player.play()
        }
        
    }

    @IBAction func stopTapped(sender: AnyObject) {
        
        if let player = audioPlayer{
            player.stop()
        }
    }
    @IBAction func adjustVolume(sender: AnyObject) {
        
        if audioPlayer != nil{
            audioPlayer?.volume = volumeControl.value
        }
    }
}

