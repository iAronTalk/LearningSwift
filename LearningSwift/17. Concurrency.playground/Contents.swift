import UIKit

/*
 * 感觉整体就是一个大大的不是很明白，哎。再学习吧。
 **/
//1.func listPhotos(inGallery name: String) async -> [String] {
//    let result = // ... some asynchronous networking code ...
//    return result
//}

/*
 * 2.For a function or method that’s both asynchronous and throwing, you write async before throws.
 */

//let photoNames = await listPhotos(inGallery: "Summer Vacation")
//let sortedNames = photoNames.sorted()
//let name = sortedNames[0]
//let photo = await downloadPhoto(named: name)
//show(photo)

// 3,因为会阻塞线程，所以一般情况只有三种情况可以使用wait。
/*
 Code in the body of an asynchronous function, method, or property.
 Code in the static main() method of a structure, class, or enumeration that’s marked with @main.
 Code in a detached child task, as shown in Unstructured Concurrency below.
 */

// 4.Asynchronous Sequences

//import Foundation
//let handle = FileHandle.standardInput
//for try await line in handle.bytes.lines {
//    print(line)
//}

// 5.Calling Asynchronous Functions in Parallel

//async let firstPhoto = downloadPhoto(named: photoNames[0])
//async let secondPhoto = downloadPhoto(named: photoNames[1])
//async let thirdPhoto = downloadPhoto(named: photoNames[2])
//
//let photos = await [firstPhoto, secondPhoto, thirdPhoto]
//show(photos)

// 6.Tasks and Task Groups
//await withTaskGroup(of: Data.self) { taskGroup in
//    let photoNames = await listPhotos(inGallery: "Summer Vacation")
//    for name in photoNames {
//        taskGroup.addTask { await downloadPhoto(named: name) }
//    }
//}

// 7.Unstructured Concurrency
let task = Task.init(priority: TaskPriority.low) {
    
}

let task2 = Task.detached(priority: TaskPriority.high) {
    
}

task.cancel()

// 8.Actors

// Like classes, actors are reference types, actors allow only one task to access their mutable state at a time, which makes it safe for code in multiple tasks to interact with the same instance of an actor.

// 9.Actors
