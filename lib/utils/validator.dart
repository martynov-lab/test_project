class Validator {
  static String? validateQuery({required String query}) {
    if (query.isEmpty) {
      return 'Запрос не может быть пустым';
    }
    return null;
  }
}
