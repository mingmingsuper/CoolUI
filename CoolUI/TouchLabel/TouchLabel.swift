//
//  TouchLabel.swift
//  CoolUI
//
//  Created by liumingming on 2017/7/13.
//  Copyright © 2017年 LMM. All rights reserved.
//

import UIKit

public class TouchLabel: UILabel
{
    fileprivate var touches:[String:()->Void] = [:]
    
    public override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupUI()
    }
    
    public required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    fileprivate func setupUI()
    {
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapClick))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        self.addGestureRecognizer(tap)
    }
    
    @objc fileprivate func tapClick(_ gesture: UITapGestureRecognizer)
    {
        guard let attrText = self.attributedText else
        {
            //如果多媒体文字为空就没要执行下面的罗技因为这个Label是为了特殊显示点击实现
            return
        }
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: self.frame.size)
        textContainer.lineBreakMode = self.lineBreakMode
        textContainer.maximumNumberOfLines = self.numberOfLines
        textContainer.lineFragmentPadding = 0
        layoutManager.addTextContainer(textContainer)
        
        let textStorage = NSTextStorage(attributedString: attrText)
        textStorage.addLayoutManager(layoutManager)
        
        guard touches.count > 0 else { return }
        
        for touch in touches
        {
            let key = touch.key
            let callback = touch.value
            guard let range = attrText.string.range(of: key) else { continue }
            let keyRange = attrText.string.nsRange(range)
            let glyphRange = NSRangePointer.allocate(capacity: MemoryLayout<NSRange>.size)
            layoutManager.characterRange(forGlyphRange: keyRange, actualGlyphRange: glyphRange)
            let glyRect = layoutManager.boundingRect(forGlyphRange: glyphRange.move(), in: textContainer)
            glyphRange.deinitialize()
            let touchPoint = gesture.location(ofTouch: 0, in: self)
            if glyRect.contains(touchPoint)
            {
                callback()
            }
        }
    }
    
    public func addEvent(_ key:String, callback:@escaping ()->Void)
    {
        if key.isEmpty
        {
            return
        }
        touches[key] = callback
    }
}
