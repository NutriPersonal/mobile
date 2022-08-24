import 'package:form_validator/form_validator.dart';

typedef EmailValidator = String? Function(String?);

class AppValidators {
  static String? Function(String?) email() {
    return ValidationBuilder()
        .email()
        .required()
        .minLength(5)
        .maxLength(50)
        .build();
  }

  static String? Function(String?) password() {
    return ValidationBuilder().required().minLength(8).maxLength(12).build();
  }

  static String? Function(String?) name() {
    return ValidationBuilder().required().minLength(3).maxLength(255).build();
  }
}
