class EditableColumn<T> {
  final String key;
  final String title;
  final double? widthFactor;
  final bool? editable;

  EditableColumn({
    required this.key,
    required this.title,
    this.widthFactor,
    this.editable = true,
  });

  Type get typeOf => T;
}
