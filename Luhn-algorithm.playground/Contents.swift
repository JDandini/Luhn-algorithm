import UIKit

func validate(input: String?) -> Bool {
  guard let cardText = input, cardText.count >= 14 else { return false }
  var cardDigits: [Int] = cardText.compactMap { return Int($0.description) }
  // Luhn algorithm
  if let lastDigit = cardDigits.last {
    cardDigits.removeLast()

    let sum = cardDigits.reversed().enumerated().reduce(0) { result, current in
      var digit = current.element
      if current.offset % 2 == 0 {
        digit *= 2
        digit = digit > 9 ? digit - 9 : digit
      }

      return result + digit
    }

    if (sum+lastDigit) % 10 == 0 {
      return true
    }
  }
  return false
}

let card = "852328574"
validate(input: card)
