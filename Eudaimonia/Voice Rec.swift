//
//  Voice Rec.swift
//  Eudaimonia
//
//  Created by Aryan Khimani on 2023-10-22.
//

import SwiftUI
/*
struct Results: View{
    @EnvironmentObject var sharedData: SharedData
    var calculatedScore: Int {
            let rawScore = sharedData.score * 4
            return min(rawScore, 100)
               }
    var calculatedScoreString: String {
           return String(calculatedScore)
       }
    
    var body: some View{
        
        NavigationView{
            
            VStack{
                HStack{
                    NavigationLink(destination: Homepage()) {
                        ZStack {
                            Image("Button_Forward")
                                .renderingMode(.original)
                        }
                    }
                    .padding(.top, 20)
                    .padding(.leading, 328)
                    .padding(.trailing, 35)
                }
                .padding(.top,50)
                ZStack{
                    Text("Results")
                        .font(.system(size: 40))
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(width: 341, alignment: .top)
                }
                ZStack{
                    Image("Results_drawing")
                    ZStack{
                        ZStack{
                            Circle()
                                .stroke(Color(red: 0.42, green: 0.39, blue: 1), lineWidth: 9)
                                .frame(width: 237, height: 237)
                            
                        }
                       
                        ZStack{
                            Text("78% ")
                                .font(
                                    Font.custom("Abhaya Libre", size: 64)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .frame(width: 157, alignment: .top)
                        }
                        .padding(.bottom,50)
                        ZStack{
                            Text("Stress Level")
                                .font(.system(size:32))
                                .bold()
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                            .frame(width: 204, alignment: .top)}
                        .padding(.top, 60)
                    }.padding(.bottom,80)
                }
                ZStack{
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 357, height: 394)
                      .background(.black)
                      .cornerRadius(30)
                      .shadow(color: .black.opacity(0.46), radius: 4, x: 5, y: 10)
                    ZStack{
                        ZStack{
                            Text("Work-Life Balance Score ⚖️")
                                .font(.system(size:20))
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.leading, 33)
                        ZStack{
                            Text("Moderate")
                                .font(.system(size:16))
                                .bold()
                                .foregroundColor(Color(red: 1, green: 0.94, blue: 0.39))
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.top, 53)
                        .padding(.leading, 33)
                        ZStack{
                            Text("- This metric evaluates how well an individual is\nmanaging their work and personal life. ")
                                .font(.system(size:14))
                                .foregroundColor(.white)
                                .frame(width: 341,height: 100, alignment: .topLeading)
                        }
                        .padding(.top, 183)
                        .padding(.leading, 33)
                    }
                    .padding(.bottom, 290)
                    ZStack{
                        ZStack{
                            Text("Physical Health Metrics 🏋️‍♂️")
                                .font(.system(size:20))
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.leading, 33)
                        ZStack{
                            Text("Strong Stress Factor")
                                .font(.system(size:16))
                                .bold()
                                .foregroundColor(Color(red: 1, green: 0.39, blue: 0.39))
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.top, 53)
                        .padding(.leading, 33)
                        ZStack{
                            Text("- This metric takes into account an individual's overall physical health,and including exercise.")
                                .font(.system(size:14))
                                .foregroundColor(.white)
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.top, 123)
                        .padding(.leading, 33)
                    }
                    .padding(.top, 190)
                    ZStack{
                        ZStack{
                            Text("Social Support Metrics 🤝")
                                .font(.system(size:20))
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.leading, 33)
                        ZStack{
                            Text("Average")
                                .font(.system(size:16))
                                .bold()
                                .foregroundColor(Color(red: 0.39, green: 0.85, blue: 1))
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.top, 53)
                        .padding(.leading, 33)
                        ZStack{
                            Text("- This metric is an individual's social support system, including the quality of relationships.")
                                .font(.system(size:14))
                                .foregroundColor(.white)
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.top, 133)
                        .padding(.leading, 33)
                    }
                    .padding(.bottom, 50)
                }.padding(.top,-144)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
 */
#Preview{
    Results()
}
