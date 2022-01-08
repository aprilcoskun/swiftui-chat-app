//
//  DateUtils.swift
//  testing
//
//  Created by Nisan Coskun on 7.01.2022.
//

import Foundation

extension Date {
    // Returns the amount of years from another date
    func years() -> Int {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year ?? 0
    }
    // Returns the amount of months from another date
    func months() -> Int {
        return Calendar.current.dateComponents([.month], from: self, to: Date()).month ?? 0
    }
    // Returns the amount of weeks from another date
    func weeks() -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: self, to: Date()).weekOfMonth ?? 0
    }
    // Returns the amount of days from another date
    func days() -> Int {
        return Calendar.current.dateComponents([.day], from: self, to: Date()).day ?? 0
    }
    // Returns the amount of hours from another date
    func hours() -> Int {
        return Calendar.current.dateComponents([.hour], from: self, to: Date()).hour ?? 0
    }
    // Returns the amount of minutes from another date
    func minutes() -> Int {
        return Calendar.current.dateComponents([.minute], from: self, to: Date()).minute ?? 0
    }
    // Returns the amount of seconds from another date
    func seconds() -> Int {
        return Calendar.current.dateComponents([.second], from: self, to: Date()).second ?? 0
    }
    // Returns the a custom time interval description from another date
    func fromNow() -> String {
        if years()   > 0 { return "\(years())y"   }
        if months()  > 0 { return "\(months())M"  }
        if weeks()   > 0 { return "\(weeks())w"   }
        if days()    > 0 { return "\(days())d"    }
        if hours()   > 0 { return "\(hours())h"   }
        if minutes() > 0 { return "\(minutes())m" }
        if seconds() > 0 { return "\(seconds())s" }
        return ""
    }
    
    static func parseString(str: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.date(from: str)!
    }
}
