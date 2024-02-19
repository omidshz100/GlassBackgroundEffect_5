//
//  TransparentBlurView.swift
//  TransparentBlur
//
//  Created by Omid Shojaeian Zanjani on 19/02/24.
//

import SwiftUI

struct TransparentBlurView: UIViewRepresentable {
    var removeAllFilter: Bool = false
    func makeUIView(context: Context) -> TransparentBlurViewHelper {
        TransparentBlurViewHelper(removeAllFilter: removeAllFilter)
    }
  
    
    func updateUIView(_ uiView: TransparentBlurViewHelper, context: Context) {
        DispatchQueue.main.async {
            
        }
    }
}

class TransparentBlurViewHelper: UIVisualEffectView {
    
    init(removeAllFilter:Bool ) {
        super.init(effect: UIBlurEffect(style: .systemUltraThinMaterial) )
        
        if subviews.indices.contains(1) {
            subviews[1].alpha = 0
        }
        
        if let backDropLayer = layer.sublayers?.first {
            if removeAllFilter {
                backDropLayer.filters = []
            }else {
                backDropLayer.filters?.removeAll(where: { filter in
                    String(describing: filter) != "gaussianBlur"
                })
            }
        }
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // disabaling trait changers
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        
         
    }
}
#Preview {
    ContentView()
        
}
