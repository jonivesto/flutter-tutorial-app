
import 'package:esimerkki_app/profile_page.dart';
import 'package:flutter/material.dart';

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
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Koti"),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: "Viestit"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Proliifi"),
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
