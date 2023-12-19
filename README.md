# flutter-web-admin-template

flutter의 web을 사용해여 admin 페이지 제작의 기본 세팅파일 입니다.

## Getting Started

web build하기
```console
flutter build web
```

web 실행하기
```console
cd build/web
python3 -m http.server 8000
```

## 프로젝트 구조
```bash
.
├── core
│   ├── const
│   │   ├── color.dart
│   │   ├── data.dart
│   │   └── text_style.dart
│   ├── secure_storage
│   │   └── secure_storage.dart
│   ├── theme
│   │   └── application_theme.dart
│   └── utils
│       └── data_utils.dart
├── data
│   ├── common
│   │   └── dio
│   │       ├── dio.dart
│   │       ├── dio_client.dart
│   │       └── dio_client.g.dart
│   ├── model
│   └── repository
├── main.dart
└── presentation
    ├── common
    │   ├── component
    │   │   ├── custom_divider.dart
    │   │   └── login_text_form_field.dart
    │   ├── layout
    │   │   └── default_layout.dart
    │   └── router
    │       ├── go_router.dart
    │       └── navigation_provider.dart
    ├── dashboard
    │   └── view
    │       ├── dashboard_screen.dart
    │       └── statistics_screen.dart
    ├── intro
    │   └── view
    │       └── intro_screen.dart
    └── user
        ├── model
        │   └── user_model.dart
        ├── view
        │   └── login_screen.dart
        └── viewmodel
            └── user_provider.dart

```
