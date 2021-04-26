//
//  ContentView.swift
//  Slots App
//
//  Created by Szikszai Konrád on 2021. 04. 12..
//

import SwiftUI

struct ContentView: View {
    
    private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [1, 2, 0]//number represent the states of symbols from 0 to 2 (hit spin and randomise a number representing one of 3 symbols)
    @State private var credits = 1000
    private var betAmount = 5
    
    var body: some View {
        ZStack {
            
           //background
            Rectangle()
                .foregroundColor(.blue)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Rectangle()
                .padding(4.0)
                .foregroundColor(.green)
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                
                Spacer()
                
                //title
                HStack{
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("SwiftUI Slots")
                        .font(.title2)
                        .foregroundColor(Color.white)
                        
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(1)
                
                Spacer()
                
                //credits counter
                
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                //cards
                HStack{
                    Spacer()
                    Image(symbols[numbers[0]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Image(symbols[numbers[1]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Image(symbols[numbers[2]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Spacer()
                }
                Spacer()
                //button
                Button(action: {
                    
                    //change the images
                    self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                    
                    self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                    
                    self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                    
                    //check winnings
                    if self.numbers[0] == self.numbers[1] &&
                        self.numbers[1] == self.numbers[2]{
                        
                        //won
                        self.credits += self.betAmount * 10
                        }
                    else {
                        self.credits -= self.betAmount
                    }
                    
                }){
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(Color.pink)
                        .cornerRadius(20)
                }
                
                Spacer()
                    
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
