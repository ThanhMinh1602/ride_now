class ValidateUtils {
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'Vui lòng nhập $fieldName';
    }
    return null;
  }

  static String? validateName(String? value, {int minLength = 2}) {
    final String? requiredError = validateRequired(value, 'tên');
    if (requiredError != null) return requiredError;

    if (value!.length < minLength) {
      return 'Tên phải dài ít nhất $minLength ký tự';
    }

    if (!RegExp(r'^[a-zA-ZÀ-ỹ\s0-9]+$').hasMatch(value)) {
      return 'Tên chỉ được chứa chữ cái, số và khoảng trắng';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    final String? requiredError = validateRequired(value, 'số điện thoại');
    if (requiredError != null) return requiredError;

    if (!RegExp(r'^0\d{9}$').hasMatch(value!)) {
      return 'Số điện thoại phải có 10 chữ số và bắt đầu bằng 0';
    }

    return null;
  }

  static String? validatePassword(
    String? value, {
    bool requireSpecialChar = false,
  }) {
    final String? requiredError = validateRequired(value, 'mật khẩu');
    if (requiredError != null) return requiredError;

    if (value!.length < 6) {
      return 'Mật khẩu phải dài ít nhất 6 ký tự';
    }

    if (requireSpecialChar &&
        !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Mật khẩu phải chứa ít nhất một ký tự đặc biệt';
    }

    return null;
  }

  static String? validateLicensePlate(String? value) {
    final String? requiredError = validateRequired(value, 'biển số xe');
    if (requiredError != null) return requiredError;

    if (!RegExp(
      r'^\d{2}[A-Z]-\d{4,5}$|^\d{2}[A-Z]-\d{3}\.\d{2}$',
    ).hasMatch(value!)) {
      return 'Biển số xe không hợp lệ (VD: 51A-12345 hoặc 51A-123.45)';
    }

    return null;
  }

  static String? validateDropdown(String? value, String fieldName) {
    if (value == null) {
      return 'Vui lòng chọn $fieldName';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final String? requiredError = validateRequired(value, 'email');
    if (requiredError != null) return requiredError;

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
      return 'Email không hợp lệ';
    }

    return null;
  }
}
