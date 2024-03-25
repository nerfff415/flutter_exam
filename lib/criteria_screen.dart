import 'package:flutter/material.dart';

class CriteriaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Критерии'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Критерии подбора:',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 10),
            Text(
              "1) 0 баллов – работа не сделана 2) 1-3 балла – генерация не работает, но интерфейс отрисован 3) 4-5 балла – отрисован интерфейс одного экрана в заданном цвете 4) 6-7 баллов – отрисован интерфейс экрана и показ результата 5) 8-9 баллов – отрисован интерфейс двух экранов с кастомным переходом в соответствии с заданием и показ результата 6) 10 баллов – все выполнено и комбинации заданий не повторяются (каждый раз уникальный набор, пока не закончится),",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
