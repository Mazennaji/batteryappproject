class Drainer {
  String name;       // public attribute
  double extraDrain; // extra battery drain per hour
  bool isSelected;   // is it turned on?

  // Constructor
  Drainer({
    required this.name,
    required this.extraDrain,
    this.isSelected = false,
  });

  // Toggle the drainer on/off
  void toggle() {
    isSelected = !isSelected;
  }
}
