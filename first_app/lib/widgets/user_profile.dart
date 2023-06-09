import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.bookmark_outline, 'Избранное'),
    MenuRowData(Icons.call_outlined, 'Недавние звонки'),
    MenuRowData(Icons.computer_outlined, 'Устройства'),
    MenuRowData(Icons.folder_outlined, 'Папка с чатами'),
  ];

  final List<MenuRowData> secondMenuRow = [
    MenuRowData(Icons.notifications_outlined, 'Уведомления и звуки'),
    MenuRowData(Icons.lock_outline, 'Конфиденциальность'),
    MenuRowData(Icons.dataset_outlined, 'Данные и память'),
    MenuRowData(Icons.brush_outlined, 'Оформление'),
    MenuRowData(Icons.language_outlined, 'Язык'),
  ];

  final List<MenuRowData> thirdMenuRow = [
    MenuRowData(Icons.star_border_purple500_outlined, 'Telegram Premium'),
  ];

  final List<MenuRowData> fourthMenuRow = [
    MenuRowData(Icons.question_answer_outlined, 'Помощь'),
    MenuRowData(Icons.help_outline_outlined, 'Вопросы о Telegram'),
  ];

  UserProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Настройки'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            _UserInfo(),
            SizedBox(height: 20),
            _MenuWidget(menuRow: firstMenuRow),
            SizedBox(height: 20),
            _MenuWidget(menuRow: secondMenuRow),
            SizedBox(height: 20),
            _MenuWidget(menuRow: thirdMenuRow),
            SizedBox(height: 20),
            _MenuWidget(menuRow: fourthMenuRow),
          ],
        ),
      ),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;

  const MenuRowData(this.icon, this.text);
}

class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;

  const _MenuWidget({
    Key? key,
    required this.menuRow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: menuRow.map((data) => _MenuWidgetRow(data: data)).toList(),
      ),
    );
  }
}

class _MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;

  const _MenuWidgetRow({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(data.icon),
          SizedBox(width: 15),
          Text(data.text),
          Spacer(),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 20),
              _AvatarWidget(),
              SizedBox(height: 20),
              _UserNameWidget(),
              SizedBox(height: 5),
              _UserPhoneWidget(),
              SizedBox(height: 5),
              _UserNickNameWidget(),
              SizedBox(height: 20),
            ],
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Text(
            'Изм.',
            style: TextStyle(
              fontSize: 17,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}

class _UserNickNameWidget extends StatelessWidget {
  const _UserNickNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '@KBOOMSKA',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15,
      ),
    );
  }
}

class _UserPhoneWidget extends StatelessWidget {
  const _UserPhoneWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '+7 999 777 55 33',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15,
      ),
    );
  }
}

class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Aleksey',
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w500,
        // letterSpacing: 5,
        // height: 0.5,
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: Placeholder(),
    );
  }
}
