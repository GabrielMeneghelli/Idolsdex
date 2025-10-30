CREATE DATABASE IF NOT EXISTS BallonDorDB;
USE BallonDorDB;

-- 🌍 Nacionalidade do jogador
CREATE TABLE IF NOT EXISTS Nacionalidade (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL UNIQUE
);

-- 🧩 Posição em campo
CREATE TABLE IF NOT EXISTS Posicao (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL UNIQUE
);

-- 🏟️ Clube
CREATE TABLE IF NOT EXISTS Clube (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL UNIQUE,
    Imagem VARCHAR(200)
);

-- 🧍‍♂️ Jogador
CREATE TABLE IF NOT EXISTS Jogador (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL UNIQUE,
    NacionalidadeId INT UNSIGNED NOT NULL,
    PosicaoId INT UNSIGNED NOT NULL,
    Altura DOUBLE(4,2) DEFAULT 0,  -- em metros
    Imagem VARCHAR(200),
    Descricao TEXT,
    FOREIGN KEY (NacionalidadeId) REFERENCES Nacionalidade(Id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (PosicaoId) REFERENCES Posicao(Id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ⚽ Relação entre Jogador e Clube
CREATE TABLE IF NOT EXISTS JogadorClube (
	Id INT auto_increment primary key,
    JogadorId INT UNSIGNED NOT NULL,
    ClubeId INT UNSIGNED NOT NULL,
    AnoInicio YEAR,
    AnoFim YEAR,
    FOREIGN KEY (JogadorId) REFERENCES Jogador(Id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (ClubeId) REFERENCES Clube(Id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- alter table jogadorclube add column Id int auto_increment primary key;
-- drop index `primary` on jogadorclube;

CREATE UNIQUE INDEX UNQ_JOGADORCLUBE ON jogadorclube(
    JogadorId,
    ClubeId,
    AnoInicio,
    AnoFim
 ); 

-- 🏆 Prêmios (Bola de Ouro etc.)
CREATE TABLE IF NOT EXISTS Premio (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Ano YEAR NOT NULL,
    JogadorId INT UNSIGNED NOT NULL,
    FOREIGN KEY (JogadorId) REFERENCES Jogador(Id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

INSERT INTO Nacionalidade (Nome) VALUES
('Argentina'),
('Portugal'),
('Croácia'),
('França'),
('Brasil'),
('Itália'),
('Alemanha'),
('Inglaterra'),
('Espanha'),
('Tchéquia'),
('Rússia'),
('Escócia'),
('Hungria'),
('Países Baixos'),
('Ucrânia'),
('Dinamarca'),
('Bulgária'),
('Libéria');

INSERT INTO Posicao (Nome) VALUES
('Goleiro'),
('Zagueiro'),
('Lateral'),
('Volante'),
('Meia'),
('Atacante');

INSERT INTO Jogador (Nome, NacionalidadeId, PosicaoId, Altura, Imagem, Descricao) VALUES
('Stanley Matthews', 8, 6, 1.72, '/img/jogadores/stanley_matthews.jpg', 'Lenda inglesa do futebol, conhecido como o "Feiticeiro do Drible", primeiro vencedor da Bola de Ouro em 1956.'),
('Alfredo Di Stéfano', 1, 6, 1.76, '/img/jogadores/alfredo_di_stefano.jpg', 'Argentino naturalizado espanhol, símbolo do Real Madrid e bicampeão da Bola de Ouro.'),
('Raymond Kopa', 4, 5, 1.68, '/img/jogadores/raymond_kopa.jpg', 'Craque francês que brilhou no Stade de Reims e no Real Madrid, campeão europeu nos anos 50.'),
('Luis Suárez Miramontes', 9, 5, 1.75, '/img/jogadores/luis_suarez_1960.jpg', 'Espanhol cerebral, destaque no Barcelona e Inter de Milão, vencedor da Bola de Ouro em 1960.'),
('Omar Sivori', 1, 6, 1.68, '/img/jogadores/omar_sivori.jpg', 'Atacante argentino de enorme técnica, ídolo da Juventus e Napoli, campeão em 1961.'),
('Josef Masopust', 10, 5, 1.77, '/img/jogadores/josef_masopust.jpg', 'Tcheco elegante e líder em campo, levou a Tchecoslováquia ao vice mundial e venceu a Bola de Ouro em 1962.'),
('Lev Yashin', 11, 1, 1.89, '/img/jogadores/lev_yashin.jpg', 'O lendário "Aranha Negra", único goleiro a vencer a Bola de Ouro, símbolo do Dínamo Moscou e da URSS.'),
('Denis Law', 12, 6, 1.75, '/img/jogadores/denis_law.jpg', 'Escocês artilheiro do Manchester United, ídolo dos anos 60 e campeão da Bola de Ouro em 1964.'),
('Eusébio', 2, 6, 1.75, '/img/jogadores/eusebio.jpg', 'O "Pantera Negra", símbolo do Benfica e maior jogador da história de Portugal, campeão em 1965.'),
('Bobby Charlton', 8, 5, 1.73, '/img/jogadores/bobby_charlton.jpg', 'Ídolo do Manchester United e campeão mundial em 1966, meia de técnica e liderança.'),
('Flórián Albert', 13, 6, 1.82, '/img/jogadores/florian_albert.jpg', 'Atacante húngaro de grande talento, ídolo do Ferencváros e vencedor da Bola de Ouro em 1967.'),
('George Best', 8, 6, 1.75, '/img/jogadores/george_best.jpg', 'Gênio e ídolo do Manchester United, conhecido por seu estilo e talento, campeão da Bola de Ouro em 1968.'),
('Gianni Rivera', 6, 5, 1.75, '/img/jogadores/gianni_rivera.jpg', 'Meia italiano clássico do Milan, cérebro da equipe e vencedor em 1969.'),
('Gerd Müller', 7, 6, 1.76, '/img/jogadores/gerd_muller.jpg', 'O “Bombardeiro da Baviera”, um dos maiores artilheiros da história, campeão da Bola de Ouro em 1970.'),
('Johan Cruijff', 14, 6, 1.78, '/img/jogadores/johan_cruijff.jpg', 'Símbolo do futebol total holandês, tricampeão da Bola de Ouro (1971, 1973, 1974).'),
('Franz Beckenbauer', 7, 2, 1.81, '/img/jogadores/franz_beckenbauer.jpg', 'O “Kaiser”, defensor e líder da Alemanha e do Bayern, bicampeão da Bola de Ouro.'),
('Oleg Blokhin', 15, 6, 1.79, '/img/jogadores/oleg_blokhin.jpg', 'Atacante ucraniano ídolo do Dínamo Kiev, campeão da Bola de Ouro em 1975.'),
('Allan Simonsen', 16, 6, 1.65, '/img/jogadores/allan_simonsen.jpg', 'Dinamarquês ágil e técnico, destaque do Borussia Mönchengladbach, vencedor em 1977.'),
('Kevin Keegan', 8, 6, 1.73, '/img/jogadores/kevin_keegan.jpg', 'Atacante inglês e ídolo do Liverpool e Hamburgo, bicampeão da Bola de Ouro (1978, 1979).'),
('Karl-Heinz Rummenigge', 7, 6, 1.82, '/img/jogadores/rummenigge.jpg', 'Atacante alemão do Bayern de Munique, bicampeão da Bola de Ouro (1980, 1981).'),
('Paolo Rossi', 6, 6, 1.74, '/img/jogadores/paolo_rossi.jpg', 'Herói da Itália na Copa de 1982, artilheiro e vencedor da Bola de Ouro no mesmo ano.'),
('Michel Platini', 4, 5, 1.78, '/img/jogadores/michel_platini.jpg', 'Craque francês tricampeão da Bola de Ouro, ídolo da Juventus e da seleção francesa.'),
('Igor Belanov', 15, 6, 1.75, '/img/jogadores/igor_belanov.jpg', 'Atacante ucraniano do Dínamo Kiev, vencedor da Bola de Ouro em 1986.'),
('Ruud Gullit', 14, 5, 1.91, '/img/jogadores/ruud_gullit.jpg', 'Líder holandês e estrela do Milan dos anos 80, campeão da Bola de Ouro em 1987.'),
('Marco van Basten', 14, 6, 1.88, '/img/jogadores/marco_van_basten.jpg', 'Atacante elegante e letal do Milan e da Holanda, tricampeão da Bola de Ouro (1988, 1989, 1992).'),
('Lothar Matthäus', 7, 5, 1.74, '/img/jogadores/lothar_matthaus.jpg', 'Meia alemão campeão mundial em 1990, símbolo de liderança e força, vencedor da Bola de Ouro.'),
('Jean-Pierre Papin', 4, 6, 1.76, '/img/jogadores/jean_pierre_papin.jpg', 'Artilheiro francês do Olympique de Marseille, campeão da Bola de Ouro em 1991.'),
('Roberto Baggio', 6, 5, 1.74, '/img/jogadores/roberto_baggio.jpg', 'Craque italiano de técnica e genialidade, ídolo da Juventus e vencedor em 1993.'),
('Hristo Stoichkov', 17, 6, 1.78, '/img/jogadores/hristo_stoichkov.jpg', 'Atacante búlgaro explosivo, estrela do Barcelona e campeão da Bola de Ouro em 1994.'),
('George Weah', 18, 6, 1.84, '/img/jogadores/george_weah.jpg', 'Liberiano e ídolo do Milan, primeiro africano a vencer a Bola de Ouro (1995).'),
('Mathias Sammer', 7, 2, 1.81, '/img/jogadores/mathias_sammer.jpg', 'Zagueiro líbero alemão, destaque do Borussia Dortmund e campeão em 1996.'),
('Ronaldo', 5, 6, 1.83, '/img/jogadores/ronaldo.jpg', 'O Fenômeno. Brilhou no Barcelona, Inter e Real Madrid, bicampeão da Bola de Ouro.'),
('Zinedine Zidane', 4, 5, 1.85, '/img/jogadores/zinedine_zidane.jpg', 'Craque francês do Juventus e Real Madrid, vencedor da Bola de Ouro de 1998.'),
('Rivaldo', 5, 5, 1.86, '/img/jogadores/rivaldo.jpg', 'Meia-atacante brasileiro, destaque no Barcelona e campeão da Bola de Ouro em 1999.'),
('Luís Figo', 2, 5, 1.80, '/img/jogadores/luis_figo.jpg', 'Português clássico e técnico, ídolo do Barcelona e Real Madrid, campeão da Bola de Ouro em 2000.'),
('Michael Owen', 8, 6, 1.73, '/img/jogadores/michael_owen.jpg', 'Atacante inglês veloz e letal do Liverpool, campeão da Bola de Ouro em 2001.'),
('Pavel Nedved', 10, 5, 1.77, '/img/jogadores/pavel_nedved.jpg', 'Craque tcheco da Juventus, reconhecido por sua garra e técnica, campeão da Bola de Ouro em 2003.'),
('Andriy Shevchenko', 15, 6, 1.83, '/img/jogadores/andriy_shevchenko.jpg', 'Ídolo ucraniano do Milan e artilheiro da Europa, campeão da Bola de Ouro em 2004.'),
('Ronaldinho Gaúcho', 5, 5, 1.82, '/img/jogadores/ronaldinho.jpg', 'Símbolo da alegria no futebol, encantou o mundo no Barcelona, campeão da Bola de Ouro em 2005.'),
('Fabio Cannavaro', 6, 2, 1.76, '/img/jogadores/fabio_cannavaro.jpg', 'Zagueiro italiano e capitão da seleção campeã do mundo em 2006, vencedor da Bola de Ouro.'),
('Kaká', 5, 5, 1.86, '/img/jogadores/kaka.jpg', 'Meia elegante e técnico, destaque do Milan e vencedor da Bola de Ouro de 2007.'),
('Cristiano Ronaldo', 2, 6, 1.87, '/img/jogadores/cristiano_ronaldo.jpg', 'Lenda portuguesa, cinco vezes vencedor da Bola de Ouro, ídolo de Manchester United, Real Madrid e Portugal.'),
('Lionel Messi', 1, 6, 1.70, '/img/jogadores/lionel_messi.jpg', 'Argentino e maior vencedor da história da Bola de Ouro, símbolo do Barcelona e campeão mundial de 2022.'),
('Luka Modric', 3, 5, 1.72, '/img/jogadores/luka_modric.jpg', 'Craque croata e cérebro do meio-campo do Real Madrid, vencedor da Bola de Ouro de 2018.'),
('Karim Benzema', 4, 6, 1.85, '/img/jogadores/karim_benzema.jpg', 'Atacante francês de técnica refinada, ídolo do Real Madrid, campeão da Bola de Ouro em 2022.'),
('Rodri', 9, 4, 1.91, '/img/jogadores/rodri.jpg', 'Volante espanhol do Manchester City, destaque mundial e vencedor da Bola de Ouro 2024.'),
('Ousmane Dembélé', 4, 6, 1.78, '/img/jogadores/ousmane_dembele.jpg', 'Atacante francês veloz e habilidoso, campeão da Bola de Ouro em 2025.');

INSERT INTO Premio (Nome, Ano, JogadorId) VALUES
('Bola de Ouro', 1956, 1),   -- Stanley Matthews (Inglaterra)
('Bola de Ouro', 1957, 2),   -- Alfredo Di Stéfano (Argentina)
('Bola de Ouro', 1958, 3),   -- Raymond Kopa (França)
('Bola de Ouro', 1959, 2),   -- Alfredo Di Stéfano (Argentina)
('Bola de Ouro', 1960, 4),   -- Luis Suárez (Espanha)
('Bola de Ouro', 1961, 5),   -- Omar Sivori (Argentina)
('Bola de Ouro', 1962, 6),   -- Josef Masopust (Tchéquia)
('Bola de Ouro', 1963, 7),   -- Lev Yashin (Rússia)
('Bola de Ouro', 1964, 8),   -- Denis Law (Escócia)
('Bola de Ouro', 1965, 9),   -- Eusébio (Portugal)
('Bola de Ouro', 1966, 10),  -- Bobby Charlton (Inglaterra)
('Bola de Ouro', 1967, 11),  -- Flórián Albert (Hungria)
('Bola de Ouro', 1968, 12),  -- George Best (Inglaterra)
('Bola de Ouro', 1969, 13),  -- Gianni Rivera (Itália)
('Bola de Ouro', 1970, 14),  -- Gerd Müller (Alemanha)
('Bola de Ouro', 1971, 15),  -- Johan Cruijff (Países Baixos)
('Bola de Ouro', 1972, 16),  -- Franz Beckenbauer (Alemanha)
('Bola de Ouro', 1973, 15),  -- Johan Cruijff (Países Baixos)
('Bola de Ouro', 1974, 15),  -- Johan Cruijff (Países Baixos)
('Bola de Ouro', 1975, 17),  -- Oleg Blokhin (Ucrânia)
('Bola de Ouro', 1976, 16),  -- Franz Beckenbauer (Alemanha)
('Bola de Ouro', 1977, 18),  -- Allan Simonsen (Dinamarca)
('Bola de Ouro', 1978, 19),  -- Kevin Keegan (Inglaterra)
('Bola de Ouro', 1979, 19),  -- Kevin Keegan (Inglaterra)
('Bola de Ouro', 1980, 20),  -- Karl-Heinz Rummenigge (Alemanha)
('Bola de Ouro', 1981, 20),  -- Karl-Heinz Rummenigge (Alemanha)
('Bola de Ouro', 1982, 21),  -- Paolo Rossi (Itália)
('Bola de Ouro', 1983, 22),  -- Michel Platini (França)
('Bola de Ouro', 1984, 22),  -- Michel Platini (França)
('Bola de Ouro', 1985, 22),  -- Michel Platini (França)
('Bola de Ouro', 1986, 23),  -- Igor Belanov (Ucrânia)
('Bola de Ouro', 1987, 24),  -- Ruud Gullit (Países Baixos)
('Bola de Ouro', 1988, 25),  -- Marco van Basten (Países Baixos)
('Bola de Ouro', 1989, 25),  -- Marco van Basten (Países Baixos)
('Bola de Ouro', 1990, 26),  -- Lothar Matthäus (Alemanha)
('Bola de Ouro', 1991, 27),  -- Jean-Pierre Papin (França)
('Bola de Ouro', 1992, 25),  -- Marco van Basten (Países Baixos)
('Bola de Ouro', 1993, 28),  -- Roberto Baggio (Itália)
('Bola de Ouro', 1994, 29),  -- Hristo Stoichkov (Bulgária)
('Bola de Ouro', 1995, 30),  -- George Weah (Libéria)
('Bola de Ouro', 1996, 31),  -- Mathias Sammer (Alemanha)
('Bola de Ouro', 1997, 32),  -- Ronaldo (Brasil)
('Bola de Ouro', 1998, 33),  -- Zinedine Zidane (França)
('Bola de Ouro', 1999, 34),  -- Rivaldo (Brasil)
('Bola de Ouro', 2000, 35),  -- Luís Figo (Portugal)
('Bola de Ouro', 2001, 36),  -- Michael Owen (Inglaterra)
('Bola de Ouro', 2002, 32),  -- Ronaldo (Brasil)
('Bola de Ouro', 2003, 37),  -- Pavel Nedved (Tchéquia)
('Bola de Ouro', 2004, 38),  -- Andriy Shevchenko (Ucrânia)
('Bola de Ouro', 2005, 39),  -- Ronaldinho Gaúcho (Brasil)
('Bola de Ouro', 2006, 40),  -- Fabio Cannavaro (Itália)
('Bola de Ouro', 2007, 41),  -- Kaká (Brasil)
('Bola de Ouro', 2008, 42),  -- Cristiano Ronaldo (Portugal)
('Bola de Ouro', 2009, 43),  -- Lionel Messi (Argentina)
('Bola de Ouro', 2010, 43),
('Bola de Ouro', 2011, 43),
('Bola de Ouro', 2012, 43),
('Bola de Ouro', 2013, 42),
('Bola de Ouro', 2014, 42),
('Bola de Ouro', 2015, 43),
('Bola de Ouro', 2016, 42),
('Bola de Ouro', 2017, 42),
('Bola de Ouro', 2018, 44),  -- Luka Modric (Croácia)
('Bola de Ouro', 2019, 43),
('Bola de Ouro', 2021, 43),
('Bola de Ouro', 2022, 45),  -- Karim Benzema (França)
('Bola de Ouro', 2024, 46),  -- Rodri (Espanha)
('Bola de Ouro', 2025, 47);  -- Ousmane Dembélé (França)


INSERT INTO Clube (Nome, Imagem) VALUES
('Real Madrid', '/img/clubes/real_madrid.jpg'),
('Barcelona', '/img/clubes/barcelona.jpg'),
('Manchester United', '/img/clubes/manchester_united.jpg'),
('Liverpool', '/img/clubes/liverpool.jpg'),
('Juventus', '/img/clubes/juventus.jpg'),
('AC Milan', '/img/clubes/ac_milan.jpg'),
('Inter de Milão', '/img/clubes/inter_milan.jpg'),
('Bayern de Munique', '/img/clubes/bayern_munich.jpg'),
('Borussia Dortmund', '/img/clubes/borussia_dortmund.jpg'),
('Borussia Mönchengladbach', '/img/clubes/borussia_monchengladbach.jpg'),
('Ajax', '/img/clubes/ajax.jpg'),
('Benfica', '/img/clubes/benfica.jpg'),
('Chelsea', '/img/clubes/chelsea.jpg'),
('Manchester City', '/img/clubes/manchester_city.jpg'),
('Paris Saint-Germain', '/img/clubes/psg.jpg'),
('Napoli', '/img/clubes/napoli.jpg'),
('Hamburgo', '/img/clubes/hamburgo.jpg'),
('Ferencváros', '/img/clubes/ferencvaros.jpg'),
('Dínamo Kiev', '/img/clubes/dinamo_kiev.jpg'),
('Dínamo Moscou', '/img/clubes/dinamo_moscou.jpg'),
('Stade de Reims', '/img/clubes/stade_reims.jpg'),
('Fiorentina', '/img/clubes/fiorentina.jpg'),
('Arsenal', '/img/clubes/arsenal.jpg'),
('Tottenham', '/img/clubes/tottenham.jpg'),
('Leeds United', '/img/clubes/leeds_united.jpg'),
('Atlético de Madrid', '/img/clubes/atletico_madrid.jpg'),
('Valencia', '/img/clubes/valencia.jpg'),
('Porto', '/img/clubes/porto.jpg'),
('Sporting CP', '/img/clubes/sporting_cp.jpg'),
('Rangers', '/img/clubes/rangers.jpg'),
('Celtic', '/img/clubes/celtic.jpg'),
('Dínamo Zagreb', '/img/clubes/dinamo_zagreb.jpg'),
('CSKA Moscou', '/img/clubes/cska_moscou.jpg'),
('Anderlecht', '/img/clubes/anderlecht.jpg'),
('Sevilla', '/img/clubes/sevilla.jpg'),
('Villarreal', '/img/clubes/villarreal.jpg'),
('Shakhtar Donetsk', '/img/clubes/shakhtar_donetsk.jpg'),
('Everton', '/img/clubes/everton.jpg'),
('West Ham', '/img/clubes/west_ham.jpg'),
('Newcastle United', '/img/clubes/newcastle_united.jpg'),
('Blackpool', '/img/clubes/blackpool.jpg'),
('Stoke City', '/img/clubes/stoke_city.jpg'),
('Dukla Praga', '/img/clubes/dukla_praga.jpg'),
('Sparta Praga', '/img/clubes/sparta_praga.jpg'),
('SS Lazio', '/img/clubes/lazio.jpg'),
('Olympique de Marseille', '/img/clubes/olympique_de_marseille.jpg'),
('River Plate', '/img/clubes/river_plate.jpg'),
('Millionarios', '/img/clubes/millionarios.jpg'),
('RCD Espanyol', '/img/clubes/espanyol.jpg'),
('Angers SCO', '/img/clubes/angers.jpg'),
('Deportivo La Corunã', '/img/clubes/deportivo_la_coruna.jpg'),
('Sampdoria', '/img/clubes/sampdoria.jpg'),
('ZSJ Technomat Teplice', '/img/clubes/fk_teplice.jpg'),
('Crossing Molenbeek', '/img/clubes/crossing_molenbeek.jpg'),
('Huddersfield Town', '/img/clubes/hunddersfield_town.jpg'),
('Torino', '/img/clubes/torino.jpg'),
('Rennes', '/img/clubes/rennes.jpg'),
('Lyon', '/img/clubes/lyon.jpg'),
('Orlando City', '/img/clubes/orlando_city.jpg'),
('Al Ahli', '/img/clubes/al_ahli.jpg'),
('Fluminense', '/img/clubes/fluminense.jpg'),
('Queretaro', '/img/clubes/queretaro.jpg'),
('Atlético Mineiro', '/img/clubes/atletico_mineiro.jpg'),
('Flamengo', '/img/clubes/flamengo.jpg'),
('Grêmio', '/img/clubes/gremio.jpg'),
('São Caetano', '/img/clubes/sao_caetano.jpg'),
('Kabuscorp', '/img/clubes/kabuscorp.jpg'),
('São Paulo', '/img/clubes/sao_paulo.jpg'),
('Bunyodkor', '/img/clubes/bunyodkor.jpg'),
('AEK Atenas', '/img/clubes/aek.jpg'),
('Olympiacos', '/img/clubes/olympiacos.jpg'),
('Palmeiras', '/img/clubes/palmeiras.jpg'),
('Mogi Mirim', '/img/clubes/mogi_mirim.jpg'),
('Santa Cruz', '/img/clubes/santa_cruz.jpg'),
('AS Cannes', '/img/clubes/cannes.jpg'),
('Corinthians', '/img/clubes/corinthians.jpg'),
('Cruzeiro', '/img/clubes/cruzeiro.jpg'),
('VfB Stuttgart', '/img/clubes/stuttgart.jpg'),
('Dynamo Dresden', '/img/clubes/dynamo_dresden.jpg'),
('Al Jazira', '/img/clubes/al_jazira.jpg'),
('AS Monaco', '/img/clubes/monaco.jpg'),
('D.C. United', '/img/clubes/dc_united.jpg'),
('Chicago Fire', '/img/clubes/chicago.jpg'),
('Kashiwa Reysol', '/img/clubes/kashiwa_reysol.jpg'),
('Parma', '/img/clubes/parma.jpg'),
('CSKA Sofia', '/img/clubes/cska_sofia.jpg'),
('FC Hebros', '/img/clubes/fc_hebros.jpg'),
('Brescia', '/img/clubes/brescia.jpg'),
('Bologna', '/img/clubes/bologna.jpg'),
('JS Saint Pierroise', '/img/clubes/js_saint_pierroise.jpg'),
('Guingamp', '/img/clubes/guingamp.jpg'),
('Bordeaux', '/img/clubes/bordeaux.jpg'),
('Club Brugge', '/img/clubes/club_brugge.jpg'),
('Valenciennes', '/img/clubes/valenciennes.jpg'),
('New York Red Bulls', '/img/clubes/new_york_red_bulls.jpg'),
('ASV Herzogenaurach', '/img/clubes/asv_herzogenaurach.jpg'),
('PSV Eindhoven', '/img/clubes/psv.jpg'),
('HFC Haarlem', '/img/clubes/haarlem.jpg'),
('Metalurh Mariupol', '/img/clubes/metalurh_mariupol.jpg'),
('Eintracht Braunschweig', '/img/clubes/eintracht_braunschweig.jpg'),
('Chornomorets Odessa', '/img/clubes/chornomorets_odessa.jpg'),
('SKA Odessa', '/img/clubes/ska_odessa.jpg'),
('AS Saint-Étienne', '/img/clubes/saint_etienne.jpg'),
('AS Nancy', '/img/clubes/nancy.jpg'),
('Verona', '/img/clubes/verona.jpg'),
('Lanerossi Vicenza', '/img/clubes/lanerossi_vicenza.jpg'),
('Servette', '/img/clubes/servette.jpg'),
('Blacktown City', '/img/clubes/blacktown_city.jpg'),
('Southampton', '/img/clubes/southampton.jpg'),
('Scunthorpe United', '/img/clubes/scunthorpe_united.jpg'),
('Charlton', '/img/clubes/charlton.jpg'),
('Vejle', '/img/clubes/vejle.jpg'),
('TSV 1860 München', '/img/clubes/sc_1906_munchen.jpg'),
('Feyenoord', '/img/clubes/feyenoord.jpg'),
('Levante', '/img/clubes/levante.jpg'),
('Washington Diplomats', '/img/clubes/washington_diplomats.jpg'),
('TSV Nordlingen', '/img/clubes/tsv_nordlingen.jpg'),
('Alessandria', '/img/clubes/alessandria.jpg'),
('Tobermore United', '/img/clubes/tobermore_united.jpg'),
('Nuneaton Borough', '/img/clubes/nuneaton_borough.jpg'),
('Brisbane Lions', '/img/clubes/brisbane_lions.jpg'),
('AFC Bournemouth', '/img/clubes/afc_bournemouth.jpg'),
('Hong Kong Rangers', '/img/clubes/hong_kong_rangers.jpg'),
('Sea Bees', '/img/clubes/sea_bees.jpg'),
('San Jose Earthquakes', '/img/clubes/san_jose_earthquakes.jpg'),
('Hibernian', '/img/clubes/hibernian.jpg'),
('Fort Lauderdale Strikers', '/img/clubes/fort_lauderdale_strikers.jpg'),
('Fulham', '/img/clubes/fulham.jpg'),
('Los Angeles Aztecs', '/img/clubes/los_angeles_aztecs.jpg'),
('Cork Celtic', '/img/clubes/cork_celtic.jpg'),
('Stockport County', '/img/clubes/stockport_county.jpg'),
('Waterford United', '/img/clubes/waterford_united.jpg'),
('Preston North End', '/img/clubes/preston_north_end.jpg'),
('Buffalo Stallions', '/img/clubes/buffalo_stallions.jpg'),
('União de Tomar', '/img/clubes/uniao_de_tomar.jpg'),
('New Jersey Americans', '/img/clubes/new_jersey_americans.jpg'),
('Las Vegas Quicksilvers', '/img/clubes/las_vegas_quicksilvers.jpg'),
('Toronto Blizzard', '/img/clubes/toronto_blizzard.jpg'),
('Beira-Mar', '/img/clubes/beira_mar.jpg'),
('Monterrey', '/img/clubes/monterrey.jpg'),
('Boston Minutemen', '/img/clubes/boston_minutemen.jpg'),
('Sporting Lourenço Marques', '/img/clubes/sporting_lourenco_marques.jpg'),
('New York Cosmos', '/img/clubes/new_york_cosmos.jpg'),
('Vorwärts Steyr', '/img/clubes/vorwarts_steyr.jpg'),
('Aris Limassol', '/img/clubes/aris_limassol.jpg'),
('Cap-Ferret', '/img/clubes/cap_ferret.jpg'),
('Biganos-Boiens', '/img/clubes/biganos_boiens.jpg'),
('New York MetroStars', '/img/clubes/new_york_metrostars.jpg'),
('RCF Vichy','/img/clubes/vichy.jpg'),
('Hellas Verona Football Club', '/img/clubes/hellas_verona.jpg'),
('Al-Nassr', '/img/clubes/al_nassr.jpg'),
('Al-Ahli', '/img/clubes/al_ahli.jpg'),
('Inter Miami', '/img/clubes/inter_miami.jpg'),
('Al-Ittihad', '/img/clubes/al_ittihad.jpg'),
('JS Saint-Pierroise', '/img/clubes/saint_pierroise.jpg');



-- Bobby Charlton
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Bobby Charlton'), (SELECT Id FROM Clube WHERE Nome = 'Manchester United'), 1956, 1973),
((SELECT Id FROM Jogador WHERE Nome = 'Bobby Charlton'), (SELECT Id FROM Clube WHERE Nome = 'Preston North End'), 1974, 1975),
((SELECT Id FROM Jogador WHERE Nome = 'Bobby Charlton'), (SELECT Id FROM Clube WHERE Nome = 'Waterford'), 1976, 1976);

-- Flórián Albert
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Flórián Albert'), (SELECT Id FROM Clube WHERE Nome = 'Ferencváros'), 1958, 1974);

-- George Best
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'George Best'), (SELECT Id FROM Clube WHERE Nome = 'Manchester United'), 1963, 1974),
((SELECT Id FROM Jogador WHERE Nome = 'George Best'), (SELECT Id FROM Clube WHERE Nome = 'Fulham'), 1976, 1977),
((SELECT Id FROM Jogador WHERE Nome = 'George Best'), (SELECT Id FROM Clube WHERE Nome = 'Los Angeles Aztecs'), 1976, 1978),
((SELECT Id FROM Jogador WHERE Nome = 'George Best'), (SELECT Id FROM Clube WHERE Nome = 'Fort Lauderdale Strikers'), 1978, 1979),
((SELECT Id FROM Jogador WHERE Nome = 'George Best'), (SELECT Id FROM Clube WHERE Nome = 'Hibernian'), 1979, 1980);

-- Gianni Rivera
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Gianni Rivera'), (SELECT Id FROM Clube WHERE Nome = 'Alessandria'), 1959, 1960),
((SELECT Id FROM Jogador WHERE Nome = 'Gianni Rivera'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 1960, 1979);

-- Gerd Müller
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Gerd Müller'), (SELECT Id FROM Clube WHERE Nome = '1861 Nördlingen'), 1963, 1964),
((SELECT Id FROM Jogador WHERE Nome = 'Gerd Müller'), (SELECT Id FROM Clube WHERE Nome = 'Bayern de Munique'), 1964, 1979),
((SELECT Id FROM Jogador WHERE Nome = 'Gerd Müller'), (SELECT Id FROM Clube WHERE Nome = 'Fort Lauderdale Strikers'), 1979, 1981);

-- Johan Cruijff
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Johan Cruijff'), (SELECT Id FROM Clube WHERE Nome = 'Ajax'), 1964, 1973),
((SELECT Id FROM Jogador WHERE Nome = 'Johan Cruijff'), (SELECT Id FROM Clube WHERE Nome = 'Barcelona'), 1973, 1978),
((SELECT Id FROM Jogador WHERE Nome = 'Johan Cruijff'), (SELECT Id FROM Clube WHERE Nome = 'Los Angeles Aztecs'), 1979, 1980),
((SELECT Id FROM Jogador WHERE Nome = 'Johan Cruijff'), (SELECT Id FROM Clube WHERE Nome = 'Washington Diplomats'), 1980, 1981),
((SELECT Id FROM Jogador WHERE Nome = 'Johan Cruijff'), (SELECT Id FROM Clube WHERE Nome = 'Levante'), 1981, 1981),
((SELECT Id FROM Jogador WHERE Nome = 'Johan Cruijff'), (SELECT Id FROM Clube WHERE Nome = 'Ajax'), 1981, 1983),
((SELECT Id FROM Jogador WHERE Nome = 'Johan Cruijff'), (SELECT Id FROM Clube WHERE Nome = 'Feyenoord'), 1983, 1984);

-- Franz Beckenbauer
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Franz Beckenbauer'), (SELECT Id FROM Clube WHERE Nome = 'Bayern de Munique'), 1964, 1977),
((SELECT Id FROM Jogador WHERE Nome = 'Franz Beckenbauer'), (SELECT Id FROM Clube WHERE Nome = 'New York Cosmos'), 1977, 1980),
((SELECT Id FROM Jogador WHERE Nome = 'Franz Beckenbauer'), (SELECT Id FROM Clube WHERE Nome = 'Hamburgo'), 1980, 1982),
((SELECT Id FROM Jogador WHERE Nome = 'Franz Beckenbauer'), (SELECT Id FROM Clube WHERE Nome = 'New York Cosmos'), 1983, 1983);

-- Oleg Blokhin
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Oleg Blokhin'), (SELECT Id FROM Clube WHERE Nome = 'Dínamo Kiev'), 1969, 1988),
((SELECT Id FROM Jogador WHERE Nome = 'Oleg Blokhin'), (SELECT Id FROM Clube WHERE Nome = 'Vorwärts Steyr'), 1988, 1989),
((SELECT Id FROM Jogador WHERE Nome = 'Oleg Blokhin'), (SELECT Id FROM Clube WHERE Nome = 'Aris Limassol'), 1989, 1990);

-- Allan Simonsen
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Allan Simonsen'), (SELECT Id FROM Clube WHERE Nome = 'Vejle'), 1971, 1972),
((SELECT Id FROM Jogador WHERE Nome = 'Allan Simonsen'), (SELECT Id FROM Clube WHERE Nome = 'Borussia Mönchengladbach'), 1972, 1979),
((SELECT Id FROM Jogador WHERE Nome = 'Allan Simonsen'), (SELECT Id FROM Clube WHERE Nome = 'Barcelona'), 1979, 1982),
((SELECT Id FROM Jogador WHERE Nome = 'Allan Simonsen'), (SELECT Id FROM Clube WHERE Nome = 'Charlton Athletic'), 1982, 1983),
((SELECT Id FROM Jogador WHERE Nome = 'Allan Simonsen'), (SELECT Id FROM Clube WHERE Nome = 'Vejle'), 1983, 1989);

-- Kevin Keegan
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Kevin Keegan'), (SELECT Id FROM Clube WHERE Nome = 'Scunthorpe United'), 1968, 1971),
((SELECT Id FROM Jogador WHERE Nome = 'Kevin Keegan'), (SELECT Id FROM Clube WHERE Nome = 'Liverpool'), 1971, 1977),
((SELECT Id FROM Jogador WHERE Nome = 'Kevin Keegan'), (SELECT Id FROM Clube WHERE Nome = 'Hamburger SV'), 1977, 1980),
((SELECT Id FROM Jogador WHERE Nome = 'Kevin Keegan'), (SELECT Id FROM Clube WHERE Nome = 'Southampton'), 1980, 1982),
((SELECT Id FROM Jogador WHERE Nome = 'Kevin Keegan'), (SELECT Id FROM Clube WHERE Nome = 'Newcastle United'), 1982, 1984),
((SELECT Id FROM Jogador WHERE Nome = 'Kevin Keegan'), (SELECT Id FROM Clube WHERE Nome = 'Blacktown City'), 1985, 1985);

-- Karl-Heinz Rummenigge
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Karl-Heinz Rummenigge'), (SELECT Id FROM Clube WHERE Nome = 'Bayern de Munique'), 1974, 1984),
((SELECT Id FROM Jogador WHERE Nome = 'Karl-Heinz Rummenigge'), (SELECT Id FROM Clube WHERE Nome = 'Inter de Milão'), 1984, 1987),
((SELECT Id FROM Jogador WHERE Nome = 'Karl-Heinz Rummenigge'), (SELECT Id FROM Clube WHERE Nome = 'Servette'), 1987, 1989);

-- Paolo Rossi
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Paolo Rossi'), (SELECT Id FROM Clube WHERE Nome = 'Juventus'), 1973, 1975),
((SELECT Id FROM Jogador WHERE Nome = 'Paolo Rossi'), (SELECT Id FROM Clube WHERE Nome = 'Lanerossi Vicenza'), 1976, 1979),
((SELECT Id FROM Jogador WHERE Nome = 'Paolo Rossi'), (SELECT Id FROM Clube WHERE Nome = 'Juventus'), 1981, 1985),
((SELECT Id FROM Jogador WHERE Nome = 'Paolo Rossi'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 1985, 1986),
((SELECT Id FROM Jogador WHERE Nome = 'Paolo Rossi'), (SELECT Id FROM Clube WHERE Nome = 'Hellas Verona Football Club'), 1986, 1987);

-- Michel Platini
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Michel Platini'), (SELECT Id FROM Clube WHERE Nome = 'AS Nancy'), 1972, 1979),
((SELECT Id FROM Jogador WHERE Nome = 'Michel Platini'), (SELECT Id FROM Clube WHERE Nome = 'AS Saint-Étienne'), 1979, 1982),
((SELECT Id FROM Jogador WHERE Nome = 'Michel Platini'), (SELECT Id FROM Clube WHERE Nome = 'Juventus'), 1982, 1987);

-- Igor Belanov
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Igor Belanov'), (SELECT Id FROM Clube WHERE Nome = 'SKA Odesa'), 1979, 1980),
((SELECT Id FROM Jogador WHERE Nome = 'Igor Belanov'), (SELECT Id FROM Clube WHERE Nome = 'Chornomorets Odesa'), 1981, 1984),
((SELECT Id FROM Jogador WHERE Nome = 'Igor Belanov'), (SELECT Id FROM Clube WHERE Nome = 'Dínamo Kiev'), 1985, 1989),
((SELECT Id FROM Jogador WHERE Nome = 'Igor Belanov'), (SELECT Id FROM Clube WHERE Nome = 'Borussia Mönchengladbach'), 1989, 1990),
((SELECT Id FROM Jogador WHERE Nome = 'Igor Belanov'), (SELECT Id FROM Clube WHERE Nome = 'Eintracht Braunschweig'), 1991, 1995),
((SELECT Id FROM Jogador WHERE Nome = 'Igor Belanov'), (SELECT Id FROM Clube WHERE Nome = 'Chornomorets Odessa'), 1995, 1996),
((SELECT Id FROM Jogador WHERE Nome = 'Igor Belanov'), (SELECT Id FROM Clube WHERE Nome = 'Metalurh Mariupol'), 1996, 1997);

-- Ruud Gullit
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Ruud Gullit'), (SELECT Id FROM Clube WHERE Nome = 'HFC Haarlem'), 1979, 1982),
((SELECT Id FROM Jogador WHERE Nome = 'Ruud Gullit'), (SELECT Id FROM Clube WHERE Nome = 'Feyenoord'), 1982, 1985),
((SELECT Id FROM Jogador WHERE Nome = 'Ruud Gullit'), (SELECT Id FROM Clube WHERE Nome = 'PSV Eindhoven'), 1985, 1987),
((SELECT Id FROM Jogador WHERE Nome = 'Ruud Gullit'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 1987, 1993),
((SELECT Id FROM Jogador WHERE Nome = 'Ruud Gullit'), (SELECT Id FROM Clube WHERE Nome = 'Sampdoria'), 1993, 1994),
((SELECT Id FROM Jogador WHERE Nome = 'Ruud Gullit'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 1994, 1994),
((SELECT Id FROM Jogador WHERE Nome = 'Ruud Gullit'), (SELECT Id FROM Clube WHERE Nome = 'Sampdoria'), 1994, 1995),
((SELECT Id FROM Jogador WHERE Nome = 'Ruud Gullit'), (SELECT Id FROM Clube WHERE Nome = 'Chelsea'), 1995, 1998);

-- Marco Van Basten
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Marco Van Basten'), (SELECT Id FROM Clube WHERE Nome = 'Ajax'), 1981, 1987),
((SELECT Id FROM Jogador WHERE Nome = 'Marco Van Basten'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 1987, 1995);

-- Lothar Matthäus
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Lothar Matthäus'), (SELECT Id FROM Clube WHERE Nome = 'Herzogenaurach'), 1978, 1979),
((SELECT Id FROM Jogador WHERE Nome = 'Lothar Matthäus'), (SELECT Id FROM Clube WHERE Nome = 'Borussia Mönchengladbach'), 1979, 1984),
((SELECT Id FROM Jogador WHERE Nome = 'Lothar Matthäus'), (SELECT Id FROM Clube WHERE Nome = 'Bayern de Munique'), 1984, 1988),
((SELECT Id FROM Jogador WHERE Nome = 'Lothar Matthäus'), (SELECT Id FROM Clube WHERE Nome = 'Inter de Milão'), 1988, 1992),
((SELECT Id FROM Jogador WHERE Nome = 'Lothar Matthäus'), (SELECT Id FROM Clube WHERE Nome = 'Bayern de Munique'), 1992, 2000),
((SELECT Id FROM Jogador WHERE Nome = 'Lothar Matthäus'), (SELECT Id FROM Clube WHERE Nome = 'New York MetroStars'), 2000, 2000);

-- Jean-Pierre Papin
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'RCF Vichy'), 1983, 1984),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'Valenciennes'), 1984, 1985),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'Club Brugge'), 1985, 1986),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'Olympique de Marseille'), 1986, 1992),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 1992, 1994),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'Bayern de Munique'), 1994, 1996),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'Bordeaux'), 1996, 1998),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'Guingamp'), 1998, 1999),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'JS Saint-Pierroise'), 1999, 2001),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'Cap-Ferret'), 2001, 2004),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'Biganos-Boiens'), 2009, 2009);


-- Roberto Baggio
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Roberto Baggio'), (SELECT Id FROM Clube WHERE Nome = 'Lanerossi Vicenza'), 1982, 1985),
((SELECT Id FROM Jogador WHERE Nome = 'Roberto Baggio'), (SELECT Id FROM Clube WHERE Nome = 'Fiorentina'), 1985, 1990),
((SELECT Id FROM Jogador WHERE Nome = 'Roberto Baggio'), (SELECT Id FROM Clube WHERE Nome = 'Juventus'), 1990, 1995),
((SELECT Id FROM Jogador WHERE Nome = 'Roberto Baggio'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 1995, 1997),
((SELECT Id FROM Jogador WHERE Nome = 'Roberto Baggio'), (SELECT Id FROM Clube WHERE Nome = 'Bologna'), 1997, 1998),
((SELECT Id FROM Jogador WHERE Nome = 'Roberto Baggio'), (SELECT Id FROM Clube WHERE Nome = 'Inter de Milão'), 1998, 2000),
((SELECT Id FROM Jogador WHERE Nome = 'Roberto Baggio'), (SELECT Id FROM Clube WHERE Nome = 'Brescia'), 2000, 2004);

-- Hristo Stoichkov
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Hristo Stoichkov'), (SELECT Id FROM Clube WHERE Nome = 'Hebros Harmanli'), 1982, 1984),
((SELECT Id FROM Jogador WHERE Nome = 'Hristo Stoichkov'), (SELECT Id FROM Clube WHERE Nome = 'CSKA Sofia'), 1985, 1990),
((SELECT Id FROM Jogador WHERE Nome = 'Hristo Stoichkov'), (SELECT Id FROM Clube WHERE Nome = 'Barcelona'), 1990, 1995),
((SELECT Id FROM Jogador WHERE Nome = 'Hristo Stoichkov'), (SELECT Id FROM Clube WHERE Nome = 'Parma'), 1995, 1996),
((SELECT Id FROM Jogador WHERE Nome = 'Hristo Stoichkov'), (SELECT Id FROM Clube WHERE Nome = 'Barcelona'), 1996, 1998),
((SELECT Id FROM Jogador WHERE Nome = 'Hristo Stoichkov'), (SELECT Id FROM Clube WHERE Nome = 'CSKA Sofia'), 1998, 1998),
((SELECT Id FROM Jogador WHERE Nome = 'Hristo Stoichkov'), (SELECT Id FROM Clube WHERE Nome = 'Al-Nassr'), 1998, 1998),
((SELECT Id FROM Jogador WHERE Nome = 'Hristo Stoichkov'), (SELECT Id FROM Clube WHERE Nome = 'Kashiwa Reysol'), 1998, 1999),
((SELECT Id FROM Jogador WHERE Nome = 'Hristo Stoichkov'), (SELECT Id FROM Clube WHERE Nome = 'Chicago Fire'), 2000, 2002),
((SELECT Id FROM Jogador WHERE Nome = 'Hristo Stoichkov'), (SELECT Id FROM Clube WHERE Nome = 'D.C. United'), 2003, 2004);

-- George Weah
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'George Weah'), (SELECT Id FROM Clube WHERE Nome = 'AS Monaco'), 1988, 1992),
((SELECT Id FROM Jogador WHERE Nome = 'George Weah'), (SELECT Id FROM Clube WHERE Nome = 'Paris Saint-Germain'), 1992, 1995),
((SELECT Id FROM Jogador WHERE Nome = 'George Weah'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 1995, 2000),
((SELECT Id FROM Jogador WHERE Nome = 'George Weah'), (SELECT Id FROM Clube WHERE Nome = 'Chelsea'), 1999, 2000),
((SELECT Id FROM Jogador WHERE Nome = 'George Weah'), (SELECT Id FROM Clube WHERE Nome = 'Manchester City'), 2000, 2001),
((SELECT Id FROM Jogador WHERE Nome = 'George Weah'), (SELECT Id FROM Clube WHERE Nome = 'Olympique de Marseille'), 2000, 2001),
((SELECT Id FROM Jogador WHERE Nome = 'George Weah'), (SELECT Id FROM Clube WHERE Nome = 'Al-Jazira'), 2001, 2003);

-- Mathias Sammer
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Mathias Sammer'), (SELECT Id FROM Clube WHERE Nome = 'Dynamo Dresden'), 1985, 1990),
((SELECT Id FROM Jogador WHERE Nome = 'Mathias Sammer'), (SELECT Id FROM Clube WHERE Nome = 'VfB Stuttgart'), 1990, 1992),
((SELECT Id FROM Jogador WHERE Nome = 'Mathias Sammer'), (SELECT Id FROM Clube WHERE Nome = 'Inter de Milão'), 1992, 1993),
((SELECT Id FROM Jogador WHERE Nome = 'Mathias Sammer'), (SELECT Id FROM Clube WHERE Nome = 'Borussia Dortmund'), 1993, 1998);

-- Ronaldo
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Cruzeiro'), 1993, 1994),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'PSV Eindhoven'), 1994, 1996),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Barcelona'), 1996, 1997),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Inter de Milão'), 1997, 2002),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid'), 2002, 2007),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 2007, 2008),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Corinthians'), 2009, 2011);

-- Zinedine Zidane
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Zinedine Zidane'), (SELECT Id FROM Clube WHERE Nome = 'AS Cannes'), 1989, 1992),
((SELECT Id FROM Jogador WHERE Nome = 'Zinedine Zidane'), (SELECT Id FROM Clube WHERE Nome = 'Bordeaux'), 1992, 1996),
((SELECT Id FROM Jogador WHERE Nome = 'Zinedine Zidane'), (SELECT Id FROM Clube WHERE Nome = 'Juventus'), 1996, 2001),
((SELECT Id FROM Jogador WHERE Nome = 'Zinedine Zidane'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid'), 2001, 2006);

-- Rivaldo
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Santa Cruz'), 1990, 1992),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Mogi Mirim'), 1992, 1994),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Palmeiras'), 1994, 1996),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Deportivo La Coruña'), 1996, 1997),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Barcelona'), 1997, 2002),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 2002, 2004),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Cruzeiro'), 2004, 2004),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Olympiacos'), 2004, 2007),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'AEK Atenas'), 2007, 2008),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Bunyodkor'), 2008, 2010),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'São Paulo'), 2011, 2011),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Kabuscorp'), 2012, 2012),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'São Caetano'), 2013, 2013),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Mogi Mirim'), 2014, 2015);

-- Luís Figo
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Luís Figo'), (SELECT Id FROM Clube WHERE Nome = 'Sporting CP'), 1989, 1995),
((SELECT Id FROM Jogador WHERE Nome = 'Luís Figo'), (SELECT Id FROM Clube WHERE Nome = 'Barcelona'), 1995, 2000),
((SELECT Id FROM Jogador WHERE Nome = 'Luís Figo'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid'), 2000, 2005),
((SELECT Id FROM Jogador WHERE Nome = 'Luís Figo'), (SELECT Id FROM Clube WHERE Nome = 'Inter de Milão'), 2005, 2009);

-- Michael Owen
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Michael Owen'), (SELECT Id FROM Clube WHERE Nome = 'Liverpool'), 1996, 2004),
((SELECT Id FROM Jogador WHERE Nome = 'Michael Owen'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid'), 2004, 2005),
((SELECT Id FROM Jogador WHERE Nome = 'Michael Owen'), (SELECT Id FROM Clube WHERE Nome = 'Newcastle United'), 2005, 2009),
((SELECT Id FROM Jogador WHERE Nome = 'Michael Owen'), (SELECT Id FROM Clube WHERE Nome = 'Manchester United'), 2009, 2012),
((SELECT Id FROM Jogador WHERE Nome = 'Michael Owen'), (SELECT Id FROM Clube WHERE Nome = 'Stoke City'), 2012, 2013);

-- Pavel Nedved
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Pavel Nedved'), (SELECT Id FROM Clube WHERE Nome = 'Dukla Praga'), 1991, 1992),
((SELECT Id FROM Jogador WHERE Nome = 'Pavel Nedved'), (SELECT Id FROM Clube WHERE Nome = 'Sparta Praga'), 1992, 1996),
((SELECT Id FROM Jogador WHERE Nome = 'Pavel Nedved'), (SELECT Id FROM Clube WHERE Nome = 'SS Lazio'), 1996, 2001),
((SELECT Id FROM Jogador WHERE Nome = 'Pavel Nedved'), (SELECT Id FROM Clube WHERE Nome = 'Juventus'), 2001, 2009);

-- Andriy Shevchenko
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Andriy Shevchenko'), (SELECT Id FROM Clube WHERE Nome = 'Dínamo Kiev'), 1994, 1999),
((SELECT Id FROM Jogador WHERE Nome = 'Andriy Shevchenko'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 1999, 2006),
((SELECT Id FROM Jogador WHERE Nome = 'Andriy Shevchenko'), (SELECT Id FROM Clube WHERE Nome = 'Chelsea'), 2006, 2009),
((SELECT Id FROM Jogador WHERE Nome = 'Andriy Shevchenko'), (SELECT Id FROM Clube WHERE Nome = 'Dínamo Kiev'), 2009, 2012);

-- Ronaldinho Gaúcho
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldinho Gaúcho'), (SELECT Id FROM Clube WHERE Nome = 'Grêmio'), 1998, 2001),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldinho Gaúcho'), (SELECT Id FROM Clube WHERE Nome = 'Paris Saint-Germain'), 2001, 2003),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldinho Gaúcho'), (SELECT Id FROM Clube WHERE Nome = 'Barcelona'), 2003, 2008),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldinho Gaúcho'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 2008, 2011),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldinho Gaúcho'), (SELECT Id FROM Clube WHERE Nome = 'Flamengo'), 2011, 2012),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldinho Gaúcho'), (SELECT Id FROM Clube WHERE Nome = 'Atlético Mineiro'), 2012, 2014),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldinho Gaúcho'), (SELECT Id FROM Clube WHERE Nome = 'Querétaro'), 2014, 2015),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldinho Gaúcho'), (SELECT Id FROM Clube WHERE Nome = 'Fluminense'), 2015, 2015);

-- Fabio Cannavaro
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Fabio Cannavaro'), (SELECT Id FROM Clube WHERE Nome = 'Napoli'), 1992, 1995),
((SELECT Id FROM Jogador WHERE Nome = 'Fabio Cannavaro'), (SELECT Id FROM Clube WHERE Nome = 'Parma'), 1995, 2002),
((SELECT Id FROM Jogador WHERE Nome = 'Fabio Cannavaro'), (SELECT Id FROM Clube WHERE Nome = 'Inter de Milão'), 2002, 2004),
((SELECT Id FROM Jogador WHERE Nome = 'Fabio Cannavaro'), (SELECT Id FROM Clube WHERE Nome = 'Juventus'), 2004, 2006),
((SELECT Id FROM Jogador WHERE Nome = 'Fabio Cannavaro'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid'), 2006, 2009),
((SELECT Id FROM Jogador WHERE Nome = 'Fabio Cannavaro'), (SELECT Id FROM Clube WHERE Nome = 'Juventus'), 2009, 2010),
((SELECT Id FROM Jogador WHERE Nome = 'Fabio Cannavaro'), (SELECT Id FROM Clube WHERE Nome = 'Al-Ahli '), 2010, 2011);

-- Kaká
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Kaká'), (SELECT Id FROM Clube WHERE Nome = 'São Paulo'), 2001, 2003),
((SELECT Id FROM Jogador WHERE Nome = 'Kaká'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 2003, 2009),
((SELECT Id FROM Jogador WHERE Nome = 'Kaká'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid'), 2009, 2013),
((SELECT Id FROM Jogador WHERE Nome = 'Kaká'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 2013, 2014),
((SELECT Id FROM Jogador WHERE Nome = 'Kaká'), (SELECT Id FROM Clube WHERE Nome = 'Orlando City'), 2015, 2017);

-- Cristiano Ronaldo
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Cristiano Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Sporting CP'), 2002, 2003),
((SELECT Id FROM Jogador WHERE Nome = 'Cristiano Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Manchester United'), 2003, 2009),
((SELECT Id FROM Jogador WHERE Nome = 'Cristiano Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid'), 2009, 2018),
((SELECT Id FROM Jogador WHERE Nome = 'Cristiano Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Juventus'), 2018, 2021),
((SELECT Id FROM Jogador WHERE Nome = 'Cristiano Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Manchester United'), 2021, 2022),
((SELECT Id FROM Jogador WHERE Nome = 'Cristiano Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Al-Nassr'), 2023, 2025);

-- Lionel Messi
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Lionel Messi'), (SELECT Id FROM Clube WHERE Nome = 'Barcelona'), 2004, 2021),
((SELECT Id FROM Jogador WHERE Nome = 'Lionel Messi'), (SELECT Id FROM Clube WHERE Nome = 'Paris Saint-Germain'), 2021, 2023),
((SELECT Id FROM Jogador WHERE Nome = 'Lionel Messi'), (SELECT Id FROM Clube WHERE Nome = 'Inter Miami'), 2023, 2025);

-- Luka Modric
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Luka Modric'), (SELECT Id FROM Clube WHERE Nome = 'Dínamo Zagreb'), 2003, 2008),
((SELECT Id FROM Jogador WHERE Nome = 'Luka Modric'), (SELECT Id FROM Clube WHERE Nome = 'Tottenham'), 2008, 2012),
((SELECT Id FROM Jogador WHERE Nome = 'Luka Modric'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid'), 2012, 2025),
((SELECT Id FROM Jogador WHERE Nome = 'Luka Modric'), (SELECT Id FROM Clube WHERE Nome = 'Ac Milan'), 2025, 2025);

-- Karin Benzema
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Karim Benzema'), (SELECT Id FROM Clube WHERE Nome = 'Lyon'), 2005, 2009),
((SELECT Id FROM Jogador WHERE Nome = 'Karim Benzema'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid'), 2009, 2023),
((SELECT Id FROM Jogador WHERE Nome = 'Karim Benzema'), (SELECT Id FROM Clube WHERE Nome = 'Al-Ittihad'), 2023, 2025);

-- Rodri
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Rodri'), (SELECT Id FROM Clube WHERE Nome = 'Villarreal'), 2016, 2018),
((SELECT Id FROM Jogador WHERE Nome = 'Rodri'), (SELECT Id FROM Clube WHERE Nome = 'Atlético de Madrid'), 2018, 2019),
((SELECT Id FROM Jogador WHERE Nome = 'Rodri'), (SELECT Id FROM Clube WHERE Nome = 'Manchester City'), 2019, 2025);

-- Ousmane Dembélé
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Ousmane Dembélé'), (SELECT Id FROM Clube WHERE Nome = 'Rennes'), 2015, 2016),
((SELECT Id FROM Jogador WHERE Nome = 'Ousmane Dembélé'), (SELECT Id FROM Clube WHERE Nome = 'Borussia Dortmund'), 2016, 2017),
((SELECT Id FROM Jogador WHERE Nome = 'Ousmane Dembélé'), (SELECT Id FROM Clube WHERE Nome = 'Barcelona'), 2017, 2023),
((SELECT Id FROM Jogador WHERE Nome = 'Ousmane Dembélé'), (SELECT Id FROM Clube WHERE Nome = 'Paris Saint-Germain'), 2023, 2025);

select * from clube;
