//
//  ContentView.swift
//  SwiftfulHapticsExample
//
//  Created by Nick Sarno on 5/19/24.
//

import SwiftUI
import SwiftfulHaptics

private struct HapticManagerKey: EnvironmentKey {
    static let defaultValue: HapticManager = HapticManager()
}

extension EnvironmentValues {
    var haptics: HapticManager {
        get { self[HapticManagerKey.self] }
        set { self[HapticManagerKey.self] = newValue }
    }
}
struct ContentView: View {
    
    @Environment(\.haptics) var haptics
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(HapticOption.allCases, id: \.rawValue) { option in
                    Button(option.rawValue.capitalized) {
                        Task {
                            try? await haptics.play(option: option)
                        }
                    }
                    .task {
                        try? await haptics.prepare(option: option)
                    }
                }
            }
            .navigationTitle("Haptic Options")
        }
        .onDisappear {
            Task {
                try? await haptics.tearDownAll()
            }
        }
    }
}

#Preview {
    ContentView()
}
