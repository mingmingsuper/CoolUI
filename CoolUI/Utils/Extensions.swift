//
//  Extensions.swift
//  CoolUI
//
//  Created by liumingming on 2017/7/13.
//  Copyright © 2017年 LMM. All rights reserved.
//
import Foundation

public extension String
{
    public func nsRange(_ range:Range<String.Index>) -> NSRange
    {
        let from = range.lowerBound.samePosition(in: utf16)
        let to = range.upperBound.samePosition(in: utf16)
        return NSRange(location: utf16.distance(from: utf16.startIndex, to: from), length: utf16.distance(from: from, to: to))
    }
    
    public func range(from nsRange: NSRange) -> Range<String.Index>?
    {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
            let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self)
            else
        {
            return nil
        }
        return from ..< to
    }
}
