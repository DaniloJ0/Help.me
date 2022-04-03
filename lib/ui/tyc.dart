import 'package:flutter/material.dart';

import '../widgets/appBar.dart';
import '../widgets/listItems.dart';

class TyCPage extends StatelessWidget {
  const TyCPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
      customAppBar(),
      Expanded(child: 
        listItems()
      )
      ])));
  }
}

Widget build(BuildContext context) {

  double width = MediaQuery.of(context).size.width;

  return Scaffold(
    appBar: AppBar(
      title: Text("Text Terminos"),
    ),
    body: Container(
      width: width,
      child: Text(
        "Terminos y Condiciones",
        textAlign: TextAlign.center,
      ),
    ),
    Container(
          padding: EdgeInsets.all(20),
            child:Text("
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. In placerat dolor id accumsan tincidunt. Phasellus pellentesque, massa eget auctor ultrices, arcu dui posuere lacus, sit amet iaculis elit libero ac eros. Ut non sem ac risus mattis sollicitudin a eu magna. Vestibulum vulputate vitae diam in iaculis. In hac habitasse platea dictumst. Nulla bibendum mollis imperdiet. Vivamus feugiat arcu et orci rhoncus volutpat. Etiam volutpat, metus ac pellentesque pulvinar, diam mauris pretium libero, ut vulputate risus nulla nec ligula. In ut massa blandit, mollis augue in, tincidunt ligula. Nulla lacinia augue massa, in ultrices tortor vehicula eu. Curabitur mattis tincidunt ex, sit amet rutrum neque cursus nec. Maecenas semper posuere arcu eu posuere. Vivamus sit amet nibh at ligula tincidunt aliquam. Phasellus pretium tellus vitae quam viverra pharetra. Vestibulum vitae sagittis augue. Aenean facilisis volutpat laoreet.

Nulla ac purus egestas, iaculis mauris at, vehicula tortor. Nam et lorem tristique mauris facilisis eleifend. Proin vehicula auctor orci ut vehicula. Sed auctor tincidunt maximus. In venenatis risus nulla, nec lacinia nisi pretium quis. Nulla posuere, sem et cursus eleifend, quam lacus posuere magna, vel scelerisque risus risus elementum tellus. Vivamus quis fermentum leo. Quisque scelerisque massa nec placerat eleifend. Phasellus vel arcu et ex elementum sagittis.

In quis convallis augue, sed sollicitudin massa. Donec ac libero congue orci efficitur condimentum. Donec vulputate ipsum et ex tristique pulvinar. Donec interdum congue tellus vel faucibus. Nunc felis lorem, vulputate vitae lacinia ac, commodo ut tellus. Sed tempus mi mollis blandit porttitor. Aliquam tristique lorem nec scelerisque feugiat. Nulla volutpat arcu ex, id imperdiet nulla tempor vel. Suspendisse placerat mauris et egestas suscipit. Nunc nunc ligula, ornare vitae dignissim sed, dapibus a mi. Quisque efficitur sagittis viverra. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum in condimentum magna. Aenean commodo consectetur efficitur. Nunc ornare fermentum odio ut posuere. Nunc quis dolor in quam aliquet vehicula.

Pellentesque varius justo eu tincidunt mattis. Fusce sit amet felis at lectus iaculis cursus. Praesent pulvinar placerat lacus. Integer a sem felis. Morbi egestas luctus arcu. Suspendisse potenti. Mauris mollis id nunc nec posuere. Aliquam feugiat elit elit, sed finibus mi vulputate vitae. Phasellus non luctus tortor. Aenean odio dolor, hendrerit quis sem eu, iaculis mollis mauris. Ut eget felis eleifend, sollicitudin massa eu, aliquam enim. Nullam quis nunc id erat faucibus ultricies. Quisque consectetur imperdiet dui. Ut varius sagittis metus non placerat. Sed sit amet massa et metus sodales convallis accumsan a lectus. Suspendisse sollicitudin consequat placerat.

Sed est lacus, hendrerit et lacus sit amet, eleifend feugiat nunc. Nam ullamcorper libero ante, quis fringilla dolor tincidunt sed. Morbi et eros convallis, tincidunt sapien laoreet, cursus magna. Etiam quis est non justo dapibus auctor vel sed elit. Fusce laoreet facilisis vulputate. Donec eu sodales urna. Morbi malesuada metus eros, sit amet varius mauris maximus id. Aliquam erat volutpat. Ut id quam neque. Proin ornare massa non nunc elementum laoreet. Nulla rutrum lectus leo, ac tincidunt arcu elementum nec. Etiam nec hendrerit est, eget pharetra augue. Duis tempor ipsum in nisi dictum, sit amet convallis lectus sodales. Curabitur in nunc vel lorem blandit molestie.
            
            ",
            style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 30,
                fontWeight: FontWeight.normal,
            ),
                textAlign: TextAlign.start,
        ),
        )
  );
}
