class AppInfo {
  int ?status;
  int ?statusCode;
  Message? message;

  AppInfo({this.status, this.statusCode, this.message});

  AppInfo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    return data;
  }
}

class Message {
  String? latestVersionUrlWindows;
  String ?latestVersionUrlMac;
  String ?latestVersion;
  String ?loaderImage;
  String ?backgroundImage;
  String ?websiteLink;
  String ?allLogo;
  String ?trackerBaseUrl;
  String ?updateFilePath;
  String ?unableAppVersion;

  Message(
      {this.latestVersionUrlWindows,
        this.latestVersionUrlMac,
        this.latestVersion,
        this.loaderImage,
        this.backgroundImage,
        this.websiteLink,
        this.allLogo,
        this.trackerBaseUrl,
        this.updateFilePath,
        this.unableAppVersion});

  Message.fromJson(Map<String, dynamic> json) {
    latestVersionUrlWindows = json['LatestVersionUrlWindows'];
    latestVersionUrlMac = json['LatestVersionUrlMac'];
    latestVersion = json['LatestVersion'];
    loaderImage = json['loaderImage'];
    backgroundImage = json['backgroundImage'];
    websiteLink = json['websiteLink'];
    allLogo = json['allLogo'];
    trackerBaseUrl = json['trackerBaseUrl'];
    updateFilePath = json['updateFilePath'];
    unableAppVersion = json['unableAppVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LatestVersionUrlWindows'] = this.latestVersionUrlWindows;
    data['LatestVersionUrlMac'] = this.latestVersionUrlMac;
    data['LatestVersion'] = this.latestVersion;
    data['loaderImage'] = this.loaderImage;
    data['backgroundImage'] = this.backgroundImage;
    data['websiteLink'] = this.websiteLink;
    data['allLogo'] = this.allLogo;
    data['trackerBaseUrl'] = this.trackerBaseUrl;
    data['updateFilePath'] = this.updateFilePath;
    data['unableAppVersion'] = this.unableAppVersion;
    return data;
  }
}