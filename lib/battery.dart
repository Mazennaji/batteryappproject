import 'drainer.dart';

class Battery {
  double capacity;      // total battery capacity
  double normalDrain;   // base drain rate per hour
  List<Drainer> drainers; // list of optional drainers

  // Constructor
  Battery({
    required this.capacity,
    required this.normalDrain,
    List<Drainer>? drainers,
  }) : drainers = drainers ?? [];

  // Add a drainer to the battery
  void addDrainer(Drainer drainer) {
    drainers.add(drainer);
  }

  // Calculate total drain including selected drainers
  double _calculateTotalDrain() {
    double total = normalDrain;
    for (var drainer in drainers) {
      if (drainer.isSelected) {
        total += drainer.extraDrain;
      }
    }
    return total;
  }

  // Public method to get battery life in hours
  double getBatteryLife() {
    double totalDrain = _calculateTotalDrain();
    return capacity / totalDrain;
  }

  // Public method to get charging time in hours
  double getChargeTime(double chargeSpeed) {
    return capacity / chargeSpeed;
  }

  // Display battery info
  void displayInfo() {
    print("Battery Capacity: $capacity mAh");
    print("Normal Drain: $normalDrain mAh/hour");
    print("Selected Drainers:");
    for (var drainer in drainers) {
      if (drainer.isSelected) {
        print("- ${drainer.name} (+${drainer.extraDrain} mAh/hour)");
      }
    }
    print("Estimated Battery Life: ${getBatteryLife().toStringAsFixed(2)} hours");
  }
}
