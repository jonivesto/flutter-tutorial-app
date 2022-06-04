
import 'package:esimerkki_app/ui/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.title),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [
          Container(color: Colors.amber, child: const Center(child: Text("Hello")),),
          Container(color: Colors.red, child: const Center(child: Text("Hello")),),
          ProfilePage()
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: const Icon(Icons.home), label: AppLocalizations.of(context)!.tabLabelHome),
        BottomNavigationBarItem(icon: const Icon(Icons.message), label:  AppLocalizations.of(context)!.tabLabelMessages),
        BottomNavigationBarItem(icon: const Icon(Icons.person), label:  AppLocalizations.of(context)!.tabLabelProfile),
      ],
      currentIndex: (_controller.positions.isNotEmpty)?_controller.page!.toInt():0,
      onTap: (i) => _onPageClick(i),),
    );
  }
  
  _onPageClick(int index) {
    setState(() {
      _controller.jumpToPage(index);
    });
  }
}
