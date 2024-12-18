<p align="center">
  <img src="assets/images/mainLogo.svg" alt="App Logo" width="300">
</p>

# 우리4이 - 반려견 친구 찾기 플랫폼

반려견의 산책을 더욱 즐겁게! 새로운 친구를 만나보세요.<br>
GPS 기반으로 주변 강아지 친구들을 찾고, 채팅을 통해 산책 약속을 잡을 수 있습니다.

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

## 📸 애플리케이션 사용 예시

[우리4이 데모 vimeo 링크](https://vimeo.com/1040229873?share=copy)

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
│   │   │   │   ├── chat/      # 채팅
│   │   │   │   │   ├── chat_list_page.dart
│   │   │   │   │   └── chat_view_model.dart
│   │   │   │   ├── friends/   # 친구 찾기
│   │   │   │   │   ├── widgets/
│   │   │   │   │   │   ├── friends_item.dart
│   │   │   │   │   │   └── go_to_chat_button.dart
│   │   │   │   │   │
│   │   │   │   │   ├── friends_page.dart
│   │   │   │   │   └── friends_view_model.dart
│   │   │   │   │
│   │   │   │   └── mypage/    # 마이페이지
│   │   │   │   │   ├── widgets/
│   │   │   │   │   │   ├── add_profile_box.dart
│   │   │   │   │   │   ├──dog_grid_view_box.dart
│   │   │   │   │   │   └── dog_profile_box.dart
│   │   │   │   │   ├── my_page_view_model.dart
│   │   │   │   │   ├── my_page.dart
│   │   │   │   │   └── user_data_view_model.dart
│   │   │   ├── widgets/
│   │   │   │   └── home_button_navigation_bar.dart
│   │   │   ├── home_page.dart
│   │   │   └── home_view_model.dart
│   │   │
│   │   ├── chat_detail/                               
│   │   │   │   ├── chat_detail_page.dart
│   │   │   │   └── message_view_model.dart
│   │   │   └── widgets/
│   │   │       └── chat_detail_list_view.dart
│   │   │
│   │   ├── login_join/
│   │   │   │   ├── auth_view_model.dart
│   │   │   │   ├── join _page.dart
│   │   │   │   └── login_page.dart
│   │   │   ├── core/
│   │   │   │   └── validator_util.dart
│   │   │   └── widgets/
│   │   │   │   ├── email_text_form_field.dart
│   │   │   │   ├── name_text_form_field.dart
│   │   │   │   └── pw_text_form_field.dart
│   │   │   │
│   │   ├── map/
│   │   │   │   └── map_page.dart
│   │   └── profile/
│   │       │   └── pet_upload_page.dart
│   │       └── widgets/
│   │         └── selected_button/
│   │           │   ├── dog_age.dart
│   │           │   ├── dog_breeds.dart
│   │           │   └── selected_button.dart
│   │           ├── image_picker.dart
│   │           ├── text_input.dart
│   │           └── upload_button.dart
│   │
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

## 🛠️ 주요 기능 구현 코드 예시

### 1. 반려건 탐색 및 필터링 (FriendsRespository)

```
Future<List<Pet>?> getFilteredPetsByAddress(String userAddress) async {
  try {
    final collectionRef = firestore.collection('pet');
    final result = await collectionRef.get();
    final filteredPets = <Pet>[];

    for (final doc in result.docs) {
      final petData = doc.data();
      final ownerId = petData['owner_id'] as String;
      if (ownerId != null) {
        final userDoc = await firestore.collection('user').doc(ownerId).get();
        if (userDoc.exists) {
          final user = UserModel.fromJson({'id': userDoc.id, ...userDoc.data()!});
          if (user.address == userAddress) {
            final pet = Pet.fromJson({'id': doc.id, ...petData});
            filteredPets.add(pet);
          }
        }
      }
    }
    return filteredPets;
  } catch (e) {
    print('Error: $e');
    return [];
  }
}

```

### 2. 상태 관리 (FriendsViewModel)

```
class FriendViewModel extends AutoDisposeNotifier<List<Pet>> {
  final _friendRepo = FriendsRepository();
  final String userAddress;

  FriendViewModel(this.userAddress);

  @override
  List<Pet> build() {
    _initialize();
    return [];
  }

  Future<void> _initialize() async {
    try {
      final friends = await _friendRepo.getFilteredPetsByAddress(userAddress);
      state = friends ?? [];
    } catch (e) {
      print('친구 불러오기 실패: $e');
      state = [];
    }
  }
}

```

### 3. 사용자 위치 기반 UI 표시

```
final user = ref.watch(userDataViewModel); // 사용자 구독
Text('위치: ${user.address}');
```

## 🔊 설치 및 실행 방법

### 1. pet_4_ever 레포지토리 클론

`git clone git@github.com:Pet4Ever/pet_4_ever.git`
`cd pet_4_ever`

### 2. Firebase 설정

- 파이어베이스 프로젝트 생성
- `.env` 파일에 API key 값 등을 넣어 사용

### 3. 의존성 설치

`flutter pub get`

### 4. 앱 실행

`flutter run`

## 👯‍♂️ 프로젝트 팀원

- 권유진 https://github.com/UooUzzz
- 이현주 https://github.com/LeeHJuu
- 정유진 https://github.com/marofmar
- 추수현 https://github.com/suhyunChoo
- 황성필 https://github.com/0Ca-t0

## 📆 프로젝트 기간

12월 11일 수요일 ~ 12월 18일 수요일
