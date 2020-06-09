import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    title: 'FirstApp',
    theme: ThemeData(fontFamily: 'Nanum M'),
    debugShowCheckedModeBanner: false,
    home: Scaffold( 
        appBar: AppBar(
        title: Text(
          'To-Do list',
          style: TextStyle(color: Colors.black12, fontWeight: FontWeight.w700)
          ),
        backgroundColor: Color(0xff05DBF2),
      ),
    body: MainWindow2(),
    ),
  ));
}

//----------전역변수 설정----------

final people = [
  'gildong', 'go-gildong', 'duili', 'douner', 'torch', 'ppopdong'
];

//-------------------------------

//메인페이지 영역
class MainWindow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Column(
        children: <Widget>[
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 0.3,
              child: Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: Text(
                  '할 일', 
                  style: TextStyle(fontWeight: FontWeight.w700),
                  textScaleFactor: 2,
                ), 
              ),
            ),
          ),
/*-------------------------------------------------------------------------          
          ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
              title: Text(europeanCountries[index]),
              );
            }, 
            separatorBuilder: (context, index) {
              return Divider();
            }, 
            itemCount: europeanCountries.length
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(europeanCountries[index]),
              );
            },
            itemCount: null,
          ),
-------------------------------------------------------------------------*/      
          ListTile(
            leading: Icon(Icons.account_box),
            trailing: Icon(Icons.hearing),
            title: Text('FirstOne'),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => DetailWindow(),
                )
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_alarm),
            title: Text('SecondOne'),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => DetailWindow(),
                )
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_comment),
            title: Text('ThirdOne'),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => ScaffoldWindow(),
                )
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.cyan,
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context) => AddTodoWindow(),
            )
          );
        },
      ),
   );
  }
} 

//현재 테스트중인 메인페이지 영역
class MainWindow2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: people.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if(index == 0) return HeaderTile();
        return ListTile(
          title: Text(people[index]),
          subtitle: Text('werwer'),
        );
      },
    );
  }
}

////////////////////////////////갖다버릴부분////////////////////////////////
class DetailWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Detail Page',
              style: TextStyle(fontWeight: FontWeight.w700),
              ),
            backgroundColor: Color(0xFF05DBF2),
          ),
        ),
      ),
    );
  }
}
////////////////////////////////갖다버릴부분////////////////////////////////


//일정 디테일 윈도우
class ScaffoldWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scaffold Page',
          style: TextStyle(fontWeight: FontWeight.w700),
          ),
        backgroundColor: Color(0xFF05DBF2),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
             child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 0.3,
                child: Container(
                  color: Colors.blueGrey,
                  alignment: Alignment.center,
                  child: Text('Oh my GOD'),
                ),
             ),
            ),
          ],
        ),
      ),
    );
  }
}


//일정 추가 윈도우
class AddTodoWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add To-do Page',
          style: TextStyle(fontWeight: FontWeight.w700),
          ),
        backgroundColor: Color(0xFF05DBF2),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
             child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 0.3,
                child: Container(
                  color: Colors.blueGrey,
                  alignment: Alignment.center,
                  child: Text('Oh my GOD'),
                ),
             ),
            ),
          ],
        ),
      ),
    );
  }
}


//헤더타일 부분
class HeaderTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network("https://t1.daumcdn.net/thumb/R720x0/?fname=https://t1.daumcdn.net/brunch/service/user/1YN0/image/ak-gRe29XA2HXzvSBowU7Tl7LFE.png"),
    );
  }
}


//PersonTile 부분
class PersonTile extends StatelessWidget {
  PersonTile(this._person);

  final Person _person;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(Icons.arrow_left),
      title: Text(_person.name),
      subtitle: Text('${_person.age}살'),
    );
  }
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}