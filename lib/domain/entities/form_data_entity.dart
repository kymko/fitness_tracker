
class FormFieldData {
  final String id;
  final String name;
  final String? label;
  final String? hint;
  final String? initialValue;
  final String fieldType;
  final List<dynamic>? options;
  final bool? isRequired;
  final String? validationErrorMessage;

  FormFieldData({
    required this.id,
    required this.name,
    this.label,
    this.hint,
    this.initialValue,
    required this.fieldType,
    this.options,
    this.isRequired,
    this.validationErrorMessage,
  });

  factory FormFieldData.fromJson(Map<String, dynamic> json) {
    return FormFieldData(
      id: json['id'],
      name: json['name'],
      label: json['label'] ?? 'label',
      hint: json['hint'],
      initialValue: json['initialValue'],
      fieldType: json['fieldType'],
      options: json['options'],
      isRequired: json['isRequired'],
      validationErrorMessage: json['validationErrorMessage'],
    );
  }
}