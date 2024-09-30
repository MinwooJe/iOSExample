//
//  main.swift
//  ConcurrencyProgramming
//
//  Created by 제민우 on 8/3/24.
//

import Foundation

func task(num: Int) {
    print("작업\(num): Hi")
    print("작업이 실행중인 스레드: \(Thread.current)")
    print("작업\(num): Bye\n")
}

let serialQueue = DispatchQueue(label: "Serial")
let concurrentQueue = DispatchQueue.global()
print("현재 스레드 \(Thread.current)\n\n")

// MARK: - Serial + Sync

//for i in 1...50 {
//    serialQueue.sync {
//        task(num: i)
//    }
//}

//// MARK: - Serial + Async
//for i in 1...50 {
//    serialQueue.async {
//        task(num: i)
//    }
//}

// MARK: - Concurrent + Sync
for i in 1...50 {
    concurrentQueue.sync {
        task(num: i)
    }
}

for i in 100...150 {
    task(num: i)
}
// MARK: - Concurrent + Async
//for i in 1...50 {
//    concurrentQueue.async {
//        task(num: i)
//    }
//}


RunLoop.current.run()
