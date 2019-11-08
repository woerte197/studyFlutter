import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: FlatButton(
          onPressed: () async {
            int a = await showListDialog(context);
//            if (delete) {
//              print("删除成功");
//            } else {
//              print("删除失败");
//            }
            print(a);
          },
          child: Text("显示对话框")),
    );
  }

  Future<bool> showDeleteConfirmDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text("您确定要删除当前文件吗？"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("取消")),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text("确认"),
              )
            ],
          );
        });
  }

  Future<int> showSimpleDialog(BuildContext context) {
    return showDialog<int>(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("请选择语言"),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop(1);
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("中文简体"),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop(1);
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("英文"),
                ),
              )
            ],
          );
        });
  }

  Future<int> showListDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          var child = Column(
            children: <Widget>[
              ListTile(
                title: Text("请选择"),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 30,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text("$index"),
                          onTap: () => Navigator.of(context).pop(index),
                        );
                      }))
            ],
          );
          return Dialog(child: child);
        });
  }
}
