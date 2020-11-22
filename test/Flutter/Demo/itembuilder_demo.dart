
// ItemBuilder Demo
//class MessageList extends StatelessWidget{
//
//  void _chipPress(){
//    print("pressed");
//  }
//
//  Widget _itemBuilder(BuildContext context, int index){
//    return Container(
//      child: Row(
//        children: <Widget>[
//          CircleAvatar(
//            backgroundColor: Colors.blueGrey,
//            child: Image.network(
//              posts[index].imgUrl,
//              fit: BoxFit.fitHeight,
//            ),
//          ),
//          Column(
//            children: <Widget>[
//              Text(
//                posts[index].title,
//                style: Theme.of(context).textTheme.title,
//                textAlign: TextAlign.start,
//              ),
//              Text(
//                "${posts[index].shortInfo.name}:${posts[index].shortInfo.info}",
//                textAlign: TextAlign.start,
//              ),
//            ],
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            crossAxisAlignment: CrossAxisAlignment.start,
//          ),
//          Column(
//            children: <Widget>[
//              Text(
//                "18:20"
//              ),
//              ActionChip(
//                label: Text(
//                  "99+",
//                ),
//                onPressed: _chipPress,
//              )
//            ],
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//          )
//        ],
//        mainAxisAlignment: MainAxisAlignment.start,
//      ),
//      margin: EdgeInsets.fromLTRB(14.0, 8, 14.0, 8),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return ListView.builder(
//        itemCount: posts.length,
//        itemBuilder: _itemBuilder
//    );
//  }
//}