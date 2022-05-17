import SwiftUI

struct ContentView: View {
  @State var dice: [Int]? = nil
  @State var numberOfDice = 2
  
  let generator = UINotificationFeedbackGenerator()
  
  var body: some View {
    ZStack {
      background
      
      VStack(spacing: 40) {
        Text("DYCE ROLL")
          .font(.system(size: 60))
          .fontWeight(.bold)
          .foregroundColor(.modernBlue)
          .padding(.bottom, 20)
        
        if let dice = dice {
          ForEach(0 ..< dice.count, id: \.self) { i in
            HStack {
              Image(systemName: "die.face.\(dice[i])")
                .resizable()
                .frame(width: 100, height: 100)
            }
          }
        } else {
          VStack {
            Image("dice-in-motion")
              .resizable()
              .frame(width: 100, height: 100)
            Text("Click below to roll dice.")
          }
        }
        
        rollButton
       
        HStack{
          Button(action: decrementDice) {
            Image(systemName: "minus.circle")
              .resizable()
              .frame(width: 30, height: 30)
              .foregroundColor(numberOfDice <= 1 ? .gray : .modernBlue)
          }
          .disabled(numberOfDice <= 1)
          
          Text("\(numberOfDice) dice")
            .font(.title)
          
          Button(action: incrementDice) {
            Image(systemName: "plus.circle")
              .resizable()
              .frame(width: 30, height: 30)
              .foregroundColor(numberOfDice >= 6 ? .gray : .modernBlue)
          }
          .disabled(numberOfDice >= 6)
        }
      }
    }
  }
  
  var background: some View {
    Image("background-wall")
      .resizable(resizingMode: .tile)
      .edgesIgnoringSafeArea(.all)
  }
  
  var rollButton: some View {
    Button(action: rollDice) {
      Text("Roll Dice")
        .font(.title)
        .padding(.vertical, 20)
        .padding(.horizontal, 40)
        .foregroundColor(.modernBlue)
        .background(
          RoundedRectangle(cornerRadius: 20)
            .stroke(Color.modernBlue, lineWidth: 3)
            .background(Color.white)
        )
    }
  }
  
  func rollDice() {
    var newDice: [Int] = [] //we create a state variable. System then knows it has to update the body.
    for _ in 1...numberOfDice {
      newDice.append(Int.random(in: 1...6))
    }
    self.dice = newDice

    generator.notificationOccurred(.success)
  }
  
  func decrementDice() {
    numberOfDice -= 1
  }
  
  func incrementDice() {
    numberOfDice += 1
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
