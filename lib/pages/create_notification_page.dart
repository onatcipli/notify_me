import 'package:flutter/material.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:notify_me/widgets/notification_cards/notification_card.dart';

class CreateNotification extends StatefulWidget {
  @override
  _CreateNotificationState createState() => _CreateNotificationState();
}

class _CreateNotificationState extends State<CreateNotification> {
  int currentValue = 0;
  double maxValue = 100;
  int _currentstep = 0;
  void _movetonext() {
    setState(() {
      if (_currentstep < 2) _currentstep++;
      else _currentstep=_currentstep;
    });
  }

  void _movetostart() {
    setState(() {
      _currentstep = 0;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          // Title
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColorLight),
          ),
          child: Text(
            "Create",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 24),
          ),
        ),
        NotificationCard(
              notificationModel: NotificationModel.fromJson(
                notifyListJson.elementAt(0),
              )),
        Container(
          //Stepper
          child: Theme(
            data: ThemeData(canvasColor: Colors.greenAccent),

            child: Stepper(
              steps: _getSteps(context),
              type: StepperType.vertical,
              currentStep: _currentstep,
              onStepContinue: _movetonext,
              onStepCancel: _movetostart,
              // onStepTapped: _showcontent,
            ),
          ),
        ),
      ],
    );
  }

  List<Step> spr = <Step>[];
  List<Step> _getSteps(BuildContext context) {
    spr = <Step>[
      Step(
          title: Text("Kategori Seç", style: _getTextStyle(0)),
          state: _getState(0),
          isActive: _isActive(0),
          content: Card()),
      Step(
          title: Text("Açıklama Yaz", style: _getTextStyle(1)),
          state: _getState(1),
          isActive: _isActive(1),
          content: Card()),
      Step(
          title: Text("Fotoğraf Seç", style: _getTextStyle(2),),
          state: _getState(2),
          isActive: _isActive(2),
          content: Card()),
    ];
    return spr;
  }

  StepState _getState(int i) {
    if (_currentstep > i)
      return StepState.complete;
    else
      return StepState.editing;
  }

  bool _isActive(int i) {
    return _getState(i) == StepState.editing ? true : false;
  }
  TextStyle _getTextStyle(int i){
    var state = _getState(i);
     switch(state) {
      case StepState.editing:
        return TextStyle(color: Colors.blue);
      case StepState.complete:
        return TextStyle(color: Colors.blue);
      default:
        return TextStyle(color: Colors.red);

       
     }
  }
}
