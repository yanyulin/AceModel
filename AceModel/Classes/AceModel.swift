//
//  AceModel.swift
//  AceModel
//
//  Created by Luffy on 2017/10/23.
//

import Foundation

open class AceModel: NSObject {
    
    static public func aceModelToModel<T, U>(inputModel: T, outputModel: U?) -> U? {

        //输入的模型
        let inputMirror = Mirror(reflecting: inputModel)
        let inputDisplayStyle = inputMirror.displayStyle!
        
        if outputModel == nil {
            return self.modelToJSON(inputMirror: inputMirror) as! U
        }
        
        //输出的模型
        let outputMirror = Mirror(reflecting: outputModel)
        let outputDisplayStyle = outputMirror.displayStyle!
        
       
        
        //model 转 dictionary
        if inputDisplayStyle == .class && outputDisplayStyle == .dictionary {
            return modelToDictionary(inputMirror: inputMirror) as? U
        }
        
//        if inputDisplayStyle == .class && outputDisplayStyle == .s {
//
//        }
        
        return outputModel
    }
    
    //模型转字典
    static public func modelToDictionary(inputMirror: Mirror) -> Dictionary<String, Any> {
        var dic = Dictionary<String, Any>()
        for case let (label?, value) in inputMirror.children {
            dic[label] = value
        }
        return dic
    }
    
    static public func modelToJSON(inputMirror: Mirror) -> String? {
        if let anyObject: Dictionary<String, Any> = self.modelToDictionary(inputMirror: inputMirror) {
            if (anyObject != nil && JSONSerialization.isValidJSONObject(anyObject)) {
                do {
                    let jsonData: Data = try JSONSerialization.data(withJSONObject: anyObject, options: [])
                    return String(data: jsonData, encoding: .utf8)
                } catch let error {
                    print(error)
                }
            } else {
                print("\(anyObject)) is not a valid JSON Object")
            }
        }
        return nil
    }
}
