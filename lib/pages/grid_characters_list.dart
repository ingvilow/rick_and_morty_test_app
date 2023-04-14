import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_test_app/models/Result.dart';
import 'package:rick_and_morty_test_app/pages/error_image.dart';

class GridCharacterList extends StatelessWidget {
  const GridCharacterList({Key? key, required this.imageResult})
      : super(key: key);

  final Result imageResult;
  @override
  Widget build(BuildContext context) {
    return  Card(
          child: CachedNetworkImage(
            imageUrl: imageResult.image ?? '',
            fit: BoxFit.fill,
            imageBuilder: (context, image) {
             return SizedBox(
                width: double.infinity,
                height: 180,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            errorWidget: (context, url, Object? error) => const ErrorImage(),
          ),
        );
  }
}
