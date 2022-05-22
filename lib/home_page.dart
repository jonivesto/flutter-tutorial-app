
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final PageController _controller = PageController(initialPage: 0);
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [
          Container(color: Colors.amber, child: const Center(child: Text("Hello")),),
          Container(color: Colors.red, child: const Center(child: Text("Hello")),),
          Container(color: Colors.green, child: const Center(child: Text("Hello")),)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.abc), label: "1"),
        BottomNavigationBarItem(icon: Icon(Icons.abc), label: "2"),
        BottomNavigationBarItem(icon: Icon(Icons.abc), label: "3"),
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
