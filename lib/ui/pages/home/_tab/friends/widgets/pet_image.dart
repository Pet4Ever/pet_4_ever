import 'package:flutter/material.dart';
import 'package:pet_4_ever/constant.dart';
import 'package:pet_4_ever/data/model/pet.dart';

class PetImage extends StatelessWidget {
  const PetImage({
    super.key,
    required this.pet,
    this.borderRadius,
    this.width,
    this.height,
  });

  final Pet pet;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;

  // 사용할 때 부모 위젯에 넣어서 width 명시해서 사용해 주어야 렌더링에 문제가 없음.
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(20),
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 100,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: (pet.imageUrl?.isNotEmpty ?? false)
                  ? NetworkImage(pet.imageUrl!)
                  : AssetImage(DEFAULT_PET),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
