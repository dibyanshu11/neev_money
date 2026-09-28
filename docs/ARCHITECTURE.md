# Neev Money — Folder Structure & Architecture

Professional clean-architecture layout.

## Tree

```
lib/
├── main.dart                          # entry only
├── app/                               # app shell
│   ├── app.dart                       # MaterialApp
│   ├── di/
│   │   └── injection.dart             # wire UseCase ↔ Repository
│   └── router/
│       ├── app_router.dart            # RouteManager + NavigateTo
│       ├── route_names.dart
│       └── app_theme.dart
│
├── core/                              # shared, no feature logic
│   ├── constants/                     # colors, text styles, assets
│   ├── errors/                        # AppFailure, showAppFailure
│   ├── extensions/
│   ├── network/                       # Dio, ApiRequests, config, endpoints
│   └── utils/                         # toast, formatters, …
│
├── domain/                            # pure business (no Flutter/Dio)
│   ├── entities/                      # Fund, User, Portfolio, Sip, …
│   ├── repositories/                  # abstract contracts only
│   └── usecases/                      # AuthUseCase, FundUseCase
│
├── data/                              # implements domain
│   ├── datasources/
│   │   ├── local/                     # prefs, mocks, token
│   │   └── remote/
│   │       ├── auth/auth_apis.dart
│   │       └── fund/fund_apis.dart
│   ├── models/                        # ApiResponse DTO
│   └── repositories/                  # *RepositoryImpl
│
└── presentation/                      # UI
    ├── blocs/
    ├── screens/
    └── widgets/
```

## Flow

```
Screen → Bloc → UseCase → Repository (abstract)
                              ↓
                     RepositoryImpl → Datasource → ApiRequests → Dio
```

## Errors

```
Left(AppFailure) → showAppFailure() → toast (+ 401 → Splash)
```

## Navigation

```
In-flow (onboarding)  →  state.screen
App routes            →  NavigateTo.*
401 logout            →  showAppFailure
```

## Golden rules

1. `main.dart` only boots the app  
2. Domain never imports `data/` or `presentation/`  
3. Screens never call Dio / datasources  
4. Errors always go through `showAppFailure`  
5. Routes always go through `NavigateTo`  
