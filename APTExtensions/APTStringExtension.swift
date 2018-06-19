//
//  APTStringExtension.swift
//  APTViewExtensions
//
//  Created by Rishad Appat on 6/19/18.
//  Copyright © 2018 Rishad Appat. All rights reserved.
//

import Foundation

extension String
{
    func substring(from: Int?, to: Int?) -> String {
        if let start = from {
            guard start < self.count else {
                return ""
            }
        }
        if let end = to {
            guard end >= 0 else {
                return ""
            }
        }
        if let start = from, let end = to {
            guard end - start >= 0 else {
                return ""
            }
        }
        let startIndex: String.Index
        if let start = from, start >= 0 {
            startIndex = self.index(self.startIndex, offsetBy: start)
        } else {
            startIndex = self.startIndex
        }
        let endIndex: String.Index
        if let end = to, end >= 0, end < self.count {
            endIndex = self.index(self.startIndex, offsetBy: end + 1)
        } else {
            endIndex = self.endIndex
        }
        return String(self[startIndex ..< endIndex])
    }
    
    func substring(from: Int) -> String {
        return self.substring(from: from, to: nil)
    }
    
    func substring(to: Int) -> String {
        return self.substring(from: nil, to: to)
    }
    
    func substring(from: Int?, length: Int) -> String {
        guard length > 0 else {
            return ""
        }
        let end: Int
        if let start = from, start > 0 {
            end = start + length - 1
        } else {
            end = length - 1
        }
        return self.substring(from: from, to: end)
    }
    
    func substring(length: Int, to: Int?) -> String {
        guard let end = to, end > 0, length > 0 else {
            return ""
        }
        let start: Int
        if let end = to, end - length > 0 {
            start = end - length + 1
        } else {
            start = 0
        }
        return self.substring(from: start, to: to)
    }
    
    func trim() -> String
    {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func timeStamptoDate(format: String) -> String
    {
        let timeStamp = Double(self)
        let date = NSDate(timeIntervalSince1970: timeStamp!/1000)
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = format
        dayTimePeriodFormatter.locale = NSLocale.current
        dayTimePeriodFormatter.timeZone = TimeZone.current
        return dayTimePeriodFormatter.string(from: date as Date)
    }
    
    func changeDateFormatTo(dateFormat: String) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = NSLocale.current
        if let dateFromString = formatter.date(from: self) {
            let stringFromDate = formatter.string(from: dateFromString)
            return stringFromDate
        }
        return ""
    }
}

extension Double
{
    func timeStamptoDate(format: String) -> String
    {
        let date = NSDate(timeIntervalSince1970: self/1000)
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = format
        dayTimePeriodFormatter.locale = NSLocale.current
        dayTimePeriodFormatter.timeZone = TimeZone.current
        return dayTimePeriodFormatter.string(from: date as Date)
    }
}

extension Date
{
    func toString(format: String) -> String
    {
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = format
        dayTimePeriodFormatter.locale = NSLocale.current
        dayTimePeriodFormatter.timeZone = TimeZone.current
        return dayTimePeriodFormatter.string(from: self)
    }
}

extension NSDate
{
    func toString(format: String) -> String
    {
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = format
        dayTimePeriodFormatter.locale = NSLocale.current
        dayTimePeriodFormatter.timeZone = TimeZone.current
        return dayTimePeriodFormatter.string(from: self as Date)
    }
}
