import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:por_de_sol/repositories/weather_repository.dart';
import 'package:por_de_sol/screens/search/cubit/search_cubit.dart';
import 'package:por_de_sol/services/weather_http_client.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busque sua cidade'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(26),
                  ),
                ),
                hintText: 'Ex: São Paulo',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                context.read<SearchCubit>().search(value);
              },
            ),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchInitial) {
                  return const SizedBox.shrink();
                }

                if (state is SearchLoaded) {
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        final city = state.cities[index];

                        return ListTile(
                          title: Text(
                            city.name,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        );
                      },
                      itemCount: state.cities.length,
                    ),
                  );
                }

                return Center(
                  child: Text((state as SearchError).message),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
