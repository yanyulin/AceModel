import UIKit
import XCTest
import AceModel

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testAceModel() {
        let user = User()
        user.name = "张三"
        /*
        let dict: NSDictionary? = AceModel.aceModelToModel(inputModel: user, outputModel: NSDictionary())
        print(dict ?? "")
        */
        
        let str: String? = AceModel.aceModelToModel(inputModel: user, outputModel: nil)!
        print(str ?? "")
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
