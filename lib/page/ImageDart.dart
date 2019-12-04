import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/page/NetUItil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ImageDart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ImageDartState();
  }
}

class ImageDartState extends State<ImageDart> {
  var path = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPath();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Image.network(
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1575353411644&di=7e432bbdbb16199660882856f7b4f5fb&imgtype=0&src=http%3A%2F%2Fdesk-fd.zol-img.com.cn%2Ft_s960x600c5%2Fg4%2FM04%2F04%2F03%2FCg-4WVQSY5GIXCJfAAgcMfHEIBEAARXwQHY7j8ACBxJ524.jpg",
          width: 100,
          height: 100,
        ),
        Image(
          image: AssetImage("assets/test.jpg"),
          width: 100,
          height: 200,
        ),
        Image.asset(
          "assets/home_bg.png",
          width: 100,
          height: 100,
        ),
        FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
            return snapshot.data != null
                ? Image.file(snapshot.data, width: 100,height: 100,)
                : Container();
          },
          future: loadPath(),
        ),
//        FadeInImage.assetNetwork(placeholder:'assets/test.jpg' , image:'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=287899671,3092315054&fm=26&gp=0.jpg',width: 100,height: 100,)
        CachedNetworkImage(  placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),imageUrl:'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=287899671,3092315054&fm=26&gp=0.jpg' ,)
      ]
    );
  }

  Future<File> loadPath() async {
    final url = 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=287899671,3092315054&fm=26&gp=0.jpg';
    final res = await http.get(url);
    final image = img.decodeImage(res.bodyBytes);
    String path = (await getExternalStorageDirectory()).path;
    File file = new File("$path/test.jpg");
    file.writeAsBytes(img.encodeJpg(image));
    return file;
  }
}
