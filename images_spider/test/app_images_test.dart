import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:images_spider/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.home).existsSync(), true);
    expect(File(AppImages.like).existsSync(), true);
  });
}
