class TypeAheadDataGroup<T> {
  final String title;
  final List<T> items;

  const TypeAheadDataGroup({
    required this.title,
    required this.items,
  });
  
  TypeAheadDataGroup copyWith({
    String? title,
    List<T>? items,
  }) {
    return TypeAheadDataGroup(
      title: title ?? this.title,
      items: items ?? this.items,
    );
  }
}
