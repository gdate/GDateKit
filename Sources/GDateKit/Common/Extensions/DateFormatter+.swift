//
//  DateFormatter+.swift
//  GDateKit
//
//  Created by teda on 2024/12/12.
//

import Foundation

public extension DateFormatter {
    /// dateFormatterは生成コストが高いのでシングルトンとして定義しておく
    /// 端末のカレンダー設定に左右されたくない場合（主にString -> Date変換時に利用）
    static let shared: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(abbreviation: "JST")
        return formatter
    }()
    
    /// dateFormatterは生成コストが高いのでシングルトンとして定義しておく
    /// localeをja_JPにしたい場合
    static let sharedByJPLocale: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.timeZone = TimeZone(abbreviation: "JST")
        return formatter
    }()
}
