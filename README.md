# WEAO

**WEAO** — трекер эксплойтов и версий Roblox. Неофициальный клиент для API
[`https://weao.xyz`](https://weao.xyz): статусы эксплойтов, sUNC-тесты, текущие /
будущие / прошлые версии Roblox по платформам, избранные эксплойты и офлайн-кеш.

Приложение только на тёмной теме, интерфейс — на русском языке.

## Технологии

- **Flutter** / **Dart** `^3.12`
- **Riverpod 2** — управление состоянием и DI
- **go_router 14** — декларативная навигация (`StatefulShellRoute` с двумя
  вкладками + детальный экран поверх root navigator)
- **Dio** — HTTP-клиент с таймаутами и маппингом ошибок в `WeaoException`
- **shared_preferences** + файловый JSON-кеш (`path_provider`) — офлайн-фолбэк
  через обёртку `CachedResult<T>` (`{data, isStale, cachedAt, error}`)

## Структура проекта

```
lib/
├── main.dart                  # bootstrap: SharedPreferences → ProviderScope
├── app.dart                   # WeaoApp + GoRouter-конфиг
├── core/
│   ├── api/                   # WeaoApiClient (Dio-обёртка)
│   ├── errors/                # WeaoException
│   ├── l10n/                  # AppStrings — UI-строки (русский)
│   └── theme/                 # AppTheme (Material 3 dark)
├── data/
│   ├── local/                 # LocalStorageService (favorites + JSON-кеш)
│   ├── models/                # Exploit, RobloxVersions, SuncData, CachedResult
│   └── repositories/          # WeaoRepository — офлайн-фёрст логика
└── presentation/
    ├── providers/             # Riverpod-провайдеры (DI + state)
    ├── screens/               # shell + exploits + versions
    └── widgets/               # переиспользуемые виджеты
```

Слоистая (clean-lite) архитектура: `core` / `data` / `presentation`. Riverpod
выступает DI-контейнером (нет `get_it`).

## Запуск

```bash
flutter pub get
flutter run
```

Минимальные требования — Flutter `>=3.44`, Dart `^3.12`.

## Тесты

```bash
flutter test         # unit + виджет-тесты (без сети)
flutter analyze      # статический анализ, ожидается 0 warnings
```

## Сборка релиза

### Release signing (Android)

Релизная сборка по умолчанию подписывается debug-ключом. Для публикации
сгенерируйте собственный keystore и создайте файл секретов:

1. Сгенерируйте keystore (один раз):

   ```bash
   keytool -genkey -v -keystore android/app/release-keystore.jks \
     -keyalg RSA -keysize 2048 -validity 10000 -alias weao
   ```

2. Создайте `android/key.properties` (**он в `.gitignore`, не коммитить!**):

   ```properties
   storePassword=********
   keyPassword=********
   keyAlias=weao
   storeFile=app/release-keystore.jks
   ```

3. Соберите релиз:

   ```bash
   flutter build apk --release
   # или app-bundle для Google Play:
   flutter build appbundle --release
   ```

Если `key.properties` отсутствует, сборка автоматически откатывается на
debug-подпись (удобно для локального `flutter run --release`).

### Конфигурация окружения (опционально)

Базовый URL API и User-Agent можно переопределить через `--dart-define`
(дефолты: `https://weao.xyz`, `WEAO-3PService`):

```bash
flutter run \
  --dart-define=WEAO_API_BASE_URL=https://staging.weao.xyz \
  --dart-define=WEAO_USER_AGENT=WEAO-3PService-dev
```

## Локализация

Сейчас интерфейс только на русском, строки вынесены в `lib/core/l10n/app_strings.dart`
как константы. Полноценная i18n (`.arb` / `intl`) не подключена — это отдельная
задача.

## Лицензия

MIT — см. [LICENSE](LICENSE).
