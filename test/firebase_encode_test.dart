import 'package:firebase_encode/firebase_encode.dart' as fbe;
import 'package:test/test.dart';

main() {
  group('FirebaseEncode', () {
    test('encodes .', () {
      expect(fbe.encode(r'a.a'), r'a%46a');
    });
    test(r'encodes $', () {
      expect(fbe.encode(r'a$a'), r'a%36a');
    });
    test(r'encodes [', () {
      expect(fbe.encode(r'a[a'), r'a%91a');
    });
    test(r'encodes ]', () {
      expect(fbe.encode(r'a]a'), r'a%93a');
    });
    test(r'encodes /', () {
      expect(fbe.encode(r'a/a'), r'a%47a');
    });
    test(r'encodes %', () {
      expect(fbe.encode(r'a%a'), r'a%37a');
    });

    test(r'decodes .', () {
      expect(fbe.decode(r'a%46a'), r'a.a');
    });
    test(r'decodes $', () {
      expect(fbe.decode(r'a%36a'), r'a$a');
    });
    test(r'decodes [', () {
      expect(fbe.decode(r'a%91a'), r'a[a');
    });
    test(r'decodes ]', () {
      expect(fbe.decode(r'a%93a'), r'a]a');
    });
    test(r'decodes /', () {
      expect(fbe.decode(r'a%47a'), r'a/a');
    });
    test(r'decodes %', () {
      expect(fbe.decode(r'a%37a'), r'a%a');
    });

    test('decode inverses encode', () {
      var string = r'.$[]/%';
      expect(string, fbe.decode(fbe.encode(string)));
    });
  });
}
