import 'package:edu_flo/code_assets/assets.dart';
import 'package:edu_flo/local/db_helper.dart';
import 'package:edu_flo/model/db/login_db.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  late List<Login> loginData;
  bool isLoad = false;

  @override
  void initState() {
    getLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: key,
        appBar: appbarWidget(),
        drawer: Drawer(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF39C0FF),
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.3],
              ),
            ),
            child: isLoad
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.only(top: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AssetsIconImage.logo_app,
                                SpaceWidget.width(context, 0.03),
                                Text("EduFLO",
                                    style: StyleText.appbarTitle(Colors.black)),
                              ],
                            ),
                            SpaceWidget.height(context, 0.02),
                            AssetsIconImage.avatar_user,
                            SpaceWidget.height(context, 0.02),
                            Text(loginData.last.username,
                                style: StyleText.appbarTitle(Colors.black)),
                            Text(loginData.last.email,
                                style: StyleText.email(Colors.black)),
                            SpaceWidget.height(context, 0.03),
                            const Divider(color: Colors.black),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget appbarWidget() {
    return AppBar(
      title: Text("My List",
          style: StyleText.appbarTitle(const Color(0xFF39C0FF))),
      centerTitle: true,
      actions: [IconButton(onPressed: () {}, icon: AssetsIconImage.calendar)],
      leading: IconButton(
          onPressed: () {
            key.currentState!.openDrawer();
          },
          icon: AssetsIconImage.dashboard),
    );
  }

  Future getLogin() async {
    setState(() {
      isLoad = true;
    });
    loginData = await LoginDatabase.instance.readAll();
    setState(() {
      isLoad = false;
    });
  }
}
