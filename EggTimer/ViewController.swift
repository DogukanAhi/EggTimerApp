import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var eggLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    private let eggTimes = ["Soft":300,"Medium":420,"Hard":720]
    
    private var totalTime = 0
    private var secondsPassed = 0
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = 0
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        guard let hardness = sender.currentTitle else { return  }
        totalTime = eggTimes[hardness]!
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if secondsPassed <= totalTime {
            progressView.progress = Float(secondsPassed) / Float(totalTime)
            secondsPassed += 1
        } else {
            timer.invalidate()
            eggLabel.text = "Your eggs are ready to serve!"
            eggLabel.textColor = .gray
            eggLabel.font = .boldSystemFont(ofSize: 50)
            let alert = UIAlertController(title: "DONE", message: "Your eggs are ready to serve!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ready!", style: .default)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
    }
}
