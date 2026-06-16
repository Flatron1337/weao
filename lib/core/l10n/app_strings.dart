import '../errors/weao_exception.dart';

abstract final class AppStrings {
  static const appTitle = 'WEAO';

  static const tabExploits = 'Эксплойты';
  static const tabVersions = 'Версии';

  static const searchHint = 'Поиск по названию...';
  static const noExploits = 'Эксплойты не найдены';
  static const noResults = 'Ничего не найдено';
  static const noFavorites = 'В избранном пока ничего нет';
  static const loading = 'Загрузка...';
  static const retry = 'Повторить';
  static const noVersions = 'Версии не найдены';

  static const filterAll = 'Все';
  static const filterFavorites = 'Избранное';
  static const addToFavorites = 'Добавить в избранное';
  static const removeFromFavorites = 'Убрать из избранного';

  static const updated = 'Обновлён';
  static const notUpdated = 'Не обновлён';
  static const detected = 'Детект';
  static const undetected = 'Без детекта';
  static const free = 'Бесплатный';
  static const paid = 'Платный';
  static const unc = 'UNC';
  static const sunc = 'sUNC';

  static const exploitDetails = 'Детали эксплойта';
  static const version = 'Версия';
  static const updatedDate = 'Дата обновления';
  static const robloxVersion = 'Версия Roblox';
  static const platform = 'Платформа';
  static const type = 'Тип';
  static const cost = 'Стоимость';
  static const features = 'Возможности';
  static const decompiler = 'Декомпилятор';
  static const multiInject = 'Мульти-инжект';
  static const keysystem = 'Ключ-система';
  static const clientMods = 'Обход client mods';
  static const raknet = 'Raknet';
  static const yes = 'Да';
  static const no = 'Нет';

  static const website = 'Сайт';
  static const discord = 'Discord';
  static const purchase = 'Купить';

  static const versionsCurrent = 'Текущие';
  static const versionsFuture = 'Будущие';
  static const versionsPast = 'Прошлые';
  static const robloxVersions = 'Версии Roblox';

  static const windows = 'Windows';
  static const mac = 'Mac';
  static const android = 'Android';
  static const ios = 'iOS';

  static const suncTests = 'sUNC тесты';
  static const suncUnavailable = 'sUNC данные недоступны';
  static const suncPassed = 'Пройдено';
  static const suncFailed = 'Провалено';
  static const suncAll = 'Все';
  static const suncOutdated = 'Устаревшая сборка';
  static const suncTimeTaken = 'Время теста';
  static const suncExecutor = 'Эксплойт';
  static const suncReason = 'Причина';

  static String cachedDataBanner(String date) =>
      'Показаны сохранённые данные от $date. Нет сети или API недоступен.';

  static String rateLimitMessage(int seconds) =>
      'Слишком много запросов. Повторите через $seconds сек.';
  static const rateLimitGeneric = 'Слишком много запросов. Повторите позже.';
  static const timeoutError = 'Превышено время ожидания ответа';
  static const noConnection = 'Нет подключения к интернету';
  static const genericError = 'Не удалось загрузить данные';
  static const linkError = 'Не удалось открыть ссылку';

  /// Maps an API error category to a user-facing message.
  static String messageFor(WeaoExceptionKind kind) {
    switch (kind) {
      case WeaoExceptionKind.rateLimited:
        return rateLimitGeneric;
      case WeaoExceptionKind.timeout:
        return timeoutError;
      case WeaoExceptionKind.noConnection:
        return noConnection;
      case WeaoExceptionKind.unknown:
        return genericError;
    }
  }
}
