import 'package:example/pages/memo_main_page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../load_my_data.dart';
import '../../memo_main_page.dart';
import '../database/db.dart';
import '../database/memo.dart';

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'PhotoDBHelper.dart';
import 'Photo.dart';
import 'dart:async';

class EditPage extends StatefulWidget {
  @override
  State<EditPage> createState() => _EditPage();
}

class _EditPage extends State<EditPage> {
// class EditPage extends StatelessWidget {
  String title = '';
  String text = '';
  //List<XFile>? imageFileList;

  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    // setState(() {});
  }

  //이미지
  late Future<File> imageFile;
  late Image image;
  late DBHelper dbHelper;
  late List<Photo> images;
  @override
  void initState() {
    super.initState();
    images = [];
    dbHelper = DBHelper();
  }

  // refreshImages(){
  //   dbHelper.getPhotos().then((imgs)) {
  //     images.clear();
  //     images.addAll(imgs);
  //   });
  // }
  //
  // pickImageFromGallery(){
  //   ImagePicker.pickImage(source: ImageSource.gallery).then((imgFile){
  //     String imgString = Utility.base64String(imgFile.readAsBytesSync());
  //     Photo photo = Photo(0, imgString);
  //     dbHelper.save(photo);
  //     refreshImages();
  //   });
  // }
  //
  // gridView() {
  //   return Padding(
  //     padding: EdgeInsets.all(5.0),
  //     child: GridView.count(
  //       crossAxisCount: 2,
  //       childAspectRatio: 1.0,
  //       mainAxisSpacing: 4.0,
  //       children: images.map((photo) {
  //         return Utiliy.imageFromBase64String(photo.photoName);
  //       }).toList(),
  //     )
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            color: Colors.white,
            onPressed: () async {
              Navigator.pop(context);
              saveDB();
            },
          ),
        ],
        title: Text(
          '메모 추가',
          style: TextStyle(fontFamily: 'Gamja_Flower'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap:(){
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: TextField(
                  //obscureText: true,
                  onChanged: (String title) {
                    this.title = title;
                  },
                  //제목 입력하거나 바뀌면 title로 넘어간다. 맨 위의 title에 저장됨.
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '제목',
                    labelStyle: TextStyle(
                      fontFamily: 'Gamja_Flower',
                      fontSize: 17,
                    ),
                    hintText: '제목을 입력하시오.',
                    hintStyle: TextStyle(
                    fontFamily: 'Gamja_Flower',
                    fontSize: 17,
                  ),
                  ),
                ),
              ),
            ),
            GestureDetector(
                onTap: (){
                  FocusScope.of(context).unfocus();
                },
                child: Padding(padding: EdgeInsets.all(10))
            ),
            GestureDetector(
              onTap: (){
                FocusScope.of(context).unfocus();
              },
              child: TextField(
                //obscureText: true,
                onChanged: (String text) {
                  this.text = text;
                },
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '내용을 입력하시오.',
                  labelStyle: TextStyle(
                    fontFamily: 'Gamja_Flower',
                    fontSize: 17,
                  ),
                  hintText: '내용을 입력하시오.',
                  hintStyle: TextStyle(
                    fontFamily: 'Gamja_Flower',
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    itemCount: imageFileList!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return Image.file(File(imageFileList![index].path),
                          fit: BoxFit.cover);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveDB() async {
    DBHelper sd = DBHelper();
    if (this.title.isEmpty == true || this.text.isEmpty == true) {
      await flutterToast();
    }
    else {
      var fido = Memo(
        id: Str2Sha256(DateTime.now().toString()),
        //현재 날짜를 해쉬값으로 만들어서 id로 사용
        title: this.title,
        text: this.text,
        createTime: DateTime.now().toString(),
        editTime: DateTime.now().toString(),
      );
      await sd.insertMemo(fido);
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MemoMain(),)
      );
      print(await sd.memos()); //데이터가 잘 저장됐는지 확인용, 필요는 없음
    }
  }

  String Str2Sha256(String text) {
    var key = utf8.encode('p@ssw0rd');
    var bytes = utf8.encode(text);

    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);

    return digest.toString();
  }

  Future<void> flutterToast() async{
    await Fluttertoast.showToast(msg: '제목과 내용을 입력 해주세요.',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      fontSize: 20,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
