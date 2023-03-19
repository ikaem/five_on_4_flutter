import 'package:five_on_4_flutter/src/theme/constants/color_constants.dart';
import 'package:five_on_4_flutter/src/theme/theme.dart';
import 'package:flutter/material.dart';

class CurrentPlayerInfoOverview extends StatelessWidget {
  const CurrentPlayerInfoOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorsTheme = Theme.of(context).colorScheme;

    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  style: textTheme.bodyLarge,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Welcome, ',
                      style: TextStyle(
                        color: ColorConstants.white,
                      ),
                    ),
                    TextSpan(
                      text: 'Karlo',
                      style: TextStyle(
                        color: ColorConstants.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SpacingConstants.small,
              ),
              Text.rich(
                TextSpan(
                  style: textTheme.bodySmall,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'of team ',
                      style: TextStyle(
                        color: ColorConstants.white,
                      ),
                    ),
                    TextSpan(
                      text: 'Yolo',
                      style: TextStyle(
                        color: ColorConstants.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Text('Welcome Karlo'),
              // Text('of team Yolo'),
            ],
          ),
        ),
        Container(
          width: DimensionsConstants.d50,
          height: DimensionsConstants.d50,
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(DimensionsConstants.d10),
              ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(DimensionsConstants.d10),
            child: Image.network(
              'https://source.unsplash.com/random',
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
              errorBuilder: (context, error, stackTrace) => Center(
                child: Icon(Icons.error),
              ),
            ),
          ),
          // TODO now we want to render some image from a network here
        ),
      ],
    );
  }
}
