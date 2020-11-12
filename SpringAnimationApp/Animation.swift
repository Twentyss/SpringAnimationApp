//
//  animation.swift
//  SpringAnimationApp
//
//  Created by Илья Першин on 12.11.2020.
//

import Foundation

struct AnimationSetup {
    let name: String
    let curve: String
    
    var duration: Float {
        Float.random(in: 0.5...1)
    }
    var delay: Float {
        Float.random(in: 0...0.5)
    }
}

extension AnimationSetup {
    static func getAnimationSetups() -> [AnimationSetup] {
        var animationSetups: [AnimationSetup] = []
        
        let names = DataManager.shared.names.shuffled()
        let curves = DataManager.shared.curves.shuffled()
        
        for index in 0..<names.count {
            let animationSetup = AnimationSetup(
                name: names[index],
                curve: curves[index])
            animationSetups.append(animationSetup)
        }
        
        return animationSetups
    }
}


