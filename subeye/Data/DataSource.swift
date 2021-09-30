//
//  DataSource.swift
//  subeye
//
//  Created by 고준혁 on 2021/09/27.
//

import UIKit


class imageset {
    
    let imagetime: String
    
    let outNumber: Int
    
    let suspicion: Int
    
    let complete: Bool = false
    
    init(imagetime: String, outNumber: Int, suspicion: Int) {
        self.imagetime = imagetime
        self.outNumber = outNumber
        self.suspicion = suspicion
    }
    
    
    
    
    static func generateData() -> [imageset] {
        return [imageset(imagetime: "02-04 19:53", outNumber: 1,suspicion: 20),imageset(imagetime: "02-05 19:54", outNumber: 2,suspicion: 10),
                imageset(imagetime: "02-06 19:23", outNumber: 3,suspicion: 30),imageset(imagetime: "02-07 19:35", outNumber: 4,suspicion: 30),
                imageset(imagetime: "02-08 19:42", outNumber: 5,suspicion: 40),imageset(imagetime: "02-09 19:26", outNumber: 6,suspicion: 30),
                imageset(imagetime: "02-10 19:54", outNumber: 7,suspicion: 50),imageset(imagetime: "02-11 19:31", outNumber: 8,suspicion: 40),
                imageset(imagetime: "02-12 19:64", outNumber: 9,suspicion: 60),imageset(imagetime: "02-13 19:42", outNumber: 10,suspicion: 10)]
    }
}
