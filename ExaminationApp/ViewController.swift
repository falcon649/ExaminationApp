//
//  ViewController.swift
//  ExaminationApp
//
//  Created by 浅野　宏明 on 2016/07/23.
//  Copyright © 2016年 akylab. All rights reserved.
//

import UIKit

/// 演算子
enum Operator: String {
    case Plus  = "+"
    case Minus = "-"
    case Multi = "×"
    case Div   = "÷"
}

class ViewController: UIViewController {
    /// 演算子のリスト
    private let operatorList: [Operator] = [
        .Plus,
        .Minus,
        .Multi,
        .Div
    ]
    
    /// 選択中の演算子
    private var selectedOperator = Operator.Plus
    
    /// 値1の入力フィールド
    @IBOutlet private weak var value1: UITextField!
    /// 値2の入力フィールド
    @IBOutlet private weak var value2: UITextField!
    /// 計算結果を出力するラベル
    @IBOutlet private weak var resultLabel: UILabel!
    /// 計算実行ボタン押下時の処理
    @IBAction private func calcurate(_: UIButton) {
        // selectedOperator の値に合わせて演算
        let result: Int
        switch selectedOperator {
        case .Plus:
            result = Int(value1.text!)! + Int(value2.text!)!
        case .Minus:
            result = Int(value1.text!)! - Int(value2.text!)!
        case .Multi:
            result = Int(value1.text!)! * Int(value2.text!)!
        case .Div:
            result = Int(value1.text!)! / Int(value2.text!)!
        }
        
        print("result: \(result)")
        
        // 結果表示用ラベルに出力
        resultLabel.text = "\(result)"
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        // ピッカーのコンポーネントの数を返す
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // コンポーネント毎の行数を返す
        return operatorList.count
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 行のラベルとなる文字列を返す
        return operatorList[row].rawValue
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 行を選択した時のアクションを定義
        selectedOperator = operatorList[row]
    }
}
