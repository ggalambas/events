import 'package:flutter/material.dart';

class IdObject {
  final String id;
  final String name;

  const IdObject({@required this.id, @required this.name});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is IdObject && o.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Id($id), Name($name)';
}
