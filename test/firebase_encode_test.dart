import 'package:firebase_encode/firebase_encode.dart';
import 'package:logging/logging.dart';
import 'package:logging_handlers/logging_handlers_shared.dart';
import 'package:test/test.dart';

main() {
  hierarchicalLoggingEnabled = true;
  Logger.root.onRecord.listen(new LogPrintHandler());
  Logger.root.level = Level.INFO;

  group('FirebaseEncode', () {});
}
