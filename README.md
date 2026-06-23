# WEAO

**WEAO** — трекер эксплойтов и версий Roblox. Неофициальный клиент для API [`https://weao.xyz`](https://weao.xyz): статусы эксплойтов, sUNC-тесты, текущие / будущие / прошлые версии Roblox по платформам, избранные эксплойты и офлайн-кеш.

Приложение поддерживает светлую и тёмную темы (Material 3 + Dynamic Color), а также переведено на несколько языков (Русский, Английский) с помощью официального пакета `flutter_localizations`.

## Что нового (Последние изменения)

- **Офлайн-первая архитектура (Hive CE)**: Полный переход на молниеносную NoSQL базу данных `hive_ce` для хранения избранного и кеширования ответов API. Приложение работает моментально даже без интернета.
- **Sentry.io**: Автоматический трекинг ошибок, зависаний интерфейса и сбор метрик производительности.
- **Сетевая отказоустойчивость**: Внедрен умный механизм повторных запросов (Smart Retries) на базе `dio_smart_retry`.
- **UI Анимации**: Интегрирован `flutter_animate` для гладких микро-анимаций интерфейса (fade-in карточек, shimmer-эффекты при загрузке).
- **Riverpod 3.0 & Кодогенерация**: Полный переход на `@riverpod` и `riverpod_generator` для безопасного DI и управления состоянием.
- **Freezed & JSON Serializable**: Модели данных (`Exploit`, `SuncData`, `RobloxVersions`) теперь используют `freezed` для иммутабельности и кодогенерации `fromJson`/`toJson`, исключая ошибки ручного парсинга.
- **CI/CD пайплайн**: Автоматический прогон линтера, тестов и сборка APK через GitHub Actions.

## Технологии

- **Flutter** / **Dart** `^3.0`
- **Riverpod 3.3** (`riverpod_annotation`, `riverpod_generator`) — управление состоянием и DI.
- **Freezed** (`freezed_annotation`, `freezed 3.2.5`) — генерация иммутабельных классов и sealed unions.
- **Hive CE** — сверхбыстрая NoSQL БД для хранения кеша и локальных данных.
- **go_router 17** — декларативная навигация (`StatefulShellRoute`).
- **Dio + Smart Retry** — HTTP-клиент с таймаутами и автоматическими повторами.
- **Sentry** — мониторинг крэшей и перфоманса.
- **flutter_animate** — декларативные анимации UI.

## Структура проекта

```
lib/
├── main.dart                  # bootstrap: Инициализация Sentry, Hive, DI
├── app.dart                   # WeaoApp (GoRouter, Тема, Локализация)
├── core/
│   ├── api/                   # WeaoApiClient (Dio + Smart Retry + Logger)
│   ├── errors/                # WeaoException
│   ├── l10n/                  # Устаревшие хардкод-строки (AppStrings)
│   └── theme/                 # AppTheme (Material 3 + dynamic_color)
├── data/
│   ├── database/              # HiveService (инициализация коробок Hive CE)
│   ├── local/                 # LocalStorageService (офлайн кеш на базе Hive)
│   ├── models/                # Exploit, RobloxVersions, SuncData (Freezed)
│   └── repositories/          # WeaoRepository — офлайн-фёрст логика
├── l10n/                      # .arb файлы для генерации AppLocalizations
└── presentation/
    ├── providers/             # Сгенерированные Riverpod-провайдеры (@riverpod)
    ├── screens/               # shell + exploits + versions + settings
    └── widgets/               # переиспользуемые виджеты (в т.ч. Shimmer)
```

## Запуск и разработка

Поскольку проект активно использует кодогенерацию (`freezed`, `riverpod_generator`, `json_serializable`), перед запуском необходимо сгенерировать `.g.dart` файлы:

```bash
# 1. Скачиваем зависимости
flutter pub get

# 2. Запускаем кодогенерацию (один раз)
dart run build_runner build -d

# (или запускаем watch для авто-генерации при изменениях кода)
dart run build_runner watch -d

# 3. Запускаем проект
flutter run
```

## Тесты и анализ

```bash
flutter test         # unit + виджет-тесты
dart analyze .       # статический анализ (должно быть 0 warnings)
```

## Сборка релиза

### Release signing (Android)

Релизная сборка по умолчанию подписывается debug-ключом. Для публикации сгенерируйте собственный keystore и создайте файл секретов:

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

## Лицензия

MIT — см. [LICENSE](LICENSE).

## История обновлений

Полный список изменений, новых функций и исправлений доступен в файле [CHANGELOG.md](CHANGELOG.md).
