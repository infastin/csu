import 'package:flutter/material.dart';

import '../entity/entity.dart';

const List<LecturerEntity> lecturers = [
  LecturerEntity(
    firstName: "Илья",
    lastName: "Маткин",
    middleName: "Александрович",
  ),
  LecturerEntity(
    firstName: "Елена",
    lastName: "Фельдман",
    middleName: "Васильевна",
  ),
  LecturerEntity(
    firstName: "Алексей",
    lastName: "Ручай",
    middleName: "Николаевич",
  ),
  LecturerEntity(
    firstName: "Никита",
    lastName: "Свиридов",
    middleName: "Александрович",
  ),
  LecturerEntity(
    firstName: "Павел",
    lastName: "Савченко",
    middleName: "Викторович",
  ),
];

const List<TimeRange> timeRanges = [
  TimeRange(
    start: TimeOfDay(hour: 8, minute: 0),
    end: TimeOfDay(hour: 9, minute: 30),
  ),
  TimeRange(
    start: TimeOfDay(hour: 9, minute: 40),
    end: TimeOfDay(hour: 11, minute: 10),
  ),
  TimeRange(
    start: TimeOfDay(hour: 11, minute: 20),
    end: TimeOfDay(hour: 12, minute: 50),
  ),
  TimeRange(
    start: TimeOfDay(hour: 13, minute: 15),
    end: TimeOfDay(hour: 14, minute: 45)
  ),
  TimeRange(
    start: TimeOfDay(hour: 15, minute: 00),
    end: TimeOfDay(hour: 16, minute: 30)
  ),
  TimeRange(
    start: TimeOfDay(hour: 16, minute: 40),
    end: TimeOfDay(hour: 18, minute: 10)
  ),
  TimeRange(
    start: TimeOfDay(hour: 18, minute: 20),
    end: TimeOfDay(hour: 19, minute: 50)
  )
];

final List<DayEntity> evenDays = [
  DayEntity(
    weekday: DateTime.monday,
    subjects: [
      SubjectEntity(
        name: "Системное программирование",
        room: "423",
        type: SubjectType.lecture,
        lecturer: lecturers[0],
        number: 4,
        timeRange: timeRanges[3],
      ),
      SubjectEntity(
        name: "Системное программирование",
        room: "423",
        type: SubjectType.lab,
        lecturer: lecturers[0],
        number: 5,
        timeRange: timeRanges[4],
      ),
      SubjectEntity(
        name: "Основы построения защищенных компьютерных систем",
        room: "423",
        type: SubjectType.lecture,
        lecturer: lecturers[1],
        number: 6,
        timeRange: timeRanges[5],
      ),
      SubjectEntity(
        name: "Основы построения защищенных компьютерных систем",
        room: "423",
        type: SubjectType.lab,
        lecturer: lecturers[1],
        number: 7,
        timeRange: timeRanges[6],
      )
    ]
  ),
  DayEntity(
    weekday: DateTime.tuesday,
    subjects: [
      SubjectEntity(
        name: "Искусственный интеллект",
        room: "423",
        type: SubjectType.lecture,
        lecturer: lecturers[2],
        number: 4,
        timeRange: timeRanges[3],
      ),
      SubjectEntity(
        name: "Искусственный интеллект",
        room: "423",
        type: SubjectType.lab,
        lecturer: lecturers[2],
        number: 5,
        timeRange: timeRanges[4],
      ),
    ]
  ),
  DayEntity(
    weekday: DateTime.saturday,
    subjects: [
      SubjectEntity(
        name: "Администрирование Windows",
        room: "421",
        type: SubjectType.lecture,
        lecturer: lecturers[4],
        number: 2,
        timeRange: timeRanges[1]
      ),
      SubjectEntity(
        name: "Администрирование Windows",
        room: "421",
        type: SubjectType.lab,
        lecturer: lecturers[4],
        number: 3,
        timeRange: timeRanges[2]
      ),
    ]
  ),
];

final List<DayEntity> oddDays = [
  DayEntity(
    weekday: DateTime.monday,
    subjects: [
      SubjectEntity(
        name: "Системное программирование",
        room: "423",
        type: SubjectType.lecture,
        lecturer: lecturers[0],
        number: 4,
        timeRange: timeRanges[3],
      ),
      SubjectEntity(
        name: "Системное программирование",
        room: "423",
        type: SubjectType.lab,
        lecturer: lecturers[0],
        number: 5,
        timeRange: timeRanges[4],
      ),
      SubjectEntity(
        name: "Основы построения защищенных компьютерных систем",
        room: "423",
        type: SubjectType.lecture,
        lecturer: lecturers[1],
        number: 6,
        timeRange: timeRanges[5],
      ),
      SubjectEntity(
        name: "Основы построения защищенных компьютерных систем",
        room: "423",
        type: SubjectType.lab,
        lecturer: lecturers[1],
        number: 7,
        timeRange: timeRanges[6],
      )
    ]
  ),
  DayEntity(
    weekday: DateTime.tuesday,
    subjects: [
      SubjectEntity(
        name: "Искусственный интеллект",
        room: "423",
        type: SubjectType.lecture,
        lecturer: lecturers[2],
        number: 4,
        timeRange: timeRanges[3],
      ),
      SubjectEntity(
        name: "Искусственный интеллект",
        room: "423",
        type: SubjectType.lab,
        lecturer: lecturers[2],
        number: 5,
        timeRange: timeRanges[4],
      ),
    ]
  ),
  DayEntity(
    weekday: DateTime.saturday,
    subjects: [
      SubjectEntity(
        name: "Математическая теория трансляторов",
        room: "421",
        type: SubjectType.lecture,
        lecturer: lecturers[3],
        number: 1,
        timeRange: timeRanges[0]
      ),
      SubjectEntity(
        name: "Математическая теория трансляторов",
        room: "421",
        type: SubjectType.lecture,
        lecturer: lecturers[3],
        number: 2,
        timeRange: timeRanges[1]
      ),
      SubjectEntity(
        name: "Администрирование Windows",
        room: "421",
        type: SubjectType.lecture,
        lecturer: lecturers[4],
        number: 3,
        timeRange: timeRanges[2]
      ),
    ]
  ),
];
