//
//  ViewController.swift
//  PopTheBalloon0.1
//
//  Created by Erencan Acıoğlu on 24.03.2024.


import UIKit

class ViewController: UIViewController {
    
    var score = 0
    var timer = Timer()
    var counter = 0
    var balloonArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    
    @IBOutlet weak var b1: UIImageView!
    @IBOutlet weak var b2: UIImageView!
    @IBOutlet weak var b3: UIImageView!
    @IBOutlet weak var b4: UIImageView!
    @IBOutlet weak var b5: UIImageView!
    @IBOutlet weak var b6: UIImageView!
    @IBOutlet weak var b7: UIImageView!
    @IBOutlet weak var b8: UIImageView!
    @IBOutlet weak var b9: UIImageView!
    @IBOutlet weak var b10: UIImageView!
    @IBOutlet weak var b11: UIImageView!
    @IBOutlet weak var b12: UIImageView!
    @IBOutlet weak var b13: UIImageView!
    @IBOutlet weak var b14: UIImageView!
    @IBOutlet weak var b15: UIImageView!
    @IBOutlet weak var b16: UIImageView!
    @IBOutlet weak var b17: UIImageView!
    @IBOutlet weak var b18: UIImageView!
    @IBOutlet weak var b19: UIImageView!
    @IBOutlet weak var b20: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        scoreLabel.text = "Score: \(score)"
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if let storedHighScore = UserDefaults.standard.value(forKey: "highScore") as? Int {
                highScore = storedHighScore
                highscoreLabel.text = "Highscore: \(highScore)"
            }
               
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highscoreLabel.text = "Highscore: \(highScore)"
               }
        
        b1.isUserInteractionEnabled = true
        b2.isUserInteractionEnabled = true
        b3.isUserInteractionEnabled = true
        b4.isUserInteractionEnabled = true
        b5.isUserInteractionEnabled = true
        b6.isUserInteractionEnabled = true
        b7.isUserInteractionEnabled = true
        b8.isUserInteractionEnabled = true
        b9.isUserInteractionEnabled = true
        b10.isUserInteractionEnabled = true
        b11.isUserInteractionEnabled = true
        b12.isUserInteractionEnabled = true
        b13.isUserInteractionEnabled = true
        b14.isUserInteractionEnabled = true
        b15.isUserInteractionEnabled = true
        b16.isUserInteractionEnabled = true
        b17.isUserInteractionEnabled = true
        b18.isUserInteractionEnabled = true
        b19.isUserInteractionEnabled = true
        b20.isUserInteractionEnabled = true
        
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer10 = UITapGestureRecognizer(target: self, action:#selector(increaseScore))
        let recognizer11 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer12 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer13 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer14 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer15 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer16 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer17 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer18 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer19 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer20 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        b1.addGestureRecognizer(recognizer1)
        b2.addGestureRecognizer(recognizer2)
        b3.addGestureRecognizer(recognizer3)
        b4.addGestureRecognizer(recognizer4)
        b5.addGestureRecognizer(recognizer5)
        b6.addGestureRecognizer(recognizer6)
        b7.addGestureRecognizer(recognizer7)
        b8.addGestureRecognizer(recognizer8)
        b9.addGestureRecognizer(recognizer9)
        b10.addGestureRecognizer(recognizer10)
        b11.addGestureRecognizer(recognizer11)
        b12.addGestureRecognizer(recognizer12)
        b13.addGestureRecognizer(recognizer13)
        b14.addGestureRecognizer(recognizer14)
        b15.addGestureRecognizer(recognizer15)
        b16.addGestureRecognizer(recognizer16)
        b17.addGestureRecognizer(recognizer17)
        b18.addGestureRecognizer(recognizer18)
        b19.addGestureRecognizer(recognizer19)
        b20.addGestureRecognizer(recognizer20)
        
        balloonArray = [b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18,b19,b20]
        
        counter = 30
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideBalloons), userInfo: nil, repeats: true)
        
        hideBalloons()
    }
    
    @objc func hideBalloons() {
        for balloon in balloonArray{
            balloon.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(balloonArray.count - 1)))
        balloonArray[random].isHidden = false
        
    }
    
    @objc func increaseScore() {
        score+=1
        scoreLabel.text = "Score: \(score)"
        
    }
    @objc func countDown() {
        counter -= 1
        timeLabel.text = String(counter)
        
        for balloon in balloonArray{
            balloon.isHidden = true
        }
        
        if self.score > self.highScore {
            self.highScore = self.score
            highscoreLabel.text = "Highscore: \(self.highScore)"
            UserDefaults.standard.setValue(self.highScore, forKey: "highScore")
        }
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            let alert = UIAlertController(title: "Time is Up!", message: "Try Again!" , preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK!", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 30
                self.timeLabel.text = String(self.counter)
                
                self.timer.invalidate()
                self.hideTimer.invalidate()
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideBalloons), userInfo: nil, repeats: true)
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
}
