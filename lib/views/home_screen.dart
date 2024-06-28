import 'package:flutter/material.dart';
import 'package:taskvine/components/app_text.dart';
import 'package:taskvine/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //current day
                      AppText(
                        text: "Today",
                        fontWeight: FontWeight.w600,
                        font_size: 24,
                        color: HeadingTextBlack,
                      ),
                      AppText(
                          text: "Best platform for creating to-do lists",
                          color: subtitleTextBlack,
                          fontWeight: FontWeight.w300,
                          font_size: 14),
                    ],
                  ),
                  Icon(
                    size: 24,
                    Icons.settings,
                    color: Color(0xff767E8C),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: getScreenWidth(context),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x140F163A), // 0F163A with 8% opacity
                      blurRadius: 40,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: getScreenWidth(context),
                      height: 36,
                      decoration: BoxDecoration(
                          color: AppTaskGrey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8))),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              _showBottomSheet(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              decoration: BoxDecoration(
                                  color: AppTaskGrey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          AppText(
                              text: "Tap plus to create a new task",
                              color: Color(0xff333333),
                              fontWeight: FontWeight.w600,
                              font_size: 16)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        color: Color(0xffE0E5ED),
                        height: 0.5,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          AppText(
                              text: "Add your task",
                              color: subtitleTextBlack,
                              fontWeight: FontWeight.w300,
                              font_size: 12),
                          AppText(
                              text: "Today. Sat 29 june 2024",
                              color: subtitleTextBlack,
                              fontWeight: FontWeight.w300,
                              font_size: 12),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BottomSheetContent(),
        );
      },
    );
  }
}

class BottomSheetContent extends StatefulWidget {
  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController description_controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Delay the focus request to ensure the bottom sheet is fully displayed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _insertImage(String imagePath) {
    final text = _controller.text;
    final selection = _controller.selection;
    final newText =
        text.replaceRange(selection.start, selection.end, '[$imagePath]');
    _controller.value = _controller.value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(
          offset: selection.start + imagePath.length + 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'eg: Meeting with client',
                hintStyle: TextStyle(color: subtitleTextBlack),
              ),
            ),
          ),
          Container(
            child: TextField(
              controller: description_controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Description',
                hintStyle: TextStyle(color: subtitleTextBlack),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(image: AssetImage("assets/images/calendar.png")),
                  SizedBox(
                    width: 10,
                  ),
                  Image(image: AssetImage("assets/images/flag.png")),
                ],
              ),
              Image(image: AssetImage("assets/images/send.png")),
            ],
          ),
          SizedBox(height: 16),
          Divider(
            color: Color(0xffE0E5ED),
            height: 0.5,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildImageButton("assets/images/1.png"),
              _buildImageButton("assets/images/2.png"),
              _buildImageButton("assets/images/3.png"),
              _buildImageButton("assets/images/4.png"),
              _buildImageButton("assets/images/5.png"),
              _buildImageButton("assets/images/6.png"),
              _buildImageButton("assets/images/7.png"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageButton(String imagePath) {
    return GestureDetector(
      onTap: () {
        _insertImage(imagePath);
      },
      child: Image(
        image: AssetImage(imagePath),
      ),
    );
  }
}
