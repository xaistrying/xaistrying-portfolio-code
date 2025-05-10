String getLanguage(String? languageCode) {
  switch (languageCode) {
    case 'en':
      return 'English';
    case 'vi':
      return 'Tiếng Việt';
    default:
      return '';
  }
}
