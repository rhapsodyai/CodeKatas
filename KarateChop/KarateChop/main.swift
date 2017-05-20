//
//  main.swift
//  KarateChop
//
//  Created by Melissa Lynn Auclaire on 2017/05/18.
//  Copyright © 2017 StudioTriome. All rights reserved.
//

//Code Kata 2-1: Karate Chop
//Binary search tree (binary heap) implemented in Swift using Etzynger's method. Works for all binary trees of h >= 17. This is approx 134,000 nodes.

import Foundation

var a = [Int]();
var n:Int;


a = [20,10,30,5,15,25,35,2,8,10,20,20,30,30,40]

func chop(value: Int, array: [Int]) -> Bool{
    //right child of first index node
    //print(array[right(i: 0)])
    
    //left child of left child of first index node
    //print(array[left(i: left(i: 0))])
    
    
    var node = 0
    printStats(n: node, a: array)
    if(a[0] == value) {
        return true;
    }
    
    //for _ in 0 ..< numberOfLevels(a: array) {
    for count in 1 ..< 4 {
        
         if(count == 1) {
            //if search value greater than current node
            if(isGreaterThan(val1: value, val2: array[node])) {
                node = right(i: 0)
            } else {
                node = left(i: 0)
            }
            printStats(n: node, a: array)
        } else {
            if(isGreaterThan(val1: value, val2: array[node])) {
                node = right(i: node)
            } else {
                node = left(i: node)
            }
            printStats(n: node, a: array)
        }
        
        if(a[node] == value) {
            return true;
        }
    }
    return false;
}

func left(i: Int) -> Int {
    return 2*i + 1;
}

func right(i: Int) -> Int {
    return 2*i + 2;
}

func parent(i: Int) -> Int {
    return (i-1)/2;
}

func compare(val1: Int, val2: Int) -> Int {
    return val1-val2;
}

func isGreaterThan(val1: Int, val2: Int) -> Bool {
    if(val1 > val2) {
        return true;
    }
    return false;
}

func swap(val1: Int, val2: Int) {
    var temp = 0;
    temp = a[val1];
    a[val1] = a[val2];
    a[val2] = temp;
}

func bubbleUp(i: inout Int) {
    var p = parent(i: i);
    while (i > 0 && compare(val1: a[i], val2: a[p]) < 0) {
        swap(val1: i,val2: p);
        i = p;
        p = parent(i: i);
    }
}

func numberOfLevels(a: [Int]) -> Int {
    //maximum number of nodes is 2^h-1
    print("Tree height \(pow(2, a.count))")
    let twoh = pow(2, a.count) - 1
    let result = NSDecimalNumber(decimal: twoh)
    return Int(result)

}

func printStats(n: Int, a: [Int]) {
    print("Node index: \(n)")
    print("Node value: \(a[n])")
    print("")
}

print(chop(value:25, array:[20,10,30,5,15,25,35,2,8,10,20,20,30,30,40]))

print(numberOfLevels(a: a))
