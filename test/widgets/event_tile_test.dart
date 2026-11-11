import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:org_fair/models/fair_event.dart';
import 'package:org_fair/widgets/event_tile.dart';

void main() {
  testWidgets('a cancelled event is labelled Cancelled', (tester) async {
    final event = FairEvent(
      id: 'cancelled-event',
      orgId: 'csc',
      title: 'Cancelled workshop',
      startsAt: DateTime.utc(2026, 11, 5, 1),
      venue: 'Room 101',
      cancelled: true,
    );

    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: EventTile(event: event))),
    );

    expect(find.text('Cancelled'), findsOneWidget);
  });
}
