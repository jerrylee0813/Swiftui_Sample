//
//  StateObjectAndObservedObject.swift
//  SwiftUI_Sample
//
//  Created by 이재홍 on 2024/06/13.
//

import SwiftUI

class CounterViewModel: ObservableObject {
    @Published var count = 0
    
    func increaseCount() {
        count += 1
    }
}

struct RandomNumberView: View {
    @State private var randomNumber = 0
    
    var body: some View {
        VStack {
            VStack {
                Text("Random: \(randomNumber)")
                Button("Generate Random Number") {
                    randomNumber = Int.random(in: 0..<100)
                }
            }
            
            StateObjectVSObservedObject()
                .padding()
        }
    }
}

struct StateObjectVSObservedObject: View {
    //@ObservedObject var viewModel = CounterViewModel()
    @StateObject var viewModel = CounterViewModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.count)")
            Button("Increase Count") {
                viewModel.increaseCount()
            }
        }
    }
}

#Preview {
    RandomNumberView()
}
