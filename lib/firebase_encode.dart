library firebase_encode;

String encode(String key) {
  return key.replaceAllMapped(new RegExp(r'[\.\$\#\[\]/%]'),
      (match) => '%${match.group(0).codeUnitAt(0)}');
}

String decode(String key) {
  var codeToChar = {
    '%46': r'.',
    '%36': r'$',
    '%91': r'[',
    '%93': r']',
    '%47': r'/',
    '%37': r'%'
  };
  return key.replaceAllMapped(new RegExp(r'%46|%36|%91|%93|%47|%37'),
      (match) => codeToChar[match.group(0)]);
}
