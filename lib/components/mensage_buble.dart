import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_chat/core/models/ChatMessages.dart';

class Mensage_buble extends StatelessWidget {
  final ChatMessages message;
  final bool isMe;

  const Mensage_buble({super.key, required this.message, required this.isMe});

  Widget _showAvatar(String imageUrl) {
    ImageProvider? provider;
    final uril = Uri.parse(imageUrl);
    if (uril.path.contains( 'assets/images/avatar.png')){
      provider = AssetImage(uril.path);
    }
    else if (uril.scheme.contains('http')) {
      provider = NetworkImage(uril.toString());
    } else {
      provider = FileImage(File(uril.toString()));
    }

    return CircleAvatar(
      radius: 25,
      backgroundImage: provider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: isMe ? Colors.grey[300] : Colors.red[300],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft:
                          isMe ? Radius.circular(12) : Radius.circular(0),
                      bottomRight:
                          isMe ? Radius.circular(0) : Radius.circular(12),
                    ),
                  ),
                  width: 180,
                  margin: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 8,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.userName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isMe ? Colors.black : Colors.white,
                        ),
                      ),
                      Text(message.text),
                    ],
                  )),
            ]),
        Positioned(
          top: 0,
          left: isMe ? null : 160,
          right: isMe ? 160 : null,
          child: _showAvatar(message.userImageURL?? 'assets/images/avatar.png'),
        ),
      ],
    );
  }
}
