// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'WEAO';

  @override
  String get tabExploits => 'Эксплойты';

  @override
  String get tabVersions => 'Версии';

  @override
  String get searchHint => 'Поиск по названию...';

  @override
  String get noExploits => 'Эксплойты не найдены';

  @override
  String get noResults => 'Ничего не найдено';

  @override
  String get noFavorites => 'В избранном пока ничего нет';

  @override
  String get loading => 'Загрузка...';

  @override
  String get retry => 'Повторить';

  @override
  String get noVersions => 'Версии не найдены';

  @override
  String get filterAll => 'Все';

  @override
  String get filterFavorites => 'Избранное';

  @override
  String get addToFavorites => 'Добавить в избранное';

  @override
  String get removeFromFavorites => 'Убрать из избранного';

  @override
  String get updated => 'Обновлён';

  @override
  String get notUpdated => 'Не обновлён';

  @override
  String get detected => 'Детект';

  @override
  String get undetected => 'Без детекта';

  @override
  String get free => 'Бесплатный';

  @override
  String get paid => 'Платный';

  @override
  String get unc => 'UNC';

  @override
  String get sunc => 'sUNC';

  @override
  String get exploitDetails => 'Детали эксплойта';

  @override
  String get version => 'Версия';

  @override
  String get updatedDate => 'Дата обновления';

  @override
  String get robloxVersion => 'Версия Roblox';

  @override
  String get platform => 'Платформа';

  @override
  String get type => 'Тип';

  @override
  String get cost => 'Стоимость';

  @override
  String get features => 'Возможности';

  @override
  String get decompiler => 'Декомпилятор';

  @override
  String get multiInject => 'Мульти-инжект';

  @override
  String get keysystem => 'Ключ-система';

  @override
  String get clientMods => 'Обход client mods';

  @override
  String get raknet => 'Raknet';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Нет';

  @override
  String get website => 'Сайт';

  @override
  String get discord => 'Discord';

  @override
  String get purchase => 'Купить';

  @override
  String get versionsCurrent => 'Текущие';

  @override
  String get versionsFuture => 'Будущие';

  @override
  String get versionsPast => 'Прошлые';

  @override
  String get robloxVersions => 'Версии Roblox';

  @override
  String get windows => 'Windows';

  @override
  String get mac => 'Mac';

  @override
  String get android => 'Android';

  @override
  String get ios => 'iOS';

  @override
  String get suncTests => 'sUNC тесты';

  @override
  String get suncUnavailable => 'sUNC данные недоступны';

  @override
  String get suncPassed => 'Пройдено';

  @override
  String get suncFailed => 'Провалено';

  @override
  String get suncAll => 'Все';

  @override
  String get suncOutdated => 'Устаревшая сборка';

  @override
  String get suncTimeTaken => 'Время теста';

  @override
  String get suncExecutor => 'Эксплойт';

  @override
  String get suncReason => 'Причина';

  @override
  String cachedDataBanner(String date) {
    return 'Показаны сохранённые данные от $date. Нет сети или API недоступен.';
  }

  @override
  String rateLimitMessage(int seconds) {
    return 'Слишком много запросов. Повторите через $seconds сек.';
  }

  @override
  String get rateLimitGeneric => 'Слишком много запросов. Повторите позже.';

  @override
  String get timeoutError => 'Превышено время ожидания ответа';

  @override
  String get noConnection => 'Нет подключения к интернету';

  @override
  String get genericError => 'Не удалось загрузить данные';

  @override
  String get linkError => 'Не удалось открыть ссылку';

  @override
  String get tabSettings => 'Настройки';

  @override
  String get theme => 'Тема';

  @override
  String get language => 'Язык';

  @override
  String get clearCache => 'Очистить кэш';

  @override
  String get cacheCleared => 'Кэш очищен';
}
