//
//  TestZone.swift
//  Eudaimonia
//
//  Created by Aryan Khimani on 2023-10-26.
//

import SwiftUI

struct TestZone: View {
    @EnvironmentObject var sharedData: SharedData
    var calculatedScore: Int {
            let rawScore = sharedData.score * 4
            return min(rawScore, 100)
               }
    var calculatedScoreString: String {
           return String(calculatedScore)
       }
    var body: some View {
        Text(String(sharedData.score))
    }
}

#Preview {
    TestZone()
}
