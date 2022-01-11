//
//  ContentView.swift
//  calculatorApp
//
//  Created by karma on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    let buttons = [
        ["7","8","9","X"],
        ["4","5","6","-"],
        ["1","2","3","+"],
        ["0",".",".","="],
    ]
    var body: some View {
        ZStack(alignment: .bottom){
            Color.black
                .ignoresSafeArea()
            VStack ( spacing: 12){
                HStack{
                    Spacer()
                    Text("42").foregroundColor(Color.white).font(.system(size: 64))
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                    
                ForEach(buttons, id:  \.self){row in
                    HStack (spacing: 12){
                        ForEach(row, id: \.self){button in
                            Text(button)
                                .font(.system(size: 32))
                                .foregroundColor(Color.white)
                                .frame(width: self.buttonWidth(), height: self.buttonWidth())
                                .background(Color.gray)
                                .cornerRadius(50)
                        }
                }
                
    //                Text("8")
    //                    .font(.system(size: 32))
    //                Text("8")
    //                    .font(.system(size: 32))
    //                Text("8")
    //                    .font(.system(size: 32))
    //                Text("8")
    //                    .font(.system(size: 32))
                    
                }
            }
            .padding(.all)
        }
        
    }
    func buttonWidth()-> CGFloat{
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
