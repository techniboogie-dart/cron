// Copyright (c) 2017, nitehogg. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:cron/cron.dart';
import 'package:test/test.dart';

void main() {

  group('Cron wildcard parsing: * * * * * *', () {
    Cron cron = new Cron.parse('* * * * * *');

    test('Second.', () {
      expect(cron.second, inInclusiveRange(0, 59));
    });

    test('Minute.', () {
      expect(cron.minute, inInclusiveRange(0, 59));
    });

    test('Hour.', () {
      expect(cron.hour, inInclusiveRange(0, 23));
    });

    test('Day of Month.', () {
      expect(cron.dayOfMonth, inInclusiveRange(0, 31));
    });

    test('Month.', () {
      expect(cron.month, inInclusiveRange(1, 12));
    });

    test('Day of Week.', () {
      expect(cron.dayOfWeek, inInclusiveRange(0, 7));
    });
  });

  group('Cron time parsing: 0 0 * * * *', () {
    Cron cron = new Cron.parse('0 0 * * * *');

    test('Second.', () {
      expect(cron.second, equals([ 0 ]));
    });

    test('Minute.', () {
      expect(cron.minute, equals([ 0 ]));
    });

    test('Hour.', () {
      expect(cron.hour, inInclusiveRange(0, 23));
    });

    test('Day of Month.', () {
      expect(cron.dayOfMonth, inInclusiveRange(0, 31));
    });

    test('Month.', () {
      expect(cron.month, inInclusiveRange(1, 12));
    });

    test('Day of Week.', () {
      expect(cron.dayOfWeek, inInclusiveRange(0, 7));
    });
  });

  group('Cron time list parsing: 0 5-10,20 * * * *', () {
    Cron cron = new Cron.parse('0 5-10,20 * * * *');

    test('Second.', () {
      expect(cron.second, equals([ 0 ]));
    });

    test('Minute.', () {
      expect(cron.minute, equals([ 5, 6, 7, 8, 9, 10, 20 ]));
    });

    test('Hour.', () {
      expect(cron.hour, inInclusiveRange(0, 23));
    });

    test('Day of Month.', () {
      expect(cron.dayOfMonth, inInclusiveRange(0, 31));
    });

    test('Month.', () {
      expect(cron.month, inInclusiveRange(1, 12));
    });

    test('Day of Week.', () {
      expect(cron.dayOfWeek, inInclusiveRange(0, 7));
    });
  });

  group('Cron step parsing: 0 */10 * * * *', () {
    Cron cron = new Cron.parse('0 */10 * * * *');

    test('Second.', () {
      expect(cron.second, equals([ 0 ]));
    });

    test('Minute.', () {
      expect(cron.minute, equals([ 0, 10, 20, 30, 40, 50 ]));
    });

    test('Hour.', () {
      expect(cron.hour, inInclusiveRange(0, 23));
    });

    test('Day of Month.', () {
      expect(cron.dayOfMonth, inInclusiveRange(0, 31));
    });

    test('Month.', () {
      expect(cron.month, inInclusiveRange(1, 12));
    });

    test('Day of Week.', () {
      expect(cron.dayOfWeek, inInclusiveRange(0, 7));
    });
  });

  group('Cron list with step parsing: 0 4-10/2 * * * *', () {
    Cron cron = new Cron.parse('0 4-10/2 * * * *');

    test('Second.', () {
      expect(cron.second, equals([ 0 ]));
    });

    test('Minute.', () {
      expect(cron.minute, equals([ 4, 6, 8, 10 ]));
    });

    test('Hour.', () {
      expect(cron.hour, inInclusiveRange(0, 23));
    });

    test('Day of Month.', () {
      expect(cron.dayOfMonth, inInclusiveRange(0, 31));
    });

    test('Month.', () {
      expect(cron.month, inInclusiveRange(1, 12));
    });

    test('Day of Week.', () {
      expect(cron.dayOfWeek, inInclusiveRange(0, 7));
    });
  });

  group('Cron Month parsing: * * * * 3 *', () {
    Cron cron = new Cron.parse('* * * * 3 *');

    test('Second.', () {
      expect(cron.second, inInclusiveRange(0, 59));
    });

    test('Minute.', () {
      expect(cron.minute, inInclusiveRange(0, 59));
    });

    test('Hour.', () {
      expect(cron.hour, inInclusiveRange(0, 23));
    });

    test('Day of Month.', () {
      expect(cron.dayOfMonth, inInclusiveRange(0, 31));
    });

    test('Month.', () {
      expect(cron.month, equals([ 3 ]));
    });

    test('Day of Week.', () {
      expect(cron.dayOfWeek, inInclusiveRange(0, 7));
    });
  });

  group('Cron Month name parsing: * * * * Mar *', () {
    Cron cron = new Cron.parse('* * * * Mar *');

    test('Second.', () {
      expect(cron.second, inInclusiveRange(0, 59));
    });

    test('Minute.', () {
      expect(cron.minute, inInclusiveRange(0, 59));
    });

    test('Hour.', () {
      expect(cron.hour, inInclusiveRange(0, 23));
    });

    test('Day of Month.', () {
      expect(cron.dayOfMonth, inInclusiveRange(0, 31));
    });

    test('Month.', () {
      expect(cron.month, equals([ 3 ]));
    });

    test('Day of Week.', () {
      expect(cron.dayOfWeek, inInclusiveRange(0, 7));
    });
  });

  group('Cron Month name list parsing: * * * * Mar-august *', () {
    Cron cron = new Cron.parse('* * * * Mar-august *');

    test('Second.', () {
      expect(cron.second, inInclusiveRange(0, 59));
    });

    test('Minute.', () {
      expect(cron.minute, inInclusiveRange(0, 59));
    });

    test('Hour.', () {
      expect(cron.hour, inInclusiveRange(0, 23));
    });

    test('Day of Month.', () {
      expect(cron.dayOfMonth, inInclusiveRange(0, 31));
    });

    test('Month.', () {
      expect(cron.month, equals([ 3, 4, 5, 6, 7, 8 ]));
    });

    test('Day of Week.', () {
      expect(cron.dayOfWeek, inInclusiveRange(0, 7));
    });
  });

  group('Cron Day of Week parsing: * * * * * 2', () {
    Cron cron = new Cron.parse('* * * * * 2');

    test('Second.', () {
      expect(cron.second, inInclusiveRange(0, 59));
    });

    test('Minute.', () {
      expect(cron.minute, inInclusiveRange(0, 59));
    });

    test('Hour.', () {
      expect(cron.hour, inInclusiveRange(0, 23));
    });

    test('Day of Month.', () {
      expect(cron.dayOfMonth, inInclusiveRange(0, 31));
    });

    test('Month.', () {
      expect(cron.month, inInclusiveRange(1, 12));
    });

    test('Day of Week.', () {
      expect(cron.dayOfWeek, equals([ 2 ]));
    });
  });

  group('Cron Day of Week name parsing: * * * * * Tue', () {
    Cron cron = new Cron.parse('* * * * * Tue');

    test('Second.', () {
      expect(cron.second, inInclusiveRange(0, 59));
    });

    test('Minute.', () {
      expect(cron.minute, inInclusiveRange(0, 59));
    });

    test('Hour.', () {
      expect(cron.hour, inInclusiveRange(0, 23));
    });

    test('Day of Month.', () {
      expect(cron.dayOfMonth, inInclusiveRange(0, 31));
    });

    test('Month.', () {
      expect(cron.month, inInclusiveRange(1, 12));
    });

    test('Day of Week.', () {
      expect(cron.dayOfWeek, equals([ 2 ]));
    });
  });

  group('Cron Day of Week name list parsing: * * * * * Tue-thursday', () {
    Cron cron = new Cron.parse('* * * * * Tue-thursday');

    test('Second.', () {
      expect(cron.second, inInclusiveRange(0, 59));
    });

    test('Minute.', () {
      expect(cron.minute, inInclusiveRange(0, 59));
    });

    test('Hour.', () {
      expect(cron.hour, inInclusiveRange(0, 23));
    });

    test('Day of Month.', () {
      expect(cron.dayOfMonth, inInclusiveRange(0, 31));
    });

    test('Month.', () {
      expect(cron.month, inInclusiveRange(1, 12));
    });

    test('Day of Week.', () {
      expect(cron.dayOfWeek, equals([ 2, 3, 4 ]));
    });
  });

  test('Calculate next time.', () {
    Cron cron = new Cron.parse('* * * * * *');

    DateTime dateTime = new DateTime(2017, 1, 1, 0, 0, 0);
    DateTime nextDateTime = new DateTime(2017, 1, 1, 0, 0, 1);

    expect(cron.calculateNextTimeFromDate(dateTime), nextDateTime);
  });
}
