import 'package:db_example/constants/project_durations.dart';
import 'package:db_example/constants/project_colors.dart';
import 'package:db_example/utils/dbhelper.dart';
import 'package:db_example/utils/lottie_items.dart';
import 'package:db_example/utils/theme_notifier.dart';
import 'package:db_example/widgets/tabbar/tab_bar_home.dart';
import 'package:db_example/widgets/tabbar/tab_bar_share.dart';
import 'package:db_example/widgets/tabbar/tab_bar_list.dart';
import 'package:db_example/widgets/tabbar/tab_bar_search.dart';
import 'package:db_example/widgets/tabbar/tab_bar_upgrade.dart';
import 'package:db_example/widgets/tabbar/tab_bar_delete.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:db_example/models/car.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyPage> with TickerProviderStateMixin {
  final dbHelper = DatabaseHelper.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String tabHome = "Anasayfa";
  final String tabInsert = "Paylaş";
  final String tabView = "İlanlar";
  final String tabQuery = "Arama";
  final String tabUpdate = "Güncelle";
  final String tabDelete = "Sil";

  TextEditingController nameController = TextEditingController();
  TextEditingController milesController = TextEditingController();
  TextEditingController queryController = TextEditingController();
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController milesUpdateController = TextEditingController();
  TextEditingController idDeleteController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController priceUpdateController = TextEditingController();
  late AnimationController myController;
  bool animatedStatus = false;

  List<Car> cars = [];
  List<Car> carsByName = [];

  String? selectedImagePath; // Seçilen resmin dosya yolu

  _showMessageInScaffold(String message) {
    return SnackBar(content: Text(message));
  }

  @override
  void initState() {
    super.initState();
    myController = AnimationController(
        vsync: this, duration: DurationItems.durationNormal());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: ProjectColors.projectBlackColor,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: ProjectColors.projectPrimaryColor,
          actions: [themeChangeLottie(context)],
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          bottom: TabBar(
              indicatorColor: ProjectColors.projectWhiteColor,
              automaticIndicatorColorAdjustment: true,
              isScrollable: true,
              labelColor: ProjectColors.projectCustomBlackColor,
              dividerColor: ProjectColors.projectCustomWhiteColor,
              tabs: [
                Tab(
                  text: tabHome,
                ),
                Tab(
                  text: tabInsert,
                ),
                Tab(
                  text: tabView,
                ),
                Tab(
                  text: tabQuery,
                ),
                Tab(
                  text: tabUpdate,
                ),
                Tab(
                  text: tabDelete,
                ),
              ]),
        ),
        body: const TabBarView(children: [
          TabBarHome(),
          TabBarShare(),
          TabBarList(),
          TabBarSearch(),
          TabBarUpgrade(),
          TabBarDelete()
        ]),
      ),
    );
  }

  GestureDetector themeChangeLottie(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
        myController.animateTo(!animatedStatus ? 0.3 : 0.6);
        animatedStatus = !animatedStatus;
      },
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return Lottie.asset(
            LottieItems.themeChange.lottiePath,
            repeat: false,
            controller: myController,
            height: 55,
            width: 55,
          );
        },
      ),
    );
  }
}

class Paddings {
  static const allPadding = EdgeInsets.all(16);
  static const horizontalPadding = EdgeInsets.symmetric(
    horizontal: 10,
  );
  static const topPadding = EdgeInsets.only(top: 8);
}
