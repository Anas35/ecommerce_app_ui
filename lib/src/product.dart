import 'dart:ui';

class Product {

final int id;
final String photo;
final double cost;
final String name;
final double gram;
final int quantity;
final String description;

  Product({
    required this.id,
    required this.photo,
    required this.cost,
    required this.name,
    required this.gram,
    required this.quantity,
    required this.description
  });

  Product copyWith({String? photo, double? cost, String? name,
    double? gram, int? quantity, String? description }) {
    return Product(
      id: id,
      photo: photo ?? this.photo,
      cost: cost ?? this.cost,
      name: name ?? this.name,
      gram: gram ?? this.gram,
      quantity: quantity ?? this.quantity,
      description: description ?? this.description,
    );
  }

  @override
  String toString() => 'name: $name id: $id description: $description phone: $photo cost: $cost gram: $gram quantity: $quantity';

  @override
  bool operator ==(Object other) => other is Product && name == other.name
      && photo == other.photo && cost == other.cost
      && gram == other.gram && quantity == other.quantity
      && description == other.description && id == other.id;

  @override
  int get hashCode => hashValues(id, name, photo, cost, gram, quantity, description); 

}