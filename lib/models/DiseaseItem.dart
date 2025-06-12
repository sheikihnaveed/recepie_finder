

class DiseaseItem {
  final String time;
  final String item;
  final String quantity;
  final String? includes; // Optional

  DiseaseItem({
    required this.time,
    required this.item,
    required this.quantity,
    this.includes,
  });

  factory DiseaseItem.fromMap(Map<String, dynamic> map) {
    return DiseaseItem(
      time: map['time'] ?? '',
      item: map['item'] ?? '',
      quantity: map['quantity'] ?? '',
      includes: map['Includes'], // Optional field
    );
  }
}

