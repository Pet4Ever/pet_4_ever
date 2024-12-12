class ValidatorUtil {
  static String? validatorId(String? value) {
    // 앞뒤 공백을 제거했을때, 비어있다면
    if (value?.trim().isEmpty ?? true) {
      return "아이디를 입력해주세요";
    }
    if (value!.length < 2) {
      return '아이디는 2글자 이상이어야 합니다';
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
    if (value!.length < 6) {
      return '비밀번호는 6글자 이상이어야 합니다';
    }
    return null;
  }
}
