import 'package:flutter_typeahead/flutter_typeahead.dart';

class MapData {
  final String value;
  final String label;

  const MapData({
    required this.value,
    required this.label,
  });
}

List<TypeAheadDataGroup<MapData>> dataGroup = [
  TypeAheadDataGroup(
    title: 'Header 1',
    items: [
      MapData(value: 'abc', label: 'abc'),
      MapData(value: 'tuyen', label: 'tuyen'),
    ],
  ),
  TypeAheadDataGroup(
    title: 'Header 2',
    items: [
      MapData(value: 'hoang', label: 'hoang'),
      MapData(value: 'phuong', label: 'phuong'),
      MapData(value: 'duy', label: 'duy'),
      MapData(value: 'thien', label: 'thien'),
    ],
  ),
  TypeAheadDataGroup(
    title: 'Header 3',
    items: [
      MapData(value: 'abc', label: 'abc'),
      MapData(value: 'duy', label: 'duy'),
      MapData(value: 'thien', label: 'thien'),
    ],
  ),
];
