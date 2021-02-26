import 'package:event_bus/event_bus.dart';

class NavEvent{
  String label;
  String value;
  String icon;

  NavEvent(this.label,this.value,this.icon);
}
EventBus eventBus = new EventBus();