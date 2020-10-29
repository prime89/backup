import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class SettingView extends StatefulWidget{
  @override
  _SettingViewState createState() => new _SettingViewState();
}

class _SettingViewState extends State{

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      color: Color(0xeFFF5F6FA),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
            // shrinkWrap: true,
          children: <Widget>[
            _buildAvatar(context),
            _buildMyHouses(context),
            _buildProposal(context),
            _buildSettings(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 100, bottom: 20),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/avatar.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        title: Container(
          child: Text(
            'Evonn',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 26,
            ),
          ),
        ),
        subtitle: Container(
          margin: EdgeInsets.only(top: 0),
          child: Text(
            '社区号: foreverlove',
          ),
        ),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _buildMyHouses(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      color: Colors.white,
      child: ListTile(
        leading: Icon(
          Icons.business,
          color: Colors.green,
        ),
        title: Text(
          '我的房屋'
        ),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  

  Widget _buildProposal(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1),
      color: Colors.white,
      child: ListTile(
        leading: Icon(
          Icons.library_books,
          color: Color(0xeFFFF9C4C),
        ),
        title: Text(
          '我的议案'
        ),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _buildSettings(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      color: Colors.white,
      child: ListTile(
        leading: Icon(
          Icons.settings,
          color: Colors.blue,
        ),
        title: Text(
          '设置'
        ),
        trailing: Icon(Icons.arrow_right),        
      ),
    );
  }

  
}