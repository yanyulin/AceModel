//
//  AceModel.swift
//  AceModel
//
//  Created by Luffy on 2017/10/23.
//

import Foundation

open class AceModel: NSObject {
    
    static public func aceModelToModel<T, U: Object>(inputModel: T) -> U? {

        
        let inputMirror = Mirror(reflecting: inputModel)
        let inputDisplayStyle = inputMirror.displayStyle!
        print("输入模型的类型： ", inputDisplayStyle)
        
        var outputModel = U()
        let outputMirror = Mirror(reflecting: outputModel)
        let outputDisplayStyle = outputMirror.displayStyle!
        print("输出模型的类型： ", outputDisplayStyle)
        
        var dic: Dictionary<String, Any>?
        if inputDisplayStyle == .class && outputDisplayStyle == .dictionary {
            return modelToDictionary(inputMirror: inputMirror) as! U
        }
        return outputModel as! U
    }
    
    //模型转字典
    static public func modelToDictionary(inputMirror: Mirror) -> Dictionary<String, Any> {
        var dic = Dictionary<String, Any>()
        for case let (label?, value) in inputMirror.children {
            print("属性：\(label)     值：\(value)")
            dic[label] = value
        }
        return dic
    }
}
