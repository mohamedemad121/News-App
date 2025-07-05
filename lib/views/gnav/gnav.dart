import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:newsapp/busines_logic/app_theme/app_theme_cubit.dart';
import 'package:newsapp/data/model/enum/theme_state.dart';
import 'package:newsapp/views/global_view.dart/global_view.dart';
import 'package:newsapp/views/home_view.dart/home_view.dart';
import 'package:newsapp/views/profile.dart/profile_view.dart';
import 'package:newsapp/views/search_view.dart/search_view.dart';

class Gnav extends StatefulWidget {
  const Gnav({super.key});

  @override
  State<Gnav> createState() => _GnavState();
}

class _GnavState extends State<Gnav> {
  int selectedIndex = 0;
  final pages = [HomeView(), GlobalView(), SearchView(), ProfileView()];
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isdark = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsetsDirectional.only(end: 12),
        title: Text('News App'),
        actions: [
          BlocBuilder<AppThemeCubit, AppThemeState>(
            builder: (context, state) {
              final isdark = state is AppDarkTheme;
              return IconButton(
                onPressed: () {
                  context.read<AppThemeCubit>().changeTheme(
                    isdark ? ThemeState.light : ThemeState.dark,
                  );
                },
                icon: Icon(
                  isdark ? FontAwesomeIcons.sun : FontAwesomeIcons.moon,
                ),
              );
            },
          ),
        ],
      ),
      body: pages[selectedIndex],

      bottomNavigationBar: Container(
        color: isdark ? Colors.black : Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: isdark ? Colors.black : Colors.white,
            color: isdark ? Colors.grey : Colors.grey,
            activeColor: isdark ? Colors.black : Colors.white,
            tabBackgroundColor: isdark ? Colors.orange : Colors.blue,

            gap: 8,
            iconSize: 24,

            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            tabs: [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: FontAwesomeIcons.globe, text: 'Global'),
              GButton(icon: Icons.search, text: 'Search'),
              GButton(icon: Icons.person, text: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
