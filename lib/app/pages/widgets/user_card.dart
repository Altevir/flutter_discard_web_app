import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import 'package:flutter_discard_web_app/app/models/user.dart';

class UserCard extends StatefulWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  final ValueNotifier<Offset> _offSetNotifier = ValueNotifier<Offset>(const Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 365),
      child: ValueListenableBuilder(
        valueListenable: _offSetNotifier,
        builder: (_, offSetListenableValue, __) => Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..rotateX(0.002 * offSetListenableValue.dx)
            ..rotateY(-0.002 * offSetListenableValue.dy),
          child: MouseRegion(
            onHover: (event) {
              _offSetNotifier.value += event.delta;
            },
            onExit: (event) {
              _offSetNotifier.value = const Offset(0, 0);
            },
            child: Container(
              height: 387,
              margin: const EdgeInsets.only(bottom: 40),
              decoration: BoxDecoration(
                color: const Color(0xff232328),
                borderRadius: const BorderRadius.all(
                  Radius.circular(14),
                ),
                border: Border.all(color: Colors.grey.shade800),
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(300),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                      ),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: widget.user.banner?.link ?? '',
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xff5865f2),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(
                          Icons.camera_outlined,
                          color: Colors.grey.withAlpha(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 102,
                    left: 40,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      width: 96,
                      height: 96,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff27292D),
                      ),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: widget.user.avatar?.link ?? '',
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.camera_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.all(32),
                      margin: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        bottom: 16,
                      ),
                      height: 140,
                      decoration: const BoxDecoration(
                        color: Color(0xff111214),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.person_outline_sharp,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  'ID:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  widget.user.id!,
                                  style: const TextStyle(fontSize: 16, color: Color(0xff5865f2)),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.tag_sharp,
                                size: 16,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                'Usuário:',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Flexible(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    widget.user.tag ?? '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffeb459e),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.emergency,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  'Criado em:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  DateFormat.yMd().format(DateTime.parse(widget.user.createdAt ?? DateTime.now().toString())),
                                  style: const TextStyle(fontSize: 16, color: Color(0xff57f287)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
