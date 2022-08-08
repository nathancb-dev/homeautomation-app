import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/weather_repository.dart';
import 'search/cubit/search_cubit.dart';
import 'search/search_screen.dart';
import 'sidebar/sidebarWidgets.dart';
import '../services/weather_http_client.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.create),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.blueGrey,
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: ((() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SidebarItems()),
                  );
                })),
                icon: const Icon(Icons.menu),
              ),
              IconButton(
                onPressed: ((() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => SearchCubit(
                          WeatherRepository(
                            WeatherHttpClient(),
                          ),
                        ),
                        child: const SearchScreen(),
                      ),
                    ),
                  );
                })),
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: ((() {})),
                icon: const Icon(Icons.replay_rounded),
              ),
              IconButton(
                onPressed: ((() {})),
                icon: const Icon(Icons.people),
              ),
            ],
          ),
        ),
        
      ),
    );
  }
}
