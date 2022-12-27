import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/network/api_constant.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies/movies/presentation/controller/movie_details_state.dart';
import 'package:shimmer/shimmer.dart';

class ShowRecommendatio extends StatelessWidget {
  const ShowRecommendatio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: (previous, current) =>
          previous.movieRecomendedState != current.movieRecomendedState,
      builder: (context, state) {
        switch (state.movieRecomendedState) {
          case RequestState.isLoading:
            return const SizedBox(
                height: 400, child: Center(child: CircularProgressIndicator()));

          case RequestState.isLoaded:
            return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final re = state.movieRecomended[index];
                  return FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                      child: CachedNetworkImage(
                        imageUrl: ApiConstance.imageUrl(re.backdropPath!),
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[850]!,
                          highlightColor: Colors.grey[800]!,
                          child: Container(
                            height: 170.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        height: 180.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                childCount: state.movieRecomended.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.7,
                crossAxisCount: 3,
              ),
            );
          case RequestState.isError:
            return Center(
              child: Text(state.movieRecomendedMessage),
            );
        }
      },
    );
  }
}
