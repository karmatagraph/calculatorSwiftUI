//
//  ContentView.swift
//  calculatorApp
//
//  Created by karma on 1/11/22.
//

import SwiftUI
enum CalculatorButtons: String {
    case zero, one, two, three, four, five, six, seven, eight, nine, dot
    case equals, plus, minus, multiply, divide
    case ac, plusMinus, percent
    
    var title: String {
        switch self {
        case .dot:
            return "."
        case .zero:
            return "0"
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .equals:
            return "="
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .multiply:
            return  "×"
        case .divide:
            return "÷"
        case .ac:
            return "AC"
        case .plusMinus:
            return "±"
        case .percent:
            return "%"
        default:
            return "AC"
        }
    }
    
    var backgroundColor : Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .dot:
            return Color(.darkGray)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        default :
            return Color(.orange)
        
        }
    }
    
    
    
}

//create an environment object
// you can treat this as a global application state
class GlobalEnvironment: ObservableObject {
    @Published var display = "0"
    
    // func will recieve buttons as param and according to it we will run dif funcs
    func recieveInputButtons(calculatorButtons: CalculatorButtons) {
        display = calculatorButtons.title
    }
    
}



struct ContentView: View {
    @EnvironmentObject var env: GlobalEnvironment
    
    let buttons:[[CalculatorButtons]] = [
        [.ac,.plusMinus,.percent,.divide],
        [.seven,.eight,.nine,.multiply],
        [.four,.five,.six,.minus],
        [.one,.two,.three,.plus],
        [.zero,.dot,.equals],
    ]
    var body: some View {
        ZStack(alignment: .bottom){
            Color.black
                .ignoresSafeArea()
            VStack ( spacing: 12){
                HStack{
                    Spacer()
                    Text(env.display).foregroundColor(Color.white).font(.system(size: 64))
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                    
                ForEach(buttons, id:  \.self){row in
                    
                    HStack (spacing: 12){
                        ForEach(row, id: \.self){button in
                            // all the buttons are iterating so also encapsulate inside a button
                            CalculatorButtonView(button: button)
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
    
}

// Refactoring the view to a subview
struct CalculatorButtonView: View {
    var button: CalculatorButtons
    @EnvironmentObject var env: GlobalEnvironment
    
    
    var body: some View{
        Button(action: {
            self.env.recieveInputButtons(calculatorButtons: button)
    //                                self.env.display = button.title
        }){ // the view of the button
                Text(button.title)
                    .font(.system(size: 32))
                    .foregroundColor(Color.white)
                    .frame(width: self.buttonWidth(button: button), height: (UIScreen.main.bounds.width - 5 * 12) / 4)
                    .background(button.backgroundColor)
                    .cornerRadius(self.buttonWidth(button: button))
        }
    }
    
    private func buttonWidth(button: CalculatorButtons)-> CGFloat{
        if button == .zero{
            return (UIScreen.main.bounds.width - 4 * 12) / 4*2
        }
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}
