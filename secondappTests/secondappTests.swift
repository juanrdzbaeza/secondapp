//
//  secondappTests.swift
//  secondappTests
//
//  Created by Juan Rodríguez Baeza on 2/10/17.
//  Copyright © 2017 Juan Rodríguez Baeza. All rights reserved.
//

import XCTest
import UIKit
@testable import secondapp

class secondappTests: XCTestCase {
    /*
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
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
     */
    func testAmigo(){
        let posibleAmigo = Amigo(nombre: "Pepe", foto: nil, gAfinidad: 3)
        XCTAssertNotNil(posibleAmigo)
        
        let posibleAmigo2 = Amigo(nombre: "", foto: nil, gAfinidad: 3)
        XCTAssertNil(posibleAmigo2, "El nombre no puede estar vacío")
        
        let posibleAmigo3 = Amigo(nombre: "Pepe", foto: nil, gAfinidad: -2)
        XCTAssertNil(posibleAmigo3, "El gAfinidad no puede ser negativo...")
    }
    
}
