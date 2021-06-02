import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speedtest_poc/components/platform_dialog.dart';
import 'package:flutter_speedtest_poc/models/speedtest.dart';
import 'package:flutter_speedtest_poc/pages/dashboard/dashboard.dart';
import 'package:flutter_speedtest_poc/pages/dialogs/dialogs.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;

  static List<TabBarItem> _tabBarItens = [
    TabBarItem(
      navigationItem: BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: "Home",
      ),
      widget: DashboardContainer(),
    ),
    TabBarItem(
      navigationItem: BottomNavigationBarItem(
        icon: Icon(Icons.call_to_action),
        label: "Modais",
      ),
      widget: DialogsView(),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPresssed(context),
      child: buildContents(),
    );
  }

  Scaffold buildContents() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _tabBarItens.elementAt(_selectedIndex).navigationItem.label,
        ),
        centerTitle: true,
      ),
      body: _tabBarItens.elementAt(_selectedIndex).widget,
      bottomNavigationBar: BottomNavigationBar(
        items: _tabBarItens.map((tab) => tab.navigationItem).toList(),
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey[700],
        selectedItemColor: Colors.blue[400],
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Future<bool> _onBackPresssed(BuildContext context) async {
    print("Back button pressed");

    if (_tabBarItens.elementAt(_selectedIndex).widget is DashboardContainer) {
      final speedTest = context.read<SpeedTestCubit>().state;

      if (speedTest is RunningSpeedTestState) {
        await PlatformDialog(
          title: "Teste em andamento!",
          content: "Por favor, cancele o teste antes sair.",
          confirmText: "OK",
        ).show(context);

        return false;
      }

      return true;
    }

    _onItemTapped(0);
    return false;
  }
}

class TabBarItem {
  final BottomNavigationBarItem navigationItem;
  final Widget widget;

  TabBarItem({this.navigationItem, this.widget});
}
