import 'drainer.dart';
class Battery {
  double getBatteryLife(double capacity,double normalDrain,List<Drainer> drainers) {

    double totalDrain = normalDrain; // start with the normal drain amount

    // Add the extra drain from selected items
    for (int i = 0; i < drainers.length; i++) {
      if (drainers[i].isSelected) { // If a drainer is turned ON
        totalDrain += drainers[i].extraDrain; // Add its extra drain to totalDrain
      }
    }
    return capacity / totalDrain;//Battery life = how much battery you have ÷ how fast it's draining
  }

  double getChargeTime(double capacity,double chargeSpeed) {
    return capacity / chargeSpeed;// Charge time = how much battery you have ÷ how fast it charges
  }
}
