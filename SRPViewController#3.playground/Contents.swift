import UIKit

class SRPViewController: UIViewController {
    
    struct NutrientCalculator {
        var caloriesCalculatorType: CaloriesCalculationType
        var proportionType: ProportionType

        func calculateDailyNutrients() -> Nutrients {
            let targetCalories = caloriesCalculatorType.rawValue
            var nutrients: Nutrients
            
            switch proportionType {
            case .paleo:
                // use calories to calculate
                // nutrients
                nutrients = Nutrients(carbs: 4, fats: 10, proteins: 8)
            case .keto:
                // use calories to calculate
                // nutrients
                nutrients = Nutrients(carbs: 6, fats: 1, proteins: 20)
            }
            return nutrients
        }
    }
    
    struct Nutrients {
        var carbs: Int
        var fats: Int
        var proteins: Int
    }
    
    enum CaloriesCalculationType: Int {
        case mifflin = 1200
        case harrisBenedict = 1400
    }
    
    enum ProportionType {
        case paleo
        case keto
    }
}
