import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueGrey.shade600,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
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
