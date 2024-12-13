class ValidatorUtil {
  static String? validatorEmail(String? value) {
    // 앞뒤 공백을 제거했을때, 비어있다면
    if (value?.trim().isEmpty ?? true) {
      return "이메일을 입력해주세요";
    }
    // 이메일 검사(정규표현식)
    final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(value!)) {
      return '유효한 이메일이 아닙니다';
    }
    return null;
  }

  static String? validatorName(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return "이름을 입력해주세요";
    }
    if (value!.length < 2) {
      return '이름은 2글자 이상이어야 합니다';
    }
    return null;
  }

  static String? validatorPassword(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return "비밀번호를 입력해주세요";
    }
    final pwRegex = RegExp(r'^(?=.*[a-z])(?=.*\d)[a-z\d]{6,15}$');
    if (!pwRegex.hasMatch(value!)){
      return '비밀번호는 소문자, 숫자 포함 6자 이상 15자 이하여야 합니다';
    }
    return null;
  }
}
