class FormValidators {
  FormValidators._();

  static String? email(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return 'Email wajib diisi';

    final emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailPattern.hasMatch(email)) return 'Format email tidak valid';

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Kata sandi wajib diisi';
    return null;
  }
}
