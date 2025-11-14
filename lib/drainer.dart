class Drainer {
  bool isSelected;   // true if this drainer is ON
  double extraDrain; // extra battery drain per hour

  // Constructor
  Drainer({
    required this.isSelected,
    required this.extraDrain,
  });
}
