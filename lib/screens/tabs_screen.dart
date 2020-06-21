import 'package:flutter/material.dart';
import 'package:helloworld/models/job.dart';
import './profile_screen.dart';
import './job_list_screen.dart';
import './completed_jobs_screen.dart';


class TabsScreen extends StatefulWidget {
  final List<Job> completedJobs;

  TabsScreen(this.completedJobs);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': JobsList(),
        'title': 'Available Jobs',
      },
      {
        'page': CompletedJobs(widget.completedJobs),
        'title': 'Completed Jobs',
      },
      {
        'page': Profile(widget.completedJobs),
        'title': 'Your Profile',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blueGrey,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.event_available),
            title: Text('Available Jobs'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.done),
            title: Text('Completed Jobs'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.account_circle),
            title: Text('Your Profile'),
          )
        ],
      ),
    );
  }
}
