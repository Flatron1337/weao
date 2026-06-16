# Changelog

Все заметные изменения проекта документируются в этом файле.

Формат основан на [Keep a Changelog](https://keepachangelog.com/ru/1.1.0/).

## [Unreleased]

### Added
- Релизная подпись Android через `android/key.properties` с откатом на debug-подпись.
- Конфигурация базового URL и User-Agent через `--dart-define`.
- Логирование ошибок кеша и сетевых ошибок (раньше проглатывались молча).
- Юнит-тесты data-слоя (`Exploit`, `SuncData`, `RobloxVersions`, `CachedResult`).
- Изолированные виджет-тесты (файловый кеш / карточка эксплойта / баннер устаревших данных).
- Тесты `WeaoRepository` с фейковым API-клиентом.
- `LICENSE` (MIT), `README.md` с описанием проекта, `CHANGELOG.md`.
- Design tokens (`AppDimens`) для spacing/radii.

### Changed
- `WeaoApiClient` возвращает типизированные `Map`/`List` вместо `dynamic`.
- Детальный экран эксплойта использует переданный через роутинг объект вместо повторного запроса.
- Списки в детальном экране переведены на slivers (`CustomScrollView`) для ленивого построения.
- `analysis_options.yaml` — включены строгие lint-правила (`avoid_dynamic_calls`, `require_trailing_commas` и др.).

### Fixed
- `getExploit` теперь кешируется и обрабатывает ошибки (раньше падал без офлайн-фолбэка).
- Ошибки pull-to-refresh больше не показывают красный баннер (обёрнуты в try/catch).
- Race condition избранного — загрузка из `SharedPreferences` до `runApp`, без мерцания UI.
- `_parseInt` теперь парсит строковые числа (`"97"`), бейдж процента не пропадает.
- `CachedResult` инвариант: `cachedAt` непустой при `isStale: true` (assert).
- Убраны русские строки из слоя API (перенесены в `AppStrings`).

## [1.0.0] — базовая версия

Первый релиз: трекинг эксплойтов и версий Roblox, избранное, офлайн-кеш, sUNC-тесты.
