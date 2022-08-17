//
//  ViewController.swift
//  PedometerWithCoreMotion
//
//  Created by Victor Kimpel on 17.08.22.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var stepCounter: UILabel!
    
    let activityManager = CMMotionActivityManager()
    let pedometer = CMPedometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if CMMotionActivityManager.isActivityAvailable() {
            self.activityManager.startActivityUpdates(to: OperationQueue.main) { (data) in
                DispatchQueue.main.async {
                    if let activity = data {
                        if activity.running == true {
                            print("Ranning")
                        } else if activity.walking == true {
                            print("Walking")
                        } else if activity.automotive == true {
                            print("Automotive")
                        }
                    }
                }
            }
        }
        if CMPedometer.isStepCountingAvailable() {
            self.pedometer.startUpdates(from: Date()) { (data, error) in
                if error == nil {
                    if let response = data {
                        DispatchQueue.main.async {
                            print("Number of steps == \(response.numberOfSteps)")
                            self.stepCounter.text = "Step counter: \(response.numberOfSteps)"
                        }
                    }
                }
            }
        }
    }
}

