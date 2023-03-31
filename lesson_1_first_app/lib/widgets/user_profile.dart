import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  static const List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.bookmark_outline, 'Избранное'),
    MenuRowData(Icons.call_outlined, 'Недавние звонки'),
    MenuRowData(Icons.computer_outlined, 'Устройства'),
    MenuRowData(Icons.folder_outlined, 'Папка с чатами'),
  ];

  static const List<MenuRowData> secondMenuRow = [
    MenuRowData(Icons.notifications_outlined, 'Уведомления и звуки'),
    MenuRowData(Icons.lock_outline, 'Конфиденциальность'),
    MenuRowData(Icons.dataset_outlined, 'Данные и память'),
    MenuRowData(Icons.brush_outlined, 'Оформление'),
    MenuRowData(Icons.language_outlined, 'Язык'),
  ];

  const UserProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Настройки'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
            _UserInfo(),
            SizedBox(height: 20),
            _MenuWidget(menuRow: firstMenuRow),
            SizedBox(height: 20),
            _MenuWidget(menuRow: secondMenuRow),
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
    super.key,
    required this.data,
  });

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
          Expanded(
            child: Text(data.text),
          ),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class _UserNickNameWidget extends StatelessWidget {
  const _UserNickNameWidget({
    super.key,
  });

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
  const _UserPhoneWidget({
    super.key,
  });

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
  const _UserNameWidget({
    super.key,
  });

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
  const _AvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: Placeholder(),
    );
  }
}
