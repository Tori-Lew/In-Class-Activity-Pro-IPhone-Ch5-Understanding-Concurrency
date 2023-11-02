//
//  ContentView.swift
//  In-Class Activity Pro IPhone Ch5 Understanding Concurrency
//
//  Created by Student Account on 11/1/23.
//

import SwiftUI

import SwiftUI
struct ContentView: View {
    @State var message = ""
    @State var results = ""
    @State var sliderValue = 0.0
    var body: some View {
        VStack {
            Button("Click Me") {
                let startTime = NSDate()
                let fetchedData = fetchSomethingFromServer()
                let processedData = processData(fetchedData)
                let firstResult = calculateFirstResult(processedData)
                let secondResult = self.calculateSecondResult(processedData)
                let resultsSummary =
                "First: [\(firstResult)]\nSecond: [\(secondResult)]"
                results = resultsSummary
                let endTime = NSDate()
                message = "Completed in \(endTime.timeIntervalSince(startTime as Date)) seconds"
            }
            TextEditor(text: $results)
            Slider(value: $sliderValue)
            Text("Message = \(message)")
        }
    }
    func fetchSomethingFromServer() -> String {
        Thread.sleep(forTimeInterval: 2)
        return "I enjoy reading"
    }


    func processData(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 2)
        return data.uppercased()
    }
    func calculateFirstResult(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 2)
        let message = "Number of chars: \(String(data).count)"
        return message
    }
    func calculateSecondResult(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 2)
        return data.replacingOccurrences(of: "E", with: "e")
    }
}

#Preview {
    ContentView()
}
