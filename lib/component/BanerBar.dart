import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/store/debug.dart';

class BannerBar extends StatefulWidget {
  BannerBar({
    @required this.images,
    this.onTap, //callback
  }) : assert(images != null);

  final List<String> images;
  final ValueChanged<int> onTap;

  @override
  _BannerBarState createState() => _BannerBarState();
}

class _BannerBarState extends State<BannerBar> {
  PageController _pageController;
  int _curIndex;

  @override
  void initState() {
    super.initState();
    _curIndex = widget.images.length * 5; //make this banner always show first image.
    _pageController = PageController(initialPage: _curIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _buildPageView(),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildIndicator() {
    int length = widget.images.length;
    return Positioned(
      bottom: 10,
      child: Row(
        children: widget.images.map((s) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: ClipOval(
              child: Container(
                width: 8,
                height: 8,
                color: s.hashCode == widget.images[_curIndex % length].hashCode
                    ? Colors.white
                    : Colors.grey,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPageView() {
    int length = widget.images.length;
    return PageView.builder(
      itemCount: length,
      controller: _pageController,
      onPageChanged: (e){
        setState(() {
          this._curIndex = e;
        });
      },
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            this._onTaped(index % length);
          },
          child: Image.network(
            widget.images[index % length],
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }

  //TODO: 实现点击跳转
  void _onTaped(int index){
    if(widget.onTap != null){
      widget.onTap(index);
    }

    Provider.of<Debug>(context).showDebugInfo(context, "当前页面的index为$index");
  }
}