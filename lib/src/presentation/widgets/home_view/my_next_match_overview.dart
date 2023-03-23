import 'package:five_on_4_flutter/src/features/matches/domain/domain.dart';
import 'package:five_on_4_flutter/src/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_4_flutter/src/features/weather/domain/domain.dart';
import 'package:five_on_4_flutter/src/theme/constants/color_constants.dart';
import 'package:five_on_4_flutter/src/theme/constants/constants.dart';
import 'package:five_on_4_flutter/src/theme/constants/font_size_constants.dart';
import 'package:flutter/material.dart';

class MyNextMatchOverview extends StatelessWidget {
  const MyNextMatchOverview({
    super.key,
    required this.matchInfo,
  });

  final MatchInfoModel matchInfo;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    final MatchModel match = matchInfo.match;
    final WeatherModel weather = matchInfo.weather;

    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.greenDark,
        borderRadius: BorderRadius.circular(DimensionsConstants.d10),
      ),
      padding: EdgeInsets.all(SpacingConstants.small),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My next match',
            style: textTheme.titleSmall!.copyWith(
              color: ColorConstants.yellow,
            ),
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      match.name,
                      style: textTheme.bodyMedium!.copyWith(
                        color: ColorConstants.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: SpacingConstants.medium,
                    ),
                    Text(
                      '23 January 2023, 18:00',
                      style: textTheme.bodySmall!.copyWith(
                        color: ColorConstants.white,
                      ),
                    ),
                    Text(
                      'Come location here',
                      style: textTheme.bodySmall!.copyWith(
                        color: ColorConstants.white,
                      ),
                    ),
                    SizedBox(
                      height: SpacingConstants.medium,
                    ),
                    Text(
                      '${match.joinedParticipants.length} player(s) arriving',
                      style: textTheme.bodySmall!.copyWith(
                        color: ColorConstants.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(SpacingConstants.medium),
                width: DimensionsConstants.d60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      weather.getWeatherIcon(),
                      size: FontSizeConstants.xxxLarge,
                      color: ColorConstants.yellow,
                    ),
                    SizedBox(
                      height: SpacingConstants.small,
                    ),
                    Text(
                      weather.getWeatherDescription(),
                      textAlign: TextAlign.center,
                      style: textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.yellow,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}