<p align="center">
  <img src="assets/images/mainLogo.svg" alt="App Logo" width="300">
</p>

# 우리4이 - 반려견 친구 찾기 플랫폼

반려견의 산책을 더욱 즐겁게! 새로운 친구를 만나보세요.<br>
GPS 기반으로 주변 강아지 친구들을 찾고, 채팅을 통해 산책 약속을 잡을 수 있답니다.

## 📚 프로젝트 소개

우리4이는 반려견과 보호자가 함께 산책을 즐기며 새로운 친구를 만날 수 있도록 도와주는 서비스입니다.

### 주요 기능

- **반려견 친구 찾기**: GPS 기반으로 위치 정보를 활용하여 내 주변 반려견만 내 피드에 노출됩니다.

- **반려견 프로필 관리**: 보호자가 강아지의 이름, 나이, 성별, 종 등을 입력하고 프로필을 설정할 수 있습니다.

- **반려견 프로필 노출 설정**: 강아지를 여러 마리 기르고 있지만, 오늘 산책 나갈 강아지는 한 마리라면? 집에서 쉬는 강아지들의 프로필을 숨길 수 있습니다.

- **소통을 위한 채팅 기능**: 관심 가는 반려견에게 채팅을 보내고 대화를 시작합니다.

## 🚀 주요 기술 스택

### 프론트엔드

- **Flutter**: Dart를 활용해서 크로스플랫폼 모바일 애플리케이션을 개발
- **Riverpod**: 상태 관리 및 데이터 흐름 제어

### 백엔드 & 데이터베이스

- **Firebase**: Firestore를 이용해 데이터 저장하고 Snapshot을 이용해 채팅 구현, Authentication을 사용해서 사용자 인증, Storage를 통해 사진 관리

### 기타

- **VWorld**: 위치 정보 사용

## 📂 프로젝트 구조

```
lib/
│
├── core/
│   └── geolocator_helper.dart # 위치 정보 사용
│
├── data/                      # 데이터 레이어
│   ├── model/                 # 데이터 모델 정의
│   │   ├── chat.dart          # Chat 모델 클래스
│   │   ├── message.dart       # Chat 내의 Message 모델 클래스
│   │   ├── pet.dart           # Pet 모델 클래스
│   │   └── user_model.dart    # User 모델 클래스
│   │
│   └── repository/            # 데이터 관리 및 CRUD
│       ├── auth_repository.dart
│       ├── chat_repository.dart
│       ├── friends_repository.dart
│       ├── message_repository.dart
│       ├── my_page_repository.dart
│       ├── user_repository.dart
│       └── vworld0_repository.dart
│
├── ui/                        # UI 레이어
│   ├── pages/                 # 페이지별 UI 화면
│   │   ├── home/              # 홈 탭
│   │   │   ├── _tab/          # 탭별 화면
│   │   │   │   ├── friends/   # 친구 찾기
│   │   │   │   └── mypage/    # 마이페이지
│   │   └── login_join/        # 로그인 화면
│   │
│   └── widgets/               # 재사용 가능한 위젯들
│       ├── dog_snack_bar.dart # 로그인 관련 알림 스낵바
│       └── logo_text.dart
│
├── constant.dart              # 고정 주소 (asset logo등을 변수화)
├── firebase_options.dart      # 파이어베이스 설정
├── theme.dart                 # 앱 테마 정의
├── user_data.dart             # 사용자 데이터
└── main.dart                  # 앱 시작점
```
