import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lsc/presentation/inprogress_order_screen/bloc/inprogress_bloc.dart';

Future showCompleteOrderDialog(
    BuildContext context, InprogressBloc bloc) async {
  showDialog(
    context: context,
    builder: (childContext) {
      return CompleteOrderDialog(
        bloc: bloc,
      );
    },
  );
}

class CompleteOrderDialog extends StatefulWidget {
  const CompleteOrderDialog({super.key, required this.bloc});

  final InprogressBloc bloc;

  @override
  State<CompleteOrderDialog> createState() => _CompleteOrderDialogState();
}

class _CompleteOrderDialogState extends State<CompleteOrderDialog> {
  List<XFile> images = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      title: Text('Upload delivered photos'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// upload image section from image selector

          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              for (var i = 0; i < images.length; i++)
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Image.file(File(images[i].path)),
                ),
              InkWell(
                onTap: () async {
                  final image = await ImagePicker().pickImage(
                    source: ImageSource.camera,
                    imageQuality: 25,
                  );
                  if (image != null) {
                    print(
                        "imange size as mb: ${File(image.path).lengthSync() / 1024 / 1024}");
                    setState(() {
                      images.add(image);
                    });
                  }
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Center(
                    child: Icon(Icons.add),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          if (images.length < 5)
            Text("Please upload at least 5 photos",
                style: TextStyle(color: Colors.red)),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, null);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: images.length < 5
              ? null
              : () {
                  widget.bloc.add(
                    OnClickCompletedOrderEvent(
                      images: images,
                    ),
                  );
                  Navigator.pop(context, images);
                },
          child: Text('Complete Order'),
        ),
      ],
    );
  }
}
