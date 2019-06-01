
import 'package:flutter/material.dart';
import 'package:fluttoverflow/api/api.dart';

class StackExchangeSite {
  final String url;
  final String description;
  final String iconUrl;
  StackExchangeSite(this.url, this.description, this.iconUrl);
}



class SiteProvider extends ChangeNotifier {
  List<StackExchangeSite> _sites  = [];
  int currentSiteIndex = -1;

  StackExchangeSite get currentSite => currentSiteIndex == -1 ? StackExchangeSite('stackoverflow', 'Stack Overflow', '') : _sites[currentSiteIndex];
  List<StackExchangeSite> get sites => _sites;

  void loadSites() async {
    _sites = await api.getSites();
    notifyListeners();
  }

  void setSiteIndex(int i) async {
    currentSiteIndex = i;
    notifyListeners();
  }
}