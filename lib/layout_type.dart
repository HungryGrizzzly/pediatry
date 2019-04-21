
enum LayoutType {
  news,
  translations,
  messages,
  friends
}

String layoutName(LayoutType layoutType){
  switch(layoutType){
    case LayoutType.news:
      return 'Новости';
    case LayoutType.translations:
      return 'Трансляции';
    case LayoutType.messages:
      return 'Сообщения';
    case LayoutType.friends:
      return 'Друзья';
    default:
      return '';
  }
}
String layoutIcon(LayoutType layoutType){
  switch(layoutType){
    case LayoutType.news:
      return 'assets/icons/news.png';
    case LayoutType.translations:
      return 'assets/icons/translations.png';
    case LayoutType.messages:
      return 'assets/icons/messages.png';
    default:
      return '';
  }
}