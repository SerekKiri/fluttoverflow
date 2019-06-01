import 'package:flutter/material.dart';
import 'package:fluttoverflow/api/questions.dart';
import 'package:fluttoverflow/screens/site_provider.dart';
import 'package:fluttoverflow/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PickSite extends StatefulWidget {
  @override
  _PickSiteState createState() => _PickSiteState();
}

class _PickSiteState extends State<PickSite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select site'),
        centerTitle: true,
      ),
      body: Consumer<SiteProvider>(
        builder: (context, model, _) {
                        if (model.sites.length == 0) model.loadSites();
          return ListView.builder(
            itemCount: model.sites.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(model.sites[index].iconUrl),
                title: Text(model.sites[index].description),
                onTap: () {
                  Navigator.of(context).pop();
                  model.setSiteIndex(index);
                },
              );
            }
          );
        }
      ),
    );
  }

  Widget _buildTopAppBar() {
    return AppbarTabsWidget(
      tabs: <Widget>[
        Tab(text: 'Hot'),
        Tab(text: 'Activity'),
        Tab(text: 'Creation'),
        Tab(text: 'Week'),
        Tab(text: 'Month'),
      ],
    );
  }
}
