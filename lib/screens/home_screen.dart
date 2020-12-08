import 'package:competicoes_futebol_tabelas/screens/table_screen.dart';
import 'package:competicoes_futebol_tabelas/widgets/league_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF0C8F33),
              const Color(0xFF01642E),
            ],
            begin: const FractionalOffset(0, 0),
            end: const FractionalOffset(0, 1),
            stops: [0, 1],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 10,
            ),
            const Text(
              'Competições',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  LeagueContainer(
                    image: 'assets/brasileirao.PNG',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TableScreen(
                            codigo: 'BSA',
                            competicao: 'Brasileirão - Serie A',
                          ),
                        ),
                      );
                    },
                  ),
                  LeagueContainer(
                    image: 'assets/pl.png',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TableScreen(
                            codigo: 'PL',
                            competicao: 'Premier League',
                          ),
                        ),
                      );
                    },
                  ),
                  LeagueContainer(
                    image: 'assets/laliga.png',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TableScreen(
                            codigo: 'PD',
                            competicao: 'La Liga',
                          ),
                        ),
                      );
                    },
                  ),
                  LeagueContainer(
                    image: 'assets/bundesliga.png',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TableScreen(
                            codigo: 'BL1',
                            competicao: 'Bundesliga',
                          ),
                        ),
                      );
                    },
                  ),
                  LeagueContainer(
                    image: 'assets/seria.png',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TableScreen(
                            codigo: 'SA',
                            competicao: 'Serie A Italiana',
                          ),
                        ),
                      );
                    },
                  ),
                  LeagueContainer(
                    image: 'assets/ligue1.png',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TableScreen(
                            codigo: 'FL1',
                            competicao: 'Ligue 1',
                          ),
                        ),
                      );
                    },
                  ),
                  LeagueContainer(
                    image: 'assets/nos.png',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TableScreen(
                            codigo: 'PPL',
                            competicao: 'Liga Nos',
                          ),
                        ),
                      );
                    },
                  ),
                  LeagueContainer(
                    image: 'assets/eredivise.png',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TableScreen(
                            codigo: 'DED',
                            competicao: 'Eredivisie',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
