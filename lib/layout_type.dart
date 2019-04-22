
enum LayoutType {
  news,
  translations,
  messages,
  friends,
  menu,
  webinars,
  conferentions,
  testing,
  details,
  support
}

String layoutName(LayoutType layoutType){
  switch(layoutType){
    case LayoutType.menu:
      return 'Еще';
    case LayoutType.news:
      return 'Новости';
    case LayoutType.translations:
      return 'Трансляции';
    case LayoutType.messages:
      return 'Сообщения';
    case LayoutType.friends:
      return 'Друзья';
    case LayoutType.webinars:
      return 'Вебинары';
    case LayoutType.conferentions:
      return 'Конференции';
    case LayoutType.testing:
      return 'Тестирование';
    case LayoutType.details:
      return 'Разборы';
    case LayoutType.support:
      return 'Поддержка';
    default:
      return '';
  }
}
String layoutIcon(LayoutType layoutType){
  switch(layoutType){
    case LayoutType.menu:
      return 'assets/icons/menu.png';
    case LayoutType.news:
      return 'assets/icons/news.png';
    case LayoutType.translations:
      return 'assets/icons/translations.png';
    case LayoutType.messages:
      return 'assets/icons/messages.png';
    case LayoutType.friends:
      return 'assets/icons/friends.png';
    case LayoutType.webinars:
      return 'assets/icons/webinars.png';
    case LayoutType.conferentions:
      return 'assets/icons/conferentions.png';
    case LayoutType.testing:
      return 'assets/icons/testing.png';
    case LayoutType.details:
      return 'assets/icons/details.png';
    case LayoutType.support:
      return 'assets/icons/support.png';
    default:
      return '';
  }
}