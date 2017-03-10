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

  group('Cron time parsing: * * * * * *', () {
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

  group('Cron time range parsing: * * * * * *', () {
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

  group('Cron step parsing: * * * * * *', () {
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

  group('Cron Day of Month parsing: ', () {
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

  group('Cron Day of Week parsing: ', () {
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
}

// TODO
//   group('Cron', () {
//     Cron cron = new Cron.parse('* * * * * *');
//
//     test('Next tick', () {
//       cronJob.getNextTick(contextdate);
//     });
//
//     (Date, Cron)
//   });
//
// }

// getNextTick(currntTime, cronExp)

// job = job(expression, cb)
// job has job management capabilities

// fire evnent
