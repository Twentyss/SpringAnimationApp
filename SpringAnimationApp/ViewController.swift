//
//  ViewController.swift
//  SpringAnimationApp
//
//  Created by Илья Першин on 11.11.2020.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet weak var animationView: SpringView!
    @IBOutlet weak var animationDescriptionLabel: SpringLabel!

    @IBOutlet weak var animationNextButton: SpringButton!
    @IBOutlet weak var animationPreviousButton: SpringButton!
    @IBOutlet weak var animationCurrentButton: SpringButton!
    
    var animationSetups = AnimationSetup.getAnimationSetups()
    
    var animationSetupIndex = 0
    
    var animationSetup: AnimationSetup {
        animationSetups[animationSetupIndex]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationNextButton.setTitle(animationSetup.name + "→", for: .normal)
    }
    
    @IBAction func runNextAnimation() {
        animateView()

        if animationSetupIndex < animationSetups.count - 1 {
            animationSetupIndex += 1
        }
        else {
            animationSetupIndex = 0
        }
        
        animationNextButton.setTitle(
            animationSetups[animationSetupIndex].name + "→",
            for: .normal
        )

        setLabelText()
        animateLabel()
    }


    private func animateView() {
        animationView.curve = animationSetup.curve
        animationView.animation = animationSetup.name
        animationView.delay = CGFloat(animationSetup.delay)
        animationView.duration = CGFloat(animationSetup.duration)
        animationView.animate()
    }
    
    private func setLabelText() {
        let delay = String(format: "%.2f",animationSetup.delay)
        let duration = String(format: "%.2f",animationSetup.duration)
        
        animationDescriptionLabel.text =
        """
        curve: \(animationSetup.curve)
        delay: \(delay)
        duration: \(duration)
        """
    }
    
    private func animateLabel() {
        animationDescriptionLabel.animation = "fadeIn"
        animationDescriptionLabel.duration = 2
        animationDescriptionLabel.animate()
    }
}

