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
    Imagem VARCHAR(200),
    Cor VARCHAR(10)
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
    Ano YEAR NULL,
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
('Stanley Matthews', 8, 6, 1.72, '/img/jogadores/stanley_matthews.jpg', 'Sir Stanley Matthews (1915–2000) foi um dos maiores jogadores da história do futebol inglês e mundial, conhecido como o “Mago do Drible” (Wizard of the Dribble) pela sua habilidade extraordinária com a bola. Nascido em Hanley, Stoke-on-Trent, começou a carreira profissional no Stoke City em 1932, destacando-se pela velocidade, controle de bola e elegância em campo. Em 1947 transferiu-se para o Blackpool, clube onde viveu o ponto alto da carreira ao protagonizar a lendária final da FA Cup de 1953 — conhecida como “A Final de Matthews” — em que sua atuação foi decisiva na virada histórica sobre o Bolton Wanderers. Jogou profissionalmente até os 50 anos, uma marca impressionante para a época, e foi o primeiro vencedor da Bola de Ouro em 1956. Representou a seleção inglesa em 54 partidas, marcando 11 gols, e foi agraciado com o título de cavaleiro em 1965, tornando-se o único jogador a ser condecorado enquanto ainda atuava. Matthews ficou famoso não apenas pelo talento, mas também pela ética exemplar, humildade e longevidade, sendo lembrado como um símbolo de fair play e dedicação ao futebol. Pelé chegou a afirmar que ele “nos ensinou como o futebol deve ser jogado”, resumindo bem o impacto duradouro de uma lenda que transcendeu gerações.'),
('Alfredo Di Stéfano', 1, 6, 1.76, '/img/jogadores/alfredo_di_stefano.jpg', 'Alfredo Di Stéfano (1926–2014) foi um dos jogadores mais completos e influentes da história do futebol mundial. Nascido em Buenos Aires, Argentina, destacou-se pela sua versatilidade, inteligência tática e incansável espírito competitivo. Iniciou a carreira no River Plate, onde rapidamente se tornou uma estrela, conquistando títulos e demonstrando uma notável capacidade de marcar gols. Após uma breve passagem pelo futebol colombiano, no Millonarios, transferiu-se para o Real Madrid em 1953, clube no qual se tornaria uma verdadeira lenda. No time espanhol, Di Stéfano foi o cérebro e o coração de uma das eras mais dominantes do futebol europeu, conduzindo o Real Madrid à conquista de cinco Copas dos Campeões da Europa consecutivas (1956–1960). Seu estilo de jogo era notável por unir técnica refinada, visão de jogo, precisão nos passes e faro de gol — atuava em várias posições do campo, influenciando o jogo tanto na defesa quanto no ataque. Venceu duas vezes a Bola de Ouro (1957 e 1959) e é considerado um dos pilares do futebol moderno, sendo muitas vezes citado como inspiração por jogadores e treinadores. Representou três seleções diferentes — Argentina, Colômbia e Espanha — algo incomum e reflexo da sua carreira internacional multifacetada. Após pendurar as chuteiras, teve também uma longa trajetória como treinador. Di Stéfano personificou o espírito de liderança e genialidade dentro de campo, e seu legado permanece profundamente ligado à identidade vencedora do Real Madrid, sendo lembrado como um dos maiores futebolistas de todos os tempos.'),
('Raymond Kopa', 4, 5, 1.68, '/img/jogadores/raymond_kopa.jpg', 'Raymond Kopa (1931–2017) foi um dos grandes nomes do futebol francês e uma das primeiras estrelas internacionais do esporte europeu. Nascido em Nœux-les-Mines, no norte da França, filho de imigrantes poloneses, Kopa destacou-se desde jovem pelo talento técnico, agilidade e inteligência dentro de campo. Começou a carreira no Angers SCO, mas foi no Stade de Reims que ganhou projeção nacional, liderando uma das equipes mais brilhantes do futebol francês nos anos 1950. Sua habilidade com a bola, dribles curtos e passes precisos chamaram a atenção do Real Madrid, que o contratou em 1956. No clube espanhol, Kopa integrou a lendária equipe que dominou o futebol europeu, jogando ao lado de craques como Alfredo Di Stéfano e Ferenc Puskás, conquistando três Copas dos Campeões consecutivas (1957, 1958 e 1959). Kopa foi também um dos protagonistas da seleção francesa na Copa do Mundo de 1958, na Suécia, quando a França alcançou o terceiro lugar com um ataque histórico liderado por Just Fontaine. Nesse mesmo ano, foi eleito o vencedor da Bola de Ouro, coroando sua fase extraordinária. Reconhecido por seu estilo elegante, humildade e visão de jogo, Raymond Kopa representava o futebol artístico e técnico, tornando-se um símbolo de uma geração que marcou o início da era moderna do futebol europeu. Depois de encerrar a carreira, continuou a ser uma figura respeitada no esporte francês, sendo lembrado como um pioneiro que abriu caminho para a ascensão do futebol da França no cenário mundial.'),
('Luis Suárez Miramontes', 9, 5, 1.75, '/img/jogadores/luis_suarez_1960.jpg', 'Luis Suárez Miramontes (1935–2023) foi um dos maiores jogadores espanhóis da história. Nascido em A Coruña, destacou-se pelo talento, visão de jogo e passes precisos. Fez sucesso no Barcelona, conquistando títulos nacionais e internacionais, e em 1960 venceu a Bola de Ouro, sendo até hoje o único espanhol a conquistar o prêmio. Em 1961 transferiu-se para a Internazionale, onde brilhou na lendária Grande Inter, vencendo duas Copas dos Campeões e diversos títulos italianos. Pela seleção espanhola, foi fundamental na conquista do Campeonato Europeu de 1964. Reconhecido por sua classe e inteligência em campo, Suárez deixou um legado duradouro como um dos maiores meio-campistas da sua geração.'),
('Omar Sivori', 1, 6, 1.68, '/img/jogadores/omar_sivori.jpg', 'Omar Sivori (1935–1988) foi um atacante argentino de enorme técnica, ídolo da Juventus e Napoli. Destacava-se pelos dribles rápidos, criatividade e faro de gol, sendo peça-chave nas conquistas nacionais. Campeão da Bola de Ouro em 1961, Sivori é lembrado como um dos maiores talentos argentinos de sua geração.'),
('Josef Masopust', 10, 5, 1.77, '/img/jogadores/josef_masopust.jpg', 'Josef Masopust (1931–2015) foi um elegante meio-campista tcheco, líder em campo e símbolo de disciplina tática. Levou a Tchecoslováquia ao vice-campeonato mundial em 1962 e conquistou a Bola de Ouro no mesmo ano, sendo reconhecido por passes precisos e postura exemplar.'),
('Lev Yashin', 11, 1, 1.89, '/img/jogadores/lev_yashin.jpg', 'Lev Yashin (1929–1990), conhecido como "Aranha Negra", é considerado o maior goleiro de todos os tempos. Ícone do Dínamo Moscou e da URSS, foi o único goleiro a vencer a Bola de Ouro, graças a reflexos incríveis, liderança e defesas memoráveis.'),
('Denis Law', 12, 6, 1.75, '/img/jogadores/denis_law.jpg', 'Denis Law (1940–2023) foi um atacante escocês veloz e técnico, ídolo do Manchester United nos anos 60. Campeão da Bola de Ouro em 1964, destacou-se por gols decisivos e grande presença em campo, tornando-se uma lenda do futebol escocês.'),
('Eusébio', 2, 6, 1.75, '/img/jogadores/eusebio.jpg', 'Eusébio (1942–2014), "Pantera Negra", foi o maior jogador da história de Portugal. Ídolo do Benfica, combinava velocidade, força física e finalização precisa, conquistando títulos nacionais e internacionais. Campeão da Bola de Ouro em 1965, brilhou na Copa do Mundo de 1966.'),
('Bobby Charlton', 8, 5, 1.73, '/img/jogadores/bobby_charlton.jpg', 'Bobby Charlton (1937–2023) foi um meia inglês ídolo do Manchester United e campeão mundial em 1966. Reconhecido por técnica, visão de jogo e liderança, Charlton também conquistou a Bola de Ouro, consolidando-se como um dos grandes nomes do futebol inglês.'),
('Flórián Albert', 13, 6, 1.82, '/img/jogadores/florian_albert.jpg', 'Flórián Albert (1941–2011) foi um atacante húngaro elegante, ídolo do Ferencvárosi TC. Vencedor da Bola de Ouro em 1967, destacou-se por visão de jogo, finalizações precisas e grande capacidade de criar jogadas, sendo lembrado como um dos maiores jogadores da Hungria.'),
('George Best', 8, 6, 1.75, '/img/jogadores/george_best.jpg', 'George Best (1946–2005) foi um atacante norte-irlandês, ídolo do Manchester United. Gênio do drible e do estilo dentro e fora de campo, conquistou a Bola de Ouro em 1968 e é lembrado como um dos maiores talentos do futebol europeu da década de 60.'),
('Gianni Rivera', 6, 5, 1.75, '/img/jogadores/gianni_rivera.jpg', 'Gianni Rivera (1943–2023) foi um meia italiano clássico, ídolo do Milan e cérebro da equipe. Reconhecido por passes precisos, visão de jogo e liderança, conquistou a Bola de Ouro em 1969 e influenciou gerações de meio-campistas na Itália.'),
('Gerd Müller', 7, 6, 1.76, '/img/jogadores/gerd_muller.jpg', 'Gerd Müller (1945–2021), o “Bombardeiro da Baviera”, foi um atacante alemão letal em frente ao gol. Ídolo do Bayern de Munique e da seleção alemã, venceu a Bola de Ouro em 1970, sendo um dos maiores artilheiros da história do futebol.'),
('Johan Cruijff', 14, 6, 1.78, '/img/jogadores/johan_cruijff.jpg', 'Johan Cruijff (1947–2016) foi o símbolo do futebol total holandês, revolucionando a forma de jogar e pensar o futebol. Tricampeão da Bola de Ouro (1971, 1973, 1974), foi ídolo do Ajax e Barcelona, deixando um legado de técnica, inteligência e filosofia de jogo.'),
('Franz Beckenbauer', 7, 2, 1.81, '/img/jogadores/franz_beckenbauer.jpg', 'Franz Beckenbauer (n. 1945) é o lendário “Kaiser”, defensor e líder da Alemanha e do Bayern de Munique. Bicampeão da Bola de Ouro, foi pioneiro no papel de líbero moderno, unindo técnica, visão de jogo e liderança em campo.'),
('Oleg Blokhin', 15, 6, 1.79, '/img/jogadores/oleg_blokhin.jpg', 'Oleg Blokhin (n. 1952) foi um atacante ucraniano ídolo do Dínamo Kiev. Vencedor da Bola de Ouro em 1975, destacou-se por velocidade, dribles e faro de gol, tornando-se referência do futebol soviético.'),
('Allan Simonsen', 16, 6, 1.65, '/img/jogadores/allan_simonsen.jpg', 'Allan Simonsen (n. 1952) foi um atacante dinamarquês ágil e habilidoso, destaque do Borussia Mönchengladbach. Vencedor da Bola de Ouro em 1977, é lembrado por técnica refinada e capacidade de decidir partidas importantes.'),
('Kevin Keegan', 8, 6, 1.73, '/img/jogadores/kevin_keegan.jpg', 'Kevin Keegan (n. 1951) foi um atacante inglês, ídolo de Liverpool e Hamburgo. Bicampeão da Bola de Ouro (1978, 1979), combinava velocidade, inteligência e poder de finalização, sendo um dos grandes nomes do futebol inglês e europeu.'),
('Karl-Heinz Rummenigge', 7, 6, 1.82, '/img/jogadores/rummenigge.jpg', 'Karl-Heinz Rummenigge (n. 1955) foi um atacante alemão do Bayern de Munique, bicampeão da Bola de Ouro (1980, 1981). Conhecido por técnica, inteligência e faro de gol, tornou-se uma referência do futebol alemão nos anos 80.'),
('Paolo Rossi', 6, 6, 1.74, '/img/jogadores/paolo_rossi.jpg', 'Paolo Rossi (1956–2020) foi o herói da Itália na Copa de 1982, artilheiro e campeão mundial. Vencedor da Bola de Ouro no mesmo ano, destacou-se por posicionamento, finalização precisa e capacidade de decidir jogos importantes.'),
('Michel Platini', 4, 5, 1.78, '/img/jogadores/michel_platini.jpg', 'Michel Platini (n. 1955) foi um meia francês clássico, ídolo da Juventus. Tricampeão da Bola de Ouro (1983, 1984, 1985), destacou-se por passes precisos, cobranças de falta e liderança em campo, sendo referência no futebol europeu dos anos 80.'),
('Igor Belanov', 15, 6, 1.75, '/img/jogadores/igor_belanov.jpg', 'Igor Belanov (n. 1960) foi um atacante ucraniano do Dínamo Kiev, vencedor da Bola de Ouro em 1986. Reconhecido por velocidade, técnica e faro de gol, Belanov foi um dos destaques do futebol soviético na década de 80.'),
('Ruud Gullit', 14, 5, 1.91, '/img/jogadores/ruud_gullit.jpg', 'Ruud Gullit (n. 1962) foi um líder holandês e estrela do Milan nos anos 80. Campeão da Bola de Ouro em 1987, combinava força física, técnica e versatilidade, sendo ícone do futebol total moderno.'),
('Marco van Basten', 14, 6, 1.88, '/img/jogadores/marco_van_basten.jpg', 'Marco van Basten (n. 1964) foi um atacante elegante e letal, ídolo do Milan e da seleção holandesa. Tricampeão da Bola de Ouro (1988, 1989, 1992), ficou famoso por gols de antologia, finalizações precisas e inteligência tática.'),
('Lothar Matthäus', 7, 5, 1.74, '/img/jogadores/lothar_matthaus.jpg', 'Lothar Matthäus (n. 1961) foi um meia e líbero alemão, campeão mundial em 1990. Vencedor da Bola de Ouro, destacou-se por liderança, força física e capacidade de organizar o meio-campo, sendo ícone do futebol alemão.'),
('Jean-Pierre Papin', 4, 6, 1.76, '/img/jogadores/jean_pierre_papin.jpg', 'Jean-Pierre Papin (n. 1963) foi um atacante francês do Olympique de Marseille, campeão da Bola de Ouro em 1991. Conhecido por finalização precisa e habilidade aérea, Papin foi um dos grandes goleadores da França.'),
('Roberto Baggio', 6, 5, 1.74, '/img/jogadores/roberto_baggio.jpg', 'Roberto Baggio (n. 1967) foi um craque italiano de técnica e genialidade, ídolo da Juventus. Vencedor da Bola de Ouro em 1993, destacou-se por dribles, cobranças de falta e capacidade de decidir jogos importantes.'),
('Hristo Stoichkov', 17, 6, 1.78, '/img/jogadores/hristo_stoichkov.jpg', 'Hristo Stoichkov (n. 1966) foi um atacante búlgaro explosivo, estrela do Barcelona. Campeão da Bola de Ouro em 1994, destacou-se por velocidade, gols e intensidade, sendo símbolo da geração dourada do futebol búlgaro.'),
('George Weah', 18, 6, 1.84, '/img/jogadores/george_weah.jpg', 'George Weah (n. 1966) foi um atacante liberiano e ídolo do Milan. Primeiro africano a vencer a Bola de Ouro em 1995, combinava força, velocidade e habilidade, abrindo caminho para o futebol africano na elite mundial.'),
('Mathias Sammer', 7, 2, 1.81, '/img/jogadores/mathias_sammer.jpg', 'Mathias Sammer (n. 1967) foi um zagueiro líbero alemão, destaque do Borussia Dortmund. Campeão da Bola de Ouro em 1996, destacou-se por liderança, inteligência tática e capacidade defensiva exemplar.'),
('Ronaldo', 5, 6, 1.83, '/img/jogadores/ronaldo.jpg', 'Ronaldo Nazário, o “Fenômeno” (n. 1976), é considerado um dos maiores atacantes de todos os tempos. Brilhou no Cruzeiro, PSV, Barcelona, Inter de Milão e Real Madrid, conquistando títulos nacionais e internacionais, incluindo duas Copas do Mundo (1994 e 2002) e sendo artilheiro da Copa de 2002. Reconhecido por velocidade explosiva, dribles desconcertantes e finalização letal, Ronaldo combinava força física e técnica refinada, capaz de desequilibrar qualquer defesa. Além das conquistas individuais, como duas Bolas de Ouro (1997 e 2002), seu legado influenciou gerações de atacantes, tornando-o referência mundial de excelência no ataque.'),
('Zinedine Zidane', 4, 5, 1.85, '/img/jogadores/zinedine_zidane.jpg', 'Zinedine Zidane (n. 1972) é um dos maiores meias da história, ídolo de Juventus e Real Madrid. Campeão da Copa do Mundo e da Eurocopa com a França, conquistou a Bola de Ouro em 1998. Zidane destacava-se por elegância, técnica apurada, visão de jogo e controle de bola, além de ser decisivo em momentos importantes, como a final da Copa do Mundo de 1998 e a final da Liga dos Campeões de 2002. Seu legado vai além das estatísticas, influenciando a forma como o futebol moderno valoriza meias completos, capazes de articular e finalizar com maestria.'),
('Rivaldo', 5, 5, 1.86, '/img/jogadores/rivaldo.jpg', 'Rivaldo (n. 1972) foi um dos grandes talentos brasileiros da década de 1990, destaque no Barcelona e na seleção brasileira campeã da Copa de 2002. Vencedor da Bola de Ouro em 1999, Rivaldo combinava habilidade, criatividade e precisão nos chutes de longa distância, além de grande visão de jogo. Capaz de atuar como meia ou atacante, sua capacidade de decidir partidas e criar jogadas impossíveis tornou-o um ícone do futebol brasileiro e mundial.'),
('Luís Figo', 2, 5, 1.80, '/img/jogadores/luis_figo.jpg', 'Luís Figo (n. 1972) foi um extremo português, ídolo de Barcelona e Real Madrid, campeão europeu pelo Real Madrid e vencedor da Bola de Ouro em 2000. Conhecido pela técnica refinada, dribles desconcertantes e inteligência tática, Figo combinava habilidade individual com capacidade de criar jogadas para o time. Sua carreira é lembrada tanto pelo sucesso em clubes quanto pela liderança em Portugal, sendo um dos maiores jogadores europeus de sua geração.'),
('Michael Owen', 8, 6, 1.73, '/img/jogadores/michael_owen.jpg', 'Michael Owen (n. 1979) foi um atacante inglês veloz e clínico, destaque do Liverpool e da seleção inglesa. Vencedor da Bola de Ouro em 2001, Owen era conhecido por sua velocidade explosiva, inteligência no posicionamento e capacidade de finalizar com precisão em espaços curtos. Mesmo enfrentando lesões ao longo da carreira, deixou um legado de decisividade e gols importantes, sendo um dos atacantes mais temidos da Inglaterra nos anos 2000.'),
('Pavel Nedved', 10, 5, 1.77, '/img/jogadores/pavel_nedved.jpg', 'Pavel Nedved (n. 1972) foi um meio-campista tcheco de classe mundial, ídolo da Juventus. Campeão da Bola de Ouro em 2003, destacou-se por resistência física, passes precisos, chegada ao ataque e capacidade de decidir jogos em momentos cruciais. Nedved era um jogador completo, combinando disciplina tática com talento ofensivo, e sua influência ajudou a consolidar a Juventus como referência do futebol europeu na virada do século.'),
('Andriy Shevchenko', 15, 6, 1.83, '/img/jogadores/andriy_shevchenko.jpg', 'Andriy Shevchenko (n. 1976) é um dos maiores atacantes da história da Ucrânia, ídolo do Milan e da seleção ucraniana. Campeão da Bola de Ouro em 2004, Shevchenko combinava velocidade, técnica refinada, faro de gol e inteligência para se posicionar, sendo decisivo em partidas de clubes e seleções. Com mais de 300 gols na carreira, tornou-se referência para atacantes modernos, admirado por sua eficiência e capacidade de definir grandes jogos.'),
('Ronaldinho Gaúcho', 5, 5, 1.82, '/img/jogadores/ronaldinho.jpg', 'Ronaldinho Gaúcho (n. 1980) foi um verdadeiro artista do futebol, encantando o mundo com dribles, passes mágicos e alegria em campo. Ídolo do Barcelona e da seleção brasileira campeã da Copa do Mundo de 2002, venceu a Bola de Ouro em 2005. Sua habilidade de improvisar, criatividade e visão de jogo tornaram-no um dos jogadores mais carismáticos e influentes da história, inspirando gerações com sua combinação de talento natural e espetáculo dentro de campo.'),
('Fabio Cannavaro', 6, 2, 1.76, '/img/jogadores/fabio_cannavaro.jpg', 'Fabio Cannavaro (n. 1973) é um dos maiores zagueiros da história do futebol italiano e mundial. Ídolo de Parma, Inter de Milão e Real Madrid, foi capitão da seleção italiana campeã da Copa do Mundo de 2006, vencendo a Bola de Ouro no mesmo ano – um feito raro para defensores. Cannavaro era famoso por posicionamento impecável, leitura de jogo, velocidade e liderança em campo. Sua habilidade em antecipar jogadas e organizar a defesa fez dele referência para defensores modernos, combinando inteligência tática e disciplina com firmeza física.'),
('Kaká', 5, 5, 1.86, '/img/jogadores/kaka.jpg', 'Kaká (n. 1982) foi um meio-campista brasileiro elegante e decisivo, ídolo do Milan e campeão da Liga dos Campeões. Vencedor da Bola de Ouro em 2007, destacava-se por velocidade, técnica, visão de jogo e capacidade de finalizar com precisão. Kaká combinava equilíbrio entre ataque e defesa, inteligência tática e liderança, sendo referência para o estilo moderno de meio-campista ofensivo e deixando um legado de elegância e eficiência no futebol.'),
('Cristiano Ronaldo', 2, 6, 1.87, '/img/jogadores/cristiano_ronaldo.jpg', 'Cristiano Ronaldo (n. 1985) é um dos maiores atacantes da história, ídolo de Manchester United, Real Madrid, Juventus e seleção portuguesa. Multicampeão da Bola de Ouro, Ronaldo é conhecido por força física, velocidade, precisão nos chutes e incrível capacidade aérea. Com centenas de gols e inúmeros títulos nacionais e internacionais, incluindo a Euro 2016 e a Liga dos Campeões, Ronaldo é referência de profissionalismo, longevidade e determinação, inspirando atletas em todo o mundo com sua ética de trabalho, preparo físico e habilidade de decidir jogos decisivos mesmo sob extrema pressão.'),
('Lionel Messi', 1, 6, 1.70, '/img/jogadores/lionel_messi.jpg', 'Lionel Messi (n. 1987) é considerado um dos maiores jogadores da história do futebol, ídolo de Barcelona e PSG. Multicampeão da Bola de Ouro, Messi combina dribles inigualáveis, visão de jogo, inteligência tática e faro de gol extraordinário. Com centenas de gols e assistências, quebras de recordes e conquistas nacionais e internacionais, Messi revolucionou o conceito de atacante e meia avançado, sendo admirado por consistência, criatividade e genialidade técnica incomparável.'),
('Luka Modric', 3, 5, 1.72, '/img/jogadores/luka_modric.jpg', 'Luka Modrić (n. 1985) é um meio-campista croata reconhecido por visão de jogo, passes precisos e controle total do ritmo da partida. Ídolo do Real Madrid e líder da seleção croata vice-campeã da Copa do Mundo de 2018, Modrić venceu a Bola de Ouro em 2018. Destaca-se pela capacidade de conduzir o jogo, infiltrar-se na defesa adversária e auxiliar tanto na defesa quanto no ataque, sendo um exemplo de equilíbrio tático, resistência e inteligência estratégica no meio-campo moderno.'),
('Karim Benzema', 4, 6, 1.85, '/img/jogadores/karim_benzema.jpg', 'Karim Benzema (n. 1987) é um atacante francês, ídolo do Real Madrid e peça-chave nas conquistas recentes do clube, incluindo várias Ligas dos Campeões. Reconhecido por finalização precisa, visão de jogo e capacidade de atuar tanto de pivô quanto de artilheiro, Benzema combina técnica refinada e inteligência tática. Vencedor da Bola de Ouro em 2022, Benzema é admirado por sua consistência, criatividade e habilidade de decidir grandes jogos, sendo um dos atacantes mais completos da atualidade.'),
('Rodri', 9, 4, 1.91, '/img/jogadores/rodri.jpg', 'Rodri (n. 1996) é um meio-campista espanhol do Manchester City, referência no futebol moderno por sua capacidade de proteger a defesa e iniciar ataques. Com excelente visão de jogo, precisão nos passes e inteligência tática, Rodri combina controle de ritmo, interceptações e presença física. Ele é peça-chave na estratégia de Pep Guardiola, sendo um exemplo contemporâneo de meio-campista defensivo que equilibra defesa e construção ofensiva com eficiência e consistência.'),
('Ousmane Dembélé', 4, 6, 1.78, '/img/jogadores/ousmane_dembele.jpg', 'usmane Dembélé (n. 1997) é um extremo francês do Barcelona, conhecido por velocidade explosiva, dribles desconcertantes e versatilidade ofensiva. Capaz de atuar pelos dois lados do campo, Dembélé combina habilidade individual e criatividade para quebrar defesas adversárias. Embora sua carreira tenha sido marcada por lesões, ele é admirado pelo talento puro, capacidade de decidir partidas em momentos cruciais e potencial de ser um dos grandes extremos da sua geração quando plenamente saudável.');

INSERT INTO Premio (Nome, Ano, JogadorId) VALUES
('Ballon dOr', 1956, 1),   -- Stanley Matthews (Inglaterra)
('Prêmio Tributo FWA', 1995, 1),
('Futebolista Inglês do Ano pela FWA', 1947, 1),
('Futebolista Inglês do Ano pela FWA', 1948, 1),
('Football League 100 Legends', 1948, 1),
('Hall da Fama do Futebol Inglês', 1948, 1),

('Ballon dOr', 1957, 2),   -- Alfredo Di Stéfano (Argentina)
('Ballon dOr', 1959, 2),
('Pichichi', 1953, 2),
('Pichichi', 1954, 2),
('Pichichi', 1955, 2),
('Pichichi', 1956, 2),
('Pichichi', 1957, 2),
('Pichichi', 1958, 2),
('Pichichi', 1959, 2),


('Ballon dOr', 1958, 3),   -- Raymond Kopa (França)
('Ballon dOr', 1960, 4),   -- Luis Suárez (Espanha)
('Ballon dOr', 1961, 5),   -- Omar Sivori (Argentina)
('Artilheiro do Campeonato Italiano', 1960, 5),

('Ballon dOr', 1962, 6),   -- Josef Masopust (Tchéquia)
('Goleiro do Ano da URSS', 1960, 7),   -- Lev Yashin (Rússia)
('Goleiro do Ano da URSS', 1963, 7),
('Goleiro do Ano da URSS', 1966, 7),
('Seleção da Copa do Mundo FIFA (All-Star Team FIFA)', 1966, 7),
('Ordem de Lenin', 1967, 7),
('Ordem Olímpica de Prata', 1986, 7),
('Ordem de Mérito da FIFA', 1988, 7),
('Seleção de Todos os Tempos da Copa do Mundo FIFA', NULL, 7),
('Seleção de Futebol do Século XX', NULL, 7),
('Time dos Sonhos da Copa do Mundo FIFA', NULL, 7),
('Prêmios do Jubileu da UEFA', NULL, 7),
('Seleção de Todos os Tempos da World Soccer', NULL, 7),
('Bola de Ouro Dream Team: Melhor goleiro da História', NULL, 7),
('Ordem de Mérito da FIFA', 1988, 7),
('Ordem de Mérito da FIFA', 1988, 7),

('Ballon dOr', 1964, 8),   -- Denis Law (Escócia)
('Artilheiro da Liga dos Campeões da UEFA', 1968, 8),

('Ballon dOr', 1965, 9),   -- Eusébio (Portugal)
('Bota de Ouro', 1968, 9),
('Bota de Ouro', 1973, 9),
('Bola de Prata', 1964, 9),
('Bola de Prata', 1965, 9),
('Bola de Prata', 1966, 9),
('Bola de Prata', 1967, 9),
('Bola de Prata', 1968, 9),
('Bola de Prata', 1970, 9),
('Bola de Prata', 1973, 9),
('Maior marcador da Taça dos Clubes Campeões Europeus', 1965, 9),
('Maior marcador da Taça dos Clubes Campeões Europeus', 1966, 9),
('Maior marcador da Taça dos Clubes Campeões Europeus', 1968, 9),
('Bota de Ouro do Campeonato do Mundo', 1966, 9),
('Bola de Bronze do Campeonato do Mundo', 1966, 9),
('All-Star Team do Campeonato do Mundo', 1966, 9),
('Futebolista Português do Ano', 1970, 9),
('Futebolista Português do Ano', 1973, 9),
('Ballon dOr', 1966, 10),  -- Bobby Charlton (Inglaterra)
('FIFA 100', 2004, 10),
('Bola de Ouro da Copa do Mundo da FIFA', 1966, 10),
('All-Star Team da Copa do Mundo da FIFA', 1966, 10),
('All-Star Team da Copa do Mundo da FIFA', 1970, 10),

('Ballon dOr', 1967, 11),  -- Flórián Albert (Hungria)
('Melhor Jogador Jovem da Copa do Mundo FIFA', 1962, 11),
('Equipe da Eurocopa', 1964, 11),
('Futebolista Húngaro do Ano', 1966, 11),
('Futebolista Húngaro do Ano', 1967, 11),

('Ballon dOr', 1968, 12),  -- George Best (Inglaterra)
('Ballon dOr', 1969, 13),  -- Gianni Rivera (Itália)
('Ballon dOr', 1970, 14),  -- Gerd Müller (Alemanha)
('Futebolista Alemão do Ano', 1967, 14),
('Futebolista Alemão do Ano', 1969, 14),
('Chuteira de Ouro da UEFA', 1970, 14),
('Chuteira de Ouro da UEFA', 1972, 14),
('Equipe das Estrelas da Copa do Mundo FIFA', 1970, 14),
('Equipe da Eurocopa', 1972, 14),
('Ordem de Mérito da FIFA', NULL, 14),
('FIFA 100', 2004, 14),

('Ballon dOr', 1971, 15),  -- Johan Cruijff (Países Baixos)
('Desportista Neerlandês do Ano', 1973, 15),
('Desportista Neerlandês do Ano', 1974, 15),
('Time das Estrelas da Copa do Mundo FIFA', 1974, 15),
('Bola de ouro da Copa do Mundo', 1974, 15),
('Don Balón Melhor Jogador Estrangeiro', 1977, 15),
('Don Balón Melhor Jogador Estrangeiro', 1978, 15),
('Don Balón Melhor Treinador', 1991, 15),
('Don Balón Melhor Treinador', 1992, 15),
('MVP da North American Soccer League', 1979, 15),
('Futebolista Neerlandês do Ano', 1968, 15),
('Futebolista Neerlandês do Ano', 1972, 15),
('Futebolista Neerlandês do Ano', 1984, 15),
('Treinador do Ano da World Soccer', 1987, 15),
('Seleção de Todos os Tempos da Copa do Mundo FIFA', 1994, 15),
('Time dos Sonhos da Copa do Mundo FIFA', 2002, 15),
('Seleção de Futebol do Século XX', NULL, 15),
('FIFA 100', NULL, 15),
('Seleção de Todos os Tempos da World Soccer', 2013, 15),

('Ballon dOr', 1972, 16),  -- Franz Beckenbauer (Alemanha)
('Futebolista Alemão do Ano', 1966, 16),
('Futebolista Alemão do Ano', 1968, 16),
('Futebolista Alemão do Ano', 1974, 16),
('Futebolista Alemão do Ano', 1976, 16),
('Seleção da Bundesliga', 1966, 16),
('Seleção da Bundesliga', 1967, 16),
('Seleção da Bundesliga', 1968, 16),
('Seleção da Bundesliga', 1969, 16),
('Seleção da Bundesliga', 1970, 16),
('Seleção da Bundesliga', 1971, 16),
('Seleção da Bundesliga', 1972, 16),
('Seleção da Bundesliga', 1973, 16),
('Seleção da Bundesliga', 1974, 16),
('Seleção da Bundesliga', 1975, 16),
('Seleção da Bundesliga', 1976, 16),
('Seleção da Bundesliga', 1977, 16),
('Melhor jogador jovem da Copa do Mundo FIFA', 1966, 16),
('Bola de Bronze da Copa do Mundo FIFA', 1966, 16),
('Bola de Prata da Copa do Mundo FIFA', 1974, 16),
('Equipe das estrelas da Copa do Mundo FIFA', 1966, 16),
('Equipe das estrelas da Copa do Mundo FIFA', 1970, 16),
('Equipe das estrelas da Copa do Mundo FIFA', 1974, 16),
('FIFA XI', 1968, 16),
('Equipe das Estrelas da Eurocopa', 1972, 16),
('Equipe das Estrelas da Eurocopa', 1976, 16),
('Melhor jogador da North American Soccer League', 1977, 16),
('Ordem de Mérito da FIFA', 1984, 16),
('Seleção de Todos os Tempos da Copa do Mundo FIFA', NULL, 16),
('Seleção de Futebol do Século XX', NULL, 16),
('FIFA 100', 2004, 16),

('Ballon dOr', 1973, 15),  -- Johan Cruijff (Países Baixos)
('Ballon dOr', 1974, 15),  -- Johan Cruijff (Países Baixos)
('Ballon dOr', 1975, 17),  -- Oleg Blokhin (Ucrânia)
('Mérito Mestre do Esporte da URSS', 1975, 17),
('Mérito Treinador da Ucrânia', 2005, 17),
('Futebolista Soviético do Ano', 1973, 17),
('Futebolista Soviético do Ano', 1974, 17),
('Futebolista Soviético do Ano', 1975, 17),
('Futebolista Ucraniano do Ano', 1972, 17),
('Futebolista Ucraniano do Ano', 1973, 17),
('Futebolista Ucraniano do Ano', 1974, 17),
('Futebolista Ucraniano do Ano', 1975, 17),
('Futebolista Ucraniano do Ano', 1976, 17),
('Futebolista Ucraniano do Ano', 1977, 17),
('Futebolista Ucraniano do Ano', 1978, 17),
('Futebolista Ucraniano do Ano', 1980, 17),
('Futebolista Ucraniano do Ano', 1981, 17),
('Prêmio do Jubileu da UEFA', 2004, 17),

('Ballon dOr', 1976, 16),  -- Franz Beckenbauer (Alemanha)
('Ballon dOr', 1977, 18),  -- Allan Simonsen (Dinamarca)
('Onze de Bronze', 1977, 18),
('Seleção da Bundesliga (revista kicker)', 1975, 18),
('Seleção da Bundesliga (revista kicker)', 1976, 18),
('Seleção da Bundesliga (revista kicker)', 1977, 18),
('COI Eurorpean Footballer da temporada', 1977, 18),
('Artilheiro da Taça dos Campeões Europeus', 1978, 18),
('Artilheiro da Taça UEFA', 1979, 18),
('Hall da Fama do Futebol Dinamarquês', NULL, 18),

('Ballon dOr', 1978, 19),  -- Kevin Keegan (Inglaterra)
('Ballon dOr', 1979, 19),  -- Kevin Keegan (Inglaterra)
('Hall da Fama do Futebol Inglês', 2002, 19),
('Futebolista Inglês do Ano pela FWA', 1976, 19),
('Futebolista Inglês do Ano pela PFA', 1982, 19),
('FIFA 100', NULL, 19),
('Onze d\Argent', 1976, 19),
('Onze d\Argent', 1980, 19),
('Onze d\Or', 1977, 19),
('Onze d\Or', 1979, 19),

('Ballon dOr', 1980, 20),  -- Karl-Heinz Rummenigge (Alemanha)
('Ballon dOr', 1981, 20),  -- Karl-Heinz Rummenigge (Alemanha)
('Futebolista Alemão do Ano', 1980, 20),
('Seleção da Eurocopa', 1980, 20),
('Onze d\Or', 1980, 20),
('Onze d\Or', 1981, 20),
('Onze de Bronze', 1983, 20),
('Bravo Otto', 1980, 20),
('Bravo Otto', 1981, 20),
('Bravo Otto', 1982, 20),
('Bravo Otto', 1983, 20),
('Bravo Otto', 1984, 20),
('Chuteira de Prata da Copa do Mundo FIFA', 1982, 20),
('Bola de Bronze da Copa do Mundo FIFA', 1982, 20),
('Equipe das Estrelas da Copa do Mundo FIFA', 1982, 20),
('Futebolista Suíço do Ano', 1989, 20),
('FIFA 100', NULL, 20),

('Ballon dOr', 1982, 21),  -- Paolo Rossi (Itália)
('Artilheiro do Campeonato Italiano - Série B', 1977, 21),
('Artilheiro do Campeonato Italiano', 1978, 21),
('Artilheiro da Copa dos Campeões da UEFA', 1983, 21),
('Artilheiro da Copa do Mundo FIFA', 1982, 21),
('Bola de Ouro da Copa do Mundo', 1982, 21),
('All Star Team', 1982, 21),
('Prêmio de Futebolista do Mundo "World Soccer"', 1982, 21),
('Onze d\Or', 1982, 21),
('FIFA 100', NULL, 21),

('Ballon dOr', 1983, 22),  -- Michel Platini (França)
('Ballon dOr', 1984, 22),  -- Michel Platini (França)
('Ballon dOr', 1985, 22),  -- Michel Platini (França)
('Onze d\Or', 1983, 22),
('Onze d\Or', 1984, 22),
('Onze d\Or', 1985, 22),
('Guerin d\Oro', 1984, 22),
('Melhor jogador do mundo pela World Soccer', 1984, 22),
('Melhor jogador do mundo pela World Soccer', 1985, 22),
('Jogador Francês do Ano', 1976, 22),
('Jogador Francês do Ano', 1977, 22),
('Melhor jogador da UEFA Euro', 1984, 22),
('Melhor jogador da final da Copa Europeia/Sul-Americana', 1985, 22),
('7º Melhor jogador do Século XX pela IFFHS', NULL, 22),
('15º Melhor jogador do Século XX (votos de internautas)', NULL, 22),
('6º Melhor jogador do Século XX pelo Grande Júri FIFA', NULL, 22),
('5º Melhor jogador europeu do Século XX pela IFFHS', NULL, 22),
('Melhor jogador francês do Século XX pela IFFHS', NULL, 22),
('5º Melhor jogador do Século XX pela World Soccer', NULL, 22),
('FIFA 100', NULL, 22),
('Seleção da Eurocopa', 1984, 22),
('Bola de Ouro Dream Team: Melhor Meio-campista Ofensivo da História — terceiro esquadrão', NULL, 22),
('Seleção de Futebol do Século XX', NULL, 22),

('Ballon dOr', 1986, 23),  -- Igor Belanov (Ucrânia)
('Chuteira de Bronze da Copa do Mundo FIFA', 1986, 23),
('Golden Foot', 2008, 23),

('Ballon dOr', 1987, 24),  -- Ruud Gullit (Países Baixos)
('Futebolista Neerlandês do Ano', 1984, 24),
('Futebolista Neerlandês do Ano', 1986, 24),
('Artilheiro da Copa dos Países Baixos', 1984, 24),
('Chuteira de Ouro dos Países Baixos', 1986, 24),
('Esportista Neerlandês do Ano', 1987, 24),
('Jogador Mundial do Ano pela Revista World Soccer', 1987, 24),
('Jogador Mundial do Ano pela Revista World Soccer', 1989, 24),
('Seleção da Eurocopa', 1988, 24),
('Seleção da Eurocopa', 1992, 24),
('Bola de Prata da Eurocopa', 1988, 24),
('Bola de Prata de Jogador do Ano no Futebol Inglês', 1996, 24),
('FIFA 100', 2004, 24),

('Ballon dOr', 1988, 25),  -- Marco van Basten (Países Baixos)
('Ballon dOr', 1989, 25),  -- Marco van Basten (Países Baixos)
('Chuteira de Prata da UEFA', 1984, 25),
('Jogador Neerlandês do Ano', 1985, 25),
('Chuteira de Ouro da UEFA', 1986, 25),
('Troféu Bravo', 1987, 25),
('Melhor jogador do mundo pela World Soccer', 1988, 25),
('Melhor jogador do mundo pela World Soccer', 1992, 25),
('Equipe do Torneio da Eurocopa', 1988, 25),
('Equipe do Torneio da Eurocopa', 1992, 25),
('Jogador do Ano da UEFA', 1989, 25),
('Jogador do Ano da UEFA', 1990, 25),
('Jogador do Ano da UEFA', 1992, 25),
('Jogador do Ano pela IFFHS', 1988, 25),
('Jogador do Ano pela IFFHS', 1989, 25),
('Jogador do Ano pela IFFHS', 1990, 25),
('Onze d\Or', 1988, 25),
('Onze d\Or', 1989, 25),
('Melhor Jogador do Mundo pela FIFA', 1992, 25),
('FIFA 100', 2004, 25),
('Equipe de Todos os Tempos da Eurocopa', NULL, 25),
('Bola de Ouro Dream Team: Melhor Centroavante da História - terceiro esquadrão', NULL, 25),


('Ballon dOr', 1990, 26),  -- Lothar Matthäus (Alemanha)
('Futebolista Alemão do Ano', 1990, 26),
('Futebolista Alemão do Ano', 1999, 26),
('All-Star Team da Copa do Mundo da FIFA', 1990, 26),
('Melhor Jogador do Mundo pela World Soccer', 1990, 26),
('Onze d\Or', 1990, 26),
('Melhor Jogador do Mundo pela FIFA', 1991, 26),
('Bola de Ouro Dream Team: Melhor Meio-Campista Defensivo da História', NULL, 26),
('FIFA 100', 2004, 26),

('Ballon dOr', 1991, 27),  -- Jean-Pierre Papin (França)
('Jogador Francês do Ano', 1988, 27),
('Jogador Francês do Ano', 1991, 27),
('Onze de Bronze', 1989, 27),
('Onze de Bronze', 1990, 27),
('Onze de Bronze', 1992, 27),
('Maior Artilheiro Internacional do Mundo pela IFFHS', 1991, 27),
('Onze d\Or', 1991, 27),
('Melhor Jogador do Mundo pela World Soccer', 1991, 27),
('2º Melhor Jogador do Mundo FIFA', 1991, 27),
('Melhor Marcador do Ano da IFFHS', 1995, 27),
('Objetivo do Ano (Alemanha)', 1991, 27),
('FIFA XI', 1997, 27),
('FIFA XI', 1998, 27),
('FIFA XI', 1999, 27),
('Prêmio Golden Foot', 2013, 27),
('8º Melhor Jogador Francês do Século pela France Football', NULL, 27),
('FIFA 100', 2004, 27),

('Ballon dOr', 1992, 25),  -- Marco van Basten (Países Baixos)
('Ballon dOr', 1993, 28),  -- Roberto Baggio (Itália)
('Melhor Jogador do Mundo pela FIFA', 1993, 28),
('Melhor Jogador da UEFA na Europa', 1990, 28),
('Melhor Jogador da UEFA na Europa', 1991, 28),
('Melhor Jogador da UEFA na Europa', 1993, 28),
('Melhor Jogador da UEFA na Europa', 1994, 28),
('Lendas do Futebol (IFFHS)', 2016, 28),

('Ballon dOr', 1994, 29),  -- Hristo Stoichkov (Bulgária)
('Futebolista Búlgaro do Ano', 1989, 29),
('Futebolista Búlgaro do Ano', 1990, 29),
('Futebolista Búlgaro do Ano', 1991, 29),
('Futebolista Búlgaro do Ano', 1992, 29),
('Futebolista Búlgaro do Ano', 1994, 29),
('Chuteira de Ouro da UEFA', 1990, 29),
('Onze d\Or', 1992, 29),
('Melhor Jogador do Mundo pela FIFA 2.º lugar', 1992, 29),
('Melhor Jogador do Mundo pela FIFA 2.º lugar', 1994, 29),
('Chuteira de Ouro da Copa do Mundo FIFA', 1994, 29),
('Bola de Bronze da Copa do Mundo FIFA', 1994, 29),
('Seleção da Copa do Mundo FIFA', 1994, 29),
('Onze d\Argent', 1994, 29),
('Maior Artilheiro Internacional do Mundo pela IFFHS', 1994, 29),
('Atleta Búlgaro do Ano', 1994, 29),
('Seleção da Eurocopa', 1996, 29),
('Prêmio do Jubileu da UEFA', 2004, 29),
('FIFA 100', 2004, 29),

('Ballon dOr', 1995, 30),  -- George Weah (Libéria)
('FIFA 100', 2004, 30),
('Melhor jogador do mundo pela FIFA', 1995, 30),
('Futebolista Africano do Ano pela BBC', 1995, 30),
('Onze d\Or', 1995, 30),
('Futebolista Africano do Ano', 1989, 30),
('Futebolista Africano do Ano', 1994, 30),
('Futebolista Africano do Ano', 1995, 30),
('FIFA Fair Play', 1996, 30),

('Ballon dOr', 1996, 31),  -- Mathias Sammer (Alemanha)
('Seleção da Bundesliga', 1991, 31),
('Seleção da Bundesliga', 1992, 31),
('Seleção da Bundesliga', 1995, 31),
('Seleção da Bundesliga', 1996, 31),
('Seleção do ano da European Sports Media', 1995, 31),
('Jogador Alemão do Ano', 1995, 31),
('Jogador Alemão do Ano', 1996, 31),
('Melhor Líbero do Ano da Bundesliga pela revista Kicker', 1995, 31),
('Melhor Líbero do Ano da Bundesliga pela revista Kicker', 1996, 31),
('Melhor Meio-Campista do Ano da Bundesliga pela revista Kicker', 1993, 31),
('Melhor Jogador da Eurocopa', 1996, 31),
('Seleção da Eurocopa', 1996, 31),
('3º Melhor Jogador da Europa pela Revista Onze Mondial (Onze de Bronze)', 1996, 31),

('Ballon dOr', 1997, 32),  -- Ronaldo (Brasil)
('Melhor jogador do mundo pela FIFA', 1996, 32),
('Melhor jogador do mundo pela FIFA', 1997, 32),
('Melhor jogador do mundo pela FIFA', 2002, 32),
('Melhor jogador do mundo pela revista World Soccer', 1996, 32),
('Melhor jogador do mundo pela revista World Soccer', 1997, 32),
('Melhor jogador do mundo pela revista World Soccer', 2002, 32),
('Onze d\Or', 1997, 32),
('Onze d\Or', 2002, 32),
('Chuteira de Ouro da UEFA', 1997, 32),
('Melhor jogador estrangeiro da La Liga', 1997, 32),
('Trofeo Bravo', 1997, 32),
('Trofeo Bravo', 1998, 32),
('Troféu Pichichi', 1997, 32),
('Troféu Pichichi', 2004, 32),
('Troféu EFE', 1997, 32),
('Troféu EFE', 2003, 32),
('Melhor jogador da Copa América', 1997, 32),
('Chuteira de Bronze da Copa das Confederações FIFA', 1997, 32),
('Artilheiro do ano - IFFHS', 1997, 32),
('Melhor jogador da Serie A', 1998, 32),
('Melhor jogador estrangeiro da Serie A', 1998, 32),
('Jogador do ano da UEFA', 1998, 32),
('Atacante do ano da UEFA', 1998, 32),
('Seleção do ano da European Sports Media', 1997, 32),
('Seleção do ano da European Sports Media', 1998, 32),
('Bola de Ouro da Copa do Mundo FIFA', 1998, 32),
('Bola de Prata da Copa do Mundo FIFA', 2002, 32),
('Chuteira de Ouro da Copa do Mundo FIFA', 2002, 32),
('Melhor Jogador da Copa Intercontinental', 2002, 32),
('Seleção do ano da UEFA', 2002, 32),
('FIFA 100', 2004, 32),
('Chuteira de Bronze da Copa do Mundo FIFA', 2006, 32),
('Prêmio Golden Foot', 2006, 32),
('Melhor jogador do Campeonato Paulista', 2009, 32),
('Brasileiro do Ano, pela revista IstoÉ', 2009, 32),
('Seleção da década de 2000 (Sports Illustrated)', NULL, 32),
('Quinto melhor jogador Sul-Americano da história (jornal L\Équipe)', NULL, 32),
('Hall da Fama do Futebol Italiano', 2015, 32),
('Bola de Ouro Dream Team: melhor centroavante da história', NULL, 32),


('Ballon dOr', 1998, 33),  -- Zinedine Zidane (França)
('Melhor jogador jovem da Ligue 1', 1994, 33),
('Melhor jogador da Ligue 1', 1996, 33),
('Melhor jogador estrangeiro da Serie A', 1997, 33),
('Melhor jogador estrangeiro da Serie A', 2001, 33),
('Seleção da Copa do Mundo FIFA', 1998, 33),
('Seleção da Copa do Mundo FIFA', 2006, 33),
('Melhor meia da UEFA', 1998, 33),
('Jogador Francês do Ano', 1998, 33),
('Jogador Francês do Ano', 2002, 33),
('Campeão dos Campeões (L\Équipe)', 1998, 33),
('Onze de Ouro', 1998, 33),
('Onze de Ouro', 2000, 33),
('Onze de Ouro', 2001, 33),
('Melhor Jogador do Mundo pela FIFA', 1998, 33),
('Melhor Jogador do Mundo pela FIFA', 2000, 33),
('Melhor Jogador do Mundo pela FIFA', 2003, 33),
('Melhor jogador do mundo pela World Soccer', 1998, 33),
('Onze ideal da ESM', 1998, 33),
('Onze ideal da ESM', 2002, 33),
('Onze ideal da ESM', 2003, 33),
('Onze ideal da ESM', 2004, 33),
('100 Craques do Século World Soccer', 1999, 33),
('Melhor jogador da Eurocopa', 2000, 33),
('Seleção da Eurocopa', 2000, 33),
('Seleção da Eurocopa', 2004, 33),
('Melhor jogador da Serie A', 2001, 33),
('Seleção da UEFA', 2001, 33),
('Seleção da UEFA', 2002, 33),
('Seleção da UEFA', 2003, 33),
('Jogador Europeu do Ano', 2002, 33),
('Melhor jogador estrangeiro da La Liga', 2002, 33),
('Time dos Sonhos da Copa do Mundo FIFA', 2002, 33),
('UEFA Golden Jubilee Poll (melhor jogador europeu dos últimos cinquenta anos)', 2004, 33),
('FIFA 100', 2004, 33),
('FIFPro World XI', 2005, 33),
('FIFPro World XI', 2006, 33),
('Melhor construtor de jogo do Mundo da IFFHS', 2006, 33),
('Melhor jogador da Copa do Mundo FIFA', 2006, 33),
('Troféu de honra da UNFP', 2007, 33),
('Marca Leyenda', 2008, 33),
('Prêmio Golden Foot (Lenda do Futebol)', 2008, 33),
('Melhor jogador da década pela revista ESPN', 2009, 33),
('Melhor jogador da década pelo jornal Marca', 2009, 33),
('Jogador da década da Fox Sports', 2009, 33),
('Equipe da década pela revista The Sun', 2009, 33),
('Equipe da década pelo Goal.com', 2009, 33),
('Seleção da UEFA da década', 2009, 33),
('Melhor jogador da década pela revista Sports Illustrated', 2009, 33),
('Equipe da década pela revista Sports Illustrated', 2009, 33),
('Equipe da década pela revista Don Balón', 2010, 33),
('Jogador da década da revista Don Balón', 2010, 33),
('Melhor jogador dos últimos 20 anos da Liga dos Campeões da UEFA', 2011, 33),
('Prêmio Laureus do Esporte Mundial, prêmio pela carreira', 2011, 33),
('Seleção de todos os tempos da World Soccer', 2013, 33),
('Goal Hall of Fame', 2014, 33),
('Melhor jogador da história do Campeonato Francês', 2014, 33),
('Melhor jogador da história do futebol francês', 2016, 33),
('Time dos sonhos da Eurocopa', 2016, 33),
('Bola de Ouro Dream Team: Segundo Esquadrão', NULL, 33),

('Ballon dOr', 1999, 34),  -- Rivaldo (Brasil)
('Bola de Prata da revista Placar', 1993, 34),
('Bola de Prata da revista Placar', 1994, 34),
('Melhor Jogador Campeonato Paulista', 1996, 34),
('Prêmio Don Balón (melhor jogador estrangeiro da La Liga)', 1998, 34),
('Seleção da Copa do Mundo FIFA', 1998, 34),
('Seleção da Copa do Mundo FIFA', 2002, 34),
('Sexto Melhor Jogador do Mundo pela FIFA', 1998, 34),
('Melhor jogador da Copa América', 1999, 34),
('Melhor Jogador do Mundo pela World Soccer', 1999, 34),
('Onze d\Or', 1999, 34),
('Melhor Jogador do Mundo pela FIFA', 1999, 34),
('Equipe da Temporada pela ESM', 1999, 34),
('Equipe da Temporada pela ESM', 2000, 34),
('Maior Artilheiro Internacional do Mundo pela IFFHS', 2000, 34),
('Terceiro Melhor Jogador do Mundo pela FIFA', 2000, 34),
('Quinto Melhor Jogador do Mundo pela FIFA', 2001, 34),
('Quinto Melhor Jogador do Mundo pela FIFA', 2002, 34),
('FIFA 100', 2004, 34),
('Melhor jogador da Super Liga Grega (Campeonato Grego)', 2005, 34),
('Melhor jogador da Super Liga Grega (Campeonato Grego)', 2006, 34),
('Melhor jogador da Super Liga Grega (Campeonato Grego)', 2007, 34),
('Melhor jogador estrangeiro da Super Liga Grega (Campeonato Grego)', 2005, 34),
('Melhor jogador estrangeiro da Super Liga Grega (Campeonato Grego)', 2006, 34),
('Melhor jogador estrangeiro da Super Liga Grega (Campeonato Grego)', 2007, 34),
('Melhor jogador estrangeiro do Campeonato Angolano', 2012, 34),

('Ballon dOr', 2000, 35),  -- Luís Figo (Portugal)
('Melhor jogador do mundo pela FIFA', 2001, 35),
('Melhor Jogador do Mundo pela World Soccer', 2000, 35),
('All-Star Team (FIFA)', 2006, 35),
('Equipe Ideal do Futebol Europeu', 2000, 35),
('Equipe Ideal do Futebol Europeu', 2004, 35),
('FIFA 100', NULL, 35),
('Equipa do ano da UEFA', 2003, 35),
('Jogador português do ano', 1995, 35),
('Jogador português do ano', 1996, 35),
('Jogador português do ano', 1997, 35),
('Jogador português do ano', 1998, 35),
('Jogador português do ano', 1999, 35),
('Jogador português do ano', 2000, 35),
('Prêmio Don Balón', 1999, 35),
('Prêmio Don Balón', 2000, 35),
('Prêmio Don Balón', 2001, 35),
('Bola de Ouro Portuguesa', 1994, 35),
('Equipe do Ano do MEE', 1998, 35),
('Equipe do Ano do MEE', 2000, 35),

('Ballon dOr', 2001, 36),  -- Michael Owen (Inglaterra)
('FIFA 100', NULL, 36),
('Melhor Jogador do Mundo pela World Soccer', 2001, 36),
('Melhor Jogador Jovem da Copa do Mundo FIFA', 1998, 36),
('Homem do jogo da Supercopa da UEFA', 2001, 36),
('Jogador jovem do ano da PFA', 1998, 36),
('Personalidade do ano pela BBC Sports', 1998, 36),
('Equipe da década da Premier League', 2002, 36),
('Melhor jogador inglês do ano', 1999, 36),
('Hall da Fama do Futebol Inglês', 2014, 36),
('Prêmio Golden Foot (Lenda do Futebol)', 2017, 36),

('Ballon dOr', 2002, 32),  -- Ronaldo (Brasil)
('Ballon dOr', 2003, 37),  -- Pavel Nedved (Tchéquia)
('Melhor jogador Tcheco do ano', 1998, 37),
('Melhor jogador Tcheco do ano', 2000, 37),
('Melhor jogador Tcheco do ano', 2001, 37),
('Melhor jogador Tcheco do ano', 2003, 37),
('Melhor jogador Tcheco do ano', 2004, 37),
('Melhor jogador Tcheco do ano', 2008, 37),
('Melhor meio-campista da Liga dos Campeões da UEFA', 2003, 37),
('Jogador do Ano da Serie A', 2003, 37),
('Jogador Estrangeiro do Ano da Serie A', 2003, 37),
('Guerin d\Oro', 2003, 37),
('Equipe do Ano da UEFA', 2003, 37),
('Equipe do Ano da UEFA', 2004, 37),
('Equipe do Ano da UEFA', 2005, 37),
('Melhor Jogador do Mundo pela World Soccer', 2003, 37),
('FIFA 100', 2004, 37),

('Ballon dOr', 2004, 38),  -- Andriy Shevchenko (Ucrânia)
('Futebolista Ucraniano do Ano', 1997, 38),
('Futebolista Ucraniano do Ano', 1999, 38),
('Futebolista Ucraniano do Ano', 2000, 38),
('Futebolista Ucraniano do Ano', 2001, 38),
('Futebolista Ucraniano do Ano', 2004, 38),
('Futebolista Ucraniano do Ano', 2005, 38),
('Melhor Jogador da Liga dos Campeões da UEFA', 1999, 38),
('Oscar del Calcio', 2000, 38),
('Homem do jogo da Supercopa da UEFA', 2003, 38),
('FIFPro World XI', 2005, 38),
('FIFA 100', 2004, 38),

('Ballon dOr', 2005, 39),  -- Ronaldinho Gaúcho (Brasil)
('Revelação do ano no Campeonato Gaúcho', 1999, 39),
('Bola de Ouro da Copa das Confederações', 1999, 39),
('Chuteira de Ouro da Copa das Confederações', 1999, 39),
('Melhor Jogador do Mundo pela FIFA', 2004, 39),
('Melhor Jogador do Mundo pela FIFA', 2005, 39),
('Melhor Jogador do Mundo pela World Soccer', 2004, 39),
('Melhor Jogador do Mundo pela World Soccer', 2005, 39),
('Melhor Jogador do Mundo pela FIFPro', 2005, 39),
('Melhor Jogador do Mundo pela FIFPro', 2006, 39),
('Melhor Jogador Estrangeiro da La Liga', 2004, 39),
('Melhor Jogador Estrangeiro da La Liga', 2006, 39),
('Troféu EFE', 2004, 39),
('Atacante do Ano da UEFA', 2005, 39),
('Onze d\Or', 2005, 39),
('Melhor Jogador de Clubes da UEFA', 2006, 39),
('Bola de Bronze da Copa das Confederações', 2005, 39),
('Bola de Bronze da Copa do Mundo de Clubes', 2006, 39),
('Jogador da Década da Revista World Soccer', 2009, 39),
('Prêmio Golden Foot', 2009, 39),
('Seleção da década — 2000 (Sports Illustrated)', NULL, 39),
('Melhor atacante — Campeonato Carioca', 2011, 39),
('Craque da Galera do Brasileiro', 2012, 39),
('Craque do Ano Troféu Telê Santana', 2012, 39),
('Melhor Meia — Troféu Guará', 2012, 39),
('Craque do Ano — Troféu Guara', 2012, 39),
('Bola de Ouro da Revista Placar', 2012, 39),
('Melhor jogador Campeonato Mineiro', 2013, 39),
('Futebolista Sul-Americano do Ano', 2013, 39),
('Melhor jogador da Copa Libertadores de futebol', 2013, 39),
('Décimo melhor jogador da História do Campeonato Francês', NULL, 39),
('Prêmio de Trajetória Esportiva (Mundo Deportivo)', 2016, 39),
('Seleção de Todos os Tempos do Brasil (IFFHS)', 2021, 39),

('Ballon dOr', 2006, 40),  -- Fabio Cannavaro (Itália)
('Seleção da Eurocopa', 2000, 40),
('Bola de Prata da Copa do Mundo FIFA', 2006, 40),
('Seleção da Copa do Mundo FIFA', 2006, 40),
('Futebolista do Ano da Serie A', 2006, 40),
('Futebolista Italiano do Ano da Serie A', 2006, 40),
('Defensor do Ano da Serie A', 2006, 40),
('Equipe do Ano da UEFA', 2006, 40),
('Jogador do Ano da FIFA', 2006, 40),
('Seleção da década de 2000 (Sports Illustrated)', NULL, 40),
('IFFHS ALL TIME DREAM TEAMS ITALY (Time B)', NULL, 40),

('Ballon dOr', 2007, 41),  -- Kaká (Brasil)
('FIFPro World XI', 2006, 41),
('FIFPro World XI', 2007, 41),
('FIFPro World XI', 2008, 41),
('FIFPro World XI', 2009, 41),
('Seleção da FIFA', 2006, 41),
('Seleção da FIFA', 2007, 41),
('Seleção da FIFA', 2008, 41),
('Seleção da FIFA', 2009, 41),
('Melhor jogador do mundo pela FIFA', 2007, 41),
('Bola de Ouro da Copa das Confederações FIFA', 2009, 41),
('Time Ideal da Copa das Confederações FIFA', 2009, 41),
('Bola de Ouro da Copa do Mundo de Clubes da FIFA', 2007, 41),
('Melhor jogador da final da Copa do Mundo de Clubes da FIFA', 2007, 41),
('Melhor construtor de jogo do Mundo da IFFHS', 2007, 41),
('Jogador com mais assistências na Copa do Mundo da FIFA', 2010, 41),
('Melhor Atacante da UEFA', 2007, 41),
('Jogador do Ano pela UEFA', 2007, 41),
('Melhor Meia da UEFA', 2005, 41),
('Seleção da UEFA', 2006, 41),
('Seleção da UEFA', 2007, 41),
('Seleção da UEFA', 2009, 41),
('Time ideal da Europa (L\Équipe)', 2005, 41),
('Time ideal da Europa (L\Équipe)', 2007, 41),
('Time Ideal da América (El País)', 2002, 41),
('Jogador com mais assistências na Liga dos Campeões', 2012, 41),
('Troféu Samba de Ouro', 2008, 41),
('Oscar del Calcio - Melhor jogador estrangeiro', 2004, 41),
('Oscar del Calcio - Melhor jogador estrangeiro', 2006, 41),
('Oscar del Calcio - Melhor jogador estrangeiro', 2007, 41),
('Oscar del Calcio - Melhor jogador', 2004, 41),
('Oscar del Calcio - Melhor jogador', 2007, 41),
('Bola de Prata Italiana', 2007, 41),
('Bola de Ouro da revista Placar', 2002, 41),
('Bola de Prata da Revista Placar', 2002, 41),
('Esportista Latino do Ano pela IAAF', 2007, 41),
('Time Ideal da Copa Ouro CONCACAF', 2003, 41),

('Ballon dOr', 2008, 42),  -- Cristiano Ronaldo (Portugal)
-- The Best FIFA Men's Player
('The Best FIFA Men\s Player – Real Madrid CF', 2016, 42),
('The Best FIFA Men\s Player – Real Madrid CF', 2017, 42),
('The Best FIFA Men\s Player – Juventus FC', 2020, 42),

-- Melhor Jogador da UEFA na Europa
('Melhor Jogador da UEFA na Europa – Real Madrid CF', 2014, 42),
('Melhor Jogador da UEFA na Europa – Real Madrid CF', 2016, 42),
('Melhor Jogador da UEFA na Europa – Real Madrid CF', 2017, 42),

-- Chuteira de Ouro da UEFA
('Chuteira de Ouro da UEFA – Manchester United FC', 2008, 42),
('Chuteira de Ouro da UEFA – Real Madrid CF', 2011, 42),
('Chuteira de Ouro da UEFA – Real Madrid CF', 2014, 42),
('Chuteira de Ouro da UEFA – Real Madrid CF', 2015, 42),

-- Melhor Jogador de Clubes da UEFA
('Melhor Jogador de Clubes da UEFA – Manchester United FC', 2008, 42),

-- Prêmio FIFA Puskás
('Prêmio FIFA Puskás – Real Madrid CF', 2009, 42),

-- Melhor jogador do mundo pela FIFPro
('Melhor Jogador do Mundo pela FIFPro – Manchester United FC', 2008, 42),
('Melhor Jogador do Mundo pela FIFPro – Real Madrid CF', 2013, 42),
('Melhor Jogador do Mundo pela FIFPro – Real Madrid CF', 2014, 42),
('Melhor Jogador do Mundo pela FIFPro – Real Madrid CF', 2016, 42),
('Melhor Jogador do Mundo pela FIFPro – Real Madrid CF', 2017, 42),

-- Melhor jogador do mundo pela revista World Soccer
('Melhor jogador do mundo pela revista World Soccer – Manchester United FC', 2008, 42),
('Melhor jogador do mundo pela revista World Soccer – Real Madrid CF', 2013, 42),
('Melhor jogador do mundo pela revista World Soccer – Real Madrid CF', 2014, 42),
('Melhor jogador do mundo pela revista World Soccer – Real Madrid CF', 2016, 42),
('Melhor jogador do mundo pela revista World Soccer – Real Madrid CF', 2017, 42),

-- O melhor jogador da Europa
('O melhor jogador da Europa – Manchester United FC', 2008, 42),
('O melhor jogador da Europa – Real Madrid CF', 2014, 42),
('O melhor jogador da Europa – Real Madrid CF', 2016, 42),
('O melhor jogador da Europa – Real Madrid CF', 2017, 42),

-- Melhor jogador do mundo
('Melhor jogador do mundo – Manchester United FC', 2008, 42),
('Melhor jogador do mundo – Real Madrid CF', 2016, 42),
('Melhor jogador do mundo – Real Madrid CF', 2017, 42),

-- Futebolista do ano
('Futebolista do ano – Manchester United FC', 2007, 42),
('Futebolista do ano – Manchester United FC', 2008, 42),
('Futebolista do ano – Portugal', 2009, 42),
('Futebolista do ano – Real Madrid CF', 2011, 42),
('Futebolista do ano – Real Madrid CF', 2012, 42),
('Futebolista do ano – Real Madrid CF', 2013, 42),
('Futebolista do ano – Real Madrid CF', 2015, 42),
('Futebolista do ano – Real Madrid CF', 2016, 42),
('Futebolista do ano – Real Madrid CF', 2017, 42),
('Futebolista do ano – Juventus FC', 2018, 42),
('Futebolista do ano – Juventus FC', 2019, 42),
('Futebolista do ano – Juventus FC', 2020, 42),

-- Jogador da época
('Jogador da época – Premier League', 2007, 42),
('Jogador da época – Premier League', 2006, 42),
('Jogador da época – Liga dos Campeões', 2007, 42),
('Jogador da época – LaLiga', 2013, 42),
('Jogador da época – LaLiga', 2012, 42),
('Jogador da época – Serie A', 2018, 42),
('Jogador da época – Serie A', 2019, 42),
('Jogador da época – Serie A', 2020, 42),
('Jogador da época – Saudi Pro League', 2023, 42),

-- Artilheiro
('Artilheiro – Copa da Inglaterra', 2005, 42),
('Artilheiro – Premier League', 2007, 42),
('Artilheiro – Liga dos Campeões', 2007, 42),
('Artilheiro – LaLiga', 2010, 42),
('Artilheiro – Copa do Rei', 2010, 42),
('Artilheiro – Eurocopa 2012', 2011, 42),
('Artilheiro – Liga dos Campeões', 2012, 42),
('Artilheiro – LaLiga', 2013, 42),
('Artilheiro – Liga dos Campeões', 2013, 42),
('Artilheiro – LaLiga', 2014, 42),
('Artilheiro – Liga dos Campeões', 2014, 42),
('Artilheiro – LaLiga', 2015, 42),
('Artilheiro – Liga dos Campeões', 2015, 42),
('Artilheiro – Mundial de Clubes', 2016, 42),
('Artilheiro – Liga dos Campeões', 2016, 42),
('Artilheiro – Mundial de Clubes', 2017, 42),
('Artilheiro – Liga dos Campeões', 2017, 42),
('Artilheiro – UEFA Nations League Finals', 2018, 42),
('Artilheiro – Serie A', 2018, 42),
('Artilheiro – Serie A', 2019, 42),
('Artilheiro – Campeonato Europeu de Futebol', 2020, 42),
('Artilheiro – Saudi Pro League', 2023, 42),
('Artilheiro – Saudi Pro League', 2024, 42),
('Artilheiro – UEFA Liga das Nações A', 2024, 42),

-- Futebolista do Ano (Transfermarkt.de escolha do utilizador)
('Futebolista do Ano (Transfermarkt.de escolha do utilizador) – Espanha', 2017, 42),
('Futebolista do Ano (Transfermarkt.de escolha do utilizador) – Itália', 2019, 42),
('Futebolista do Ano (Transfermarkt.de escolha do utilizador) – Arábia Saudita', 2024, 42),
('Futebolista do Ano (Transfermarkt.de escolha do utilizador) – Arábia Saudita', 2025, 42),


('Ballon dOr', 2009, 43),  -- Lionel Messi (Argentina)
-- Melhor jogador do mundo
('Melhor jogador do mundo – FC Barcelona', 2009, 43),
('Melhor jogador do mundo – FC Barcelona', 2019, 43),
('Melhor jogador do mundo – FC Paris Saint-Germain', 2022, 43),
('Melhor jogador do mundo – Inter Miami CF', 2023, 43),

-- O melhor jogador da Europa
('O melhor jogador da Europa – FC Barcelona', 2009, 43),
('O melhor jogador da Europa – FC Barcelona', 2011, 43),
('O melhor jogador da Europa – FC Barcelona', 2015, 43),

-- Vencedor da Bota de Ouro (Europe)
('Vencedor da Bota de Ouro (Europe) – FC Barcelona', 2009, 43),
('Vencedor da Bota de Ouro (Europe) – FC Barcelona', 2011, 43),
('Vencedor da Bota de Ouro (Europe) – FC Barcelona', 2012, 43),
('Vencedor da Bota de Ouro (Europe) – FC Barcelona', 2013, 43),
('Vencedor da Bota de Ouro (Europe) – FC Barcelona', 2016, 43),
('Vencedor da Bota de Ouro (Europe) – FC Barcelona', 2017, 43),

-- Futebolista do ano
('Futebolista do ano – FC Barcelona', 2005, 43),
('Futebolista do ano – FC Barcelona', 2007, 43),
('Futebolista do ano – FC Barcelona', 2008, 43),
('Futebolista do ano – FC Barcelona', 2009, 43),
('Futebolista do ano – FC Barcelona', 2010, 43),
('Futebolista do ano – FC Barcelona', 2011, 43),
('Futebolista do ano – FC Barcelona', 2012, 43),
('Futebolista do ano – FC Barcelona', 2013, 43),
('Futebolista do ano – FC Barcelona', 2015, 43),
('Futebolista do ano – FC Barcelona', 2016, 43),
('Futebolista do ano – FC Barcelona', 2017, 43),
('Futebolista do ano – FC Barcelona', 2019, 43),
('Futebolista do ano – FC Barcelona', 2020, 43),
('Futebolista do ano – FC Paris Saint-Germain', 2021, 43),
('Futebolista do ano – FC Paris Saint-Germain', 2022, 43),
('Futebolista do ano – Inter Miami CF', 2023, 43),

-- MLS MVP
('MLS MVP – Major League Soccer', 2024, 43),

-- Artilheiro
('Artilheiro – Campeonato do Mundo Sub-20', 2005, 43),
('Artilheiro – Copa do Rei', 2008, 43),
('Artilheiro – Liga dos Campeões', 2008, 43),
('Artilheiro – LaLiga', 2009, 43),
('Artilheiro – Liga dos Campeões', 2009, 43),
('Artilheiro – LaLiga', 2010, 43),
('Artilheiro – Copa do Rei', 2010, 43),
('Artilheiro – Liga dos Campeões', 2010, 43),
('Artilheiro – LaLiga', 2011, 43),
('Artilheiro – Liga dos Campeões', 2011, 43),
('Artilheiro – Mundial de Clubes', 2011, 43),
('Artilheiro – LaLiga', 2012, 43),
('Artilheiro – LaLiga', 2013, 43),
('Artilheiro – Copa do Rei', 2013, 43),
('Artilheiro – Liga dos Campeões', 2014, 43),
('Artilheiro – LaLiga', 2014, 43),
('Artilheiro – Copa do Rei', 2015, 43),
('Artilheiro – Copa do Rei', 2016, 43),
('Artilheiro – Copa do Rei', 2016, 43),
('Artilheiro – LaLiga', 2016, 43),
('Artilheiro – LaLiga', 2017, 43),
('Artilheiro – Liga dos Campeões', 2018, 43),
('Artilheiro – LaLiga', 2018, 43),
('Artilheiro – LaLiga', 2019, 43),
('Artilheiro – LaLiga', 2020, 43),
('Artilheiro – Leagues Cup', 2022, 43),
('Artilheiro – Major League Soccer', 2024, 43),
('Artilheiro – Eliminatórias da Copa do Mundo América do Sul', 2024, 43),

-- Jogador da época
('Jogador da época – LaLiga', 2008, 43),
('Jogador da época – LaLiga', 2009, 43),
('Jogador da época – LaLiga', 2010, 43),
('Jogador da época – LaLiga', 2011, 43),
('Jogador da época – LaLiga', 2012, 43),
('Jogador da época – LaLiga', 2013, 43),
('Jogador da época – LaLiga', 2014, 43),
('Jogador da época – LaLiga', 2016, 43),
('Jogador da época – LaLiga', 2017, 43),

-- Futebolista do Ano (Transfermarkt.de escolha do utilizador)
('Futebolista do Ano (Transfermarkt.de escolha do utilizador) – Espanha', 2018, 43),
('Futebolista do Ano (Transfermarkt.de escolha do utilizador) – Espanha', 2019, 43),
('Futebolista do Ano (Transfermarkt.de escolha do utilizador) – Espanha', 2020, 43),
('Futebolista do Ano (Transfermarkt.de escolha do utilizador) – Espanha', 2021, 43),

('Ballon dOr', 2010, 43),
('Ballon dOr', 2011, 43),
('Ballon dOr', 2012, 43),
('Ballon dOr', 2013, 42),
('Ballon dOr', 2014, 42),
('Ballon dOr', 2015, 43),
('Ballon dOr', 2016, 42),
('Ballon dOr', 2017, 42),
('Ballon dOr', 2018, 44),  -- Luka Modric (Croácia)

('Jogador do Ano do Campeonato Bósnio', 2003, 44),
('Futebolista Croata Esperança do Ano', 2004, 44),
('Jogador do Ano do Campeonato Croata', 2007, 44),
('Futebolista Croata do Ano', 2007, 44),
('Futebolista Croata do Ano', 2008, 44),
('Futebolista Croata do Ano', 2011, 44),
('Futebolista Croata do Ano', 2014, 44),
('Futebolista Croata do Ano', 2016, 44),
('Futebolista Croata do Ano', 2017, 44),
('Futebolista Croata do Ano', 2018, 44),
('Futebolista Croata do Ano', 2019, 44),
('Futebolista Croata do Ano', 2020, 44),
('Futebolista Croata do Ano', 2021, 44),
('Seleção da Eurocopa', 2008, 44),
('Seleção da Liga dos Campeões da UEFA – Real Madrid CF', 2013, 44),
('Seleção da Liga dos Campeões da UEFA – Real Madrid CF', 2015, 44),
('Seleção da Liga dos Campeões da UEFA – Real Madrid CF', 2016, 44),
('Seleção da Liga dos Campeões da UEFA – Real Madrid CF', 2017, 44),
('Seleção da Liga dos Campeões da UEFA – Real Madrid CF', 2020, 44),
('Seleção da Liga dos Campeões da UEFA – Real Madrid CF', 2021, 44),
('Melhor meia da La Liga – Real Madrid CF', 2014, 44),
('Melhor meia da La Liga – Real Madrid CF', 2016, 44),
('FIFPro World XI – Real Madrid CF', 2015, 44),
('FIFPro World XI – Real Madrid CF', 2016, 44),
('FIFPro World XI – Real Madrid CF', 2017, 44),
('FIFPro World XI – Real Madrid CF', 2018, 44),
('FIFPro World XI – Real Madrid CF', 2019, 44),
('FIFPro World XI – Real Madrid CF', 2022, 44),
('Equipe do Ano da La Liga – Real Madrid CF', 2016, 44),
('Equipe do Ano da UEFA – Real Madrid CF', 2016, 44),
('Equipe do Ano da UEFA – Real Madrid CF', 2017, 44),
('Equipe do Ano da UEFA – Real Madrid CF', 2018, 44),
('Meia do Ano da UEFA – Real Madrid CF', 2017, 44),
('Meia do Ano da UEFA – Real Madrid CF', 2018, 44),
('Bola de Prata da Copa do Mundo de Clubes da FIFA – Real Madrid CF', 2016, 44),
('Bola de Ouro da Copa do Mundo de Clubes da FIFA – Real Madrid CF', 2017, 44),
('Homem do Jogo da Copa do Mundo de Clubes da FIFA – Real Madrid CF', 2017, 44),
('Melhor Jogador da UEFA na Europa – Real Madrid CF', 2018, 44),
('Equipe do Ano IFFHS – Real Madrid CF', 2017, 44),
('Equipe do Ano IFFHS – Real Madrid CF', 2018, 44),
('Bola de Ouro da Copa do Mundo FIFA – Croácia', 2018, 44),
('Bola de Bronze da Copa do Mundo FIFA – Croácia', 2022, 44),
('Seleção da Copa do Mundo FIFA – Croácia', 2018, 44),
('Homem do Jogo da Copa do Mundo FIFA – Croácia', 2018, 44),
('Homem do Jogo da Copa do Mundo FIFA – Croácia', 2022, 44),
('Equipe do Ano ESM – Real Madrid CF', 2022, 44),
('Melhor Jogador de Futebol Masculino da FIFA – Real Madrid CF', 2018, 44),
('Ballon d\Or – Real Madrid CF', 2018, 44),
('Melhor Jogador do Mundo (World Soccer) – Real Madrid CF', 2018, 44),
('Melhor Jogador do Mundo (The Guardian) – Real Madrid CF', 2018, 44),
('Melhor Jogador do Mundo (Goal 50) – Real Madrid CF', 2018, 44),
('Jogador do Ano pela IFFHS – Real Madrid CF', 2018, 44),
('Melhor Criador de Jogo pela IFFHS – Real Madrid CF', 2018, 44),
('Prêmio ESPN Melhor Meia do Ano – Real Madrid CF', 2016, 44),
('Prêmio ESPN Melhor Meia do Ano – Real Madrid CF', 2017, 44),
('Spurs Melhor Jogador da Temporada – Tottenham Hotspur', 2011, 44),
('Prémio Golden Foot – Real Madrid CF', 2019, 44),
('Seleção da década (2011–2020) pela IFFHS – Real Madrid CF', 44, 44),
('Equipe Mundial do Ano da IFFHS – Real Madrid CF', 2022, 44),

('Ballon dOr', 2019, 43),
('Ballon dOr', 2021, 43),
('Ballon dOr', 2022, 45),  -- Karim Benzema (França)

('Trofeo Bravo', 2008, 45),
('Jogador Francês do Ano', 2011, 45),
('Jogador Francês do Ano', 2012, 45),
('Jogador Francês do Ano', 2014, 45),
('Jogador Francês do Ano', 2021, 45),
('Troféu Alfredo Di Stéfano', 2020, 45),
('Onze d\Or', 2021, 45),
('Onze d\Or', 2022, 45),
('Melhor Jogador do Real Madrid na Temporada', 2022, 45),
('Melhor Jogador do Mundo pelo Marca', 2022, 45),
('Melhor Jogador de Clubes da UEFA', 2022, 45),
('Troféu Pichichi', 2022, 45),
('Ballon d\Or', 2022, 45),
('Globe Soccer Awards', 2022, 45),
('Seleção Francesa de Todos os Tempos (Time C) - IFFHS', 45, 45),
('Melhor Jogador do Campeonato Saudita', 2025, 45),

('Ballon dOr', 2024, 46),  -- Rodri (Espanha)

('Melhor Jogador do Mundo (The Guardian)', 2024, 46),
('Jogador do ano pela IFFHS', 2024, 46),
('Seleção da Liga dos Campeões da UEFA', 2023, 46),
('Melhor Jogador da Liga dos Campeões da UEFA', 2023, 46),
('Melhor Jogador da Liga das Nações da UEFA', 2023, 46),
('Bola de Ouro da Copa do Mundo de Clubes da FIFA', 2023, 46),
('Melhor Jogador da Eurocopa', 2024, 46),
('FIFPro World XI', 2024, 46),
('Seleção do Ano da FIFA', 2024, 46),

('Ballon dOr', 2025, 47),  -- Ousmane Dembélé (França)

('40 jovens promessas do futebol mundial (The Guardian)', 2014, 47),
('Melhor jogador jovem da Ligue 1', 2016, 47),
('50 jovens promessas do futebol mundial (La Gazzetta dello Sport)', 2016, 47),
('100º melhor jogador do ano (The Guardian)', 2016, 47),
('Seleção das revelações da Liga dos Campeões', 2016, 47),
('63º melhor jogador do ano (Marca)', 2016, 47),
('Equipe ideal da Bundesliga', 2017, 47),
('Melhor jogador da Supercopa da França', 2024, 47),
('Melhor jogador do mês da Ligue 1', 2016, 47),
('Melhor jogador do mês da Ligue 1', 2025, 47),
('Melhor jogador da Ligue 1', 2025, 47),
('Time do Ano da Ligue 1', 2024, 47),
('Time do Ano da Ligue 1', 2025, 47),
('Jogador da Temporada da Liga dos Campeões da UEFA', 2025, 47);



INSERT INTO Clube (Nome, Imagem, Cor) VALUES
('Real Madrid Club de Fútbol', '/img/clubes/real_madrid.jpg', '#C5A45F'),
('Futbol Club Barcelona', '/img/clubes/barcelona.jpg', '#A50044'),
('Manchester United Football Club', '/img/clubes/manchester_united.jpg', '#DA291C'),
('Liverpool Football Club', '/img/clubes/liverpool.jpg', '#C8102E'),
('Juventus Football Club', '/img/clubes/juventus.jpg', '#000000'),
('AC Milan', '/img/clubes/ac_milan.jpg', '#D4001C'),
('Internazionale', '/img/clubes/inter_milan.jpg', '#0055A4'),
('FC Bayern München', '/img/clubes/bayern_munich.jpg', '#EB052B'),
('Borussia Dortmund', '/img/clubes/borussia_dortmund.jpg', '#c7bc26'),
('Borussia Mönchengladbach', '/img/clubes/borussia_monchengladbach.jpg', '#009A44'),
('AFC Ajax', '/img/clubes/ajax.jpg', '#ED1C24'),
('Sport Lisboa e Benfica', '/img/clubes/benfica.jpg', '#E30613'),
('Chelsea Football Club', '/img/clubes/chelsea.jpg', '#034694'),
('Manchester City Football Club', '/img/clubes/manchester_city.jpg', '#6CABDD'),
('Paris Saint-Germain', '/img/clubes/psg.jpg', '#004170'),
('SSC Napoli', '/img/clubes/napoli.jpg', '#1D99DC'),
('Hamburger SV', '/img/clubes/hamburgo.jpg', '#00629D'),
('Ferencvárosi TC', '/img/clubes/ferencvaros.jpg', '#009639'),
('Dynamo Kyiv', '/img/clubes/dinamo_kiev.jpg', '#005BBB'),
('Dinamo Moskva', '/img/clubes/dinamo_moscou.jpg', '#005BBB'),
('Stade de Reims', '/img/clubes/stade_reims.jpg', '#E30613'),
('ACF Fiorentina', '/img/clubes/fiorentina.jpg', '#4B0082'),
('Arsenal', '/img/clubes/arsenal.jpg', '#EF0107'),
('Tottenham', '/img/clubes/tottenham.jpg', '#132257'),
('Leeds United', '/img/clubes/leeds_united.jpg', '#FFCD00'),
('Atlético de Madrid', '/img/clubes/atletico_madrid.jpg', '#D20032'),
('Valencia', '/img/clubes/valencia.jpg', '#FF6600'),
('Porto', '/img/clubes/porto.jpg', '#0055A4'),
('Sporting CP', '/img/clubes/sporting_cp.jpg', '#006600'),
('Rangers', '/img/clubes/rangers.jpg', '#0033A0'),
('Celtic', '/img/clubes/celtic.jpg', '#00843D'),
('Dínamo Zagreb', '/img/clubes/dinamo_zagreb.jpg', '#005BBB'),
('CSKA Moscou', '/img/clubes/cska_moscou.jpg', '#ED1C24'),
('Anderlecht', '/img/clubes/anderlecht.jpg', '#660099'),
('Sevilla', '/img/clubes/sevilla.jpg', '#DA291C'),
('Villarreal', '/img/clubes/villarreal.jpg', '#a59955'),
('Shakhtar Donetsk', '/img/clubes/shakhtar_donetsk.jpg', '#FF6600'),
('Everton', '/img/clubes/everton.jpg', '#003399'),
('West Ham', '/img/clubes/west_ham.jpg', '#7A263A'),
('Newcastle United Football Club', '/img/clubes/newcastle_united.jpg', '#241F20'),
('Blackpool Football Club', '/img/clubes/blackpool.jpg', '#F99B1C'),
('Stoke City Football Club', '/img/clubes/stoke_city.jpg', '#D9403B'),
('Dukla Praga', '/img/clubes/dukla_praga.jpg', '#FF6600'),
('Sparta Praga', '/img/clubes/sparta_praga.jpg', '#990000'),
('SS Lazio', '/img/clubes/lazio.jpg', '#87CEEB'),
('Olympique de Marseille', '/img/clubes/olympique_de_marseille.jpg', '#00AEEF'),
('Club Atlético River Plate', '/img/clubes/river_plate.jpg', '#ED1C24'),
('Millonarios Fútbol Club', '/img/clubes/millionarios.jpg', '#003399'),
('RCD Espanyol', '/img/clubes/espanyol.jpg', '#0055A4'),
('Angers SCO', '/img/clubes/angers.jpg', '#000000'),
('Deportivo La Corunã', '/img/clubes/deportivo_la_coruna.jpg', '#003399'),
('Sampdoria', '/img/clubes/sampdoria.jpg', '#004B95'),
('ZSJ Technomat Teplice', '/img/clubes/fk_teplice.jpg', '#012AA9'),
('Crossing Molenbeek', '/img/clubes/crossing_molenbeek.jpg', '#325CA8'),
('Huddersfield Town FC', '/img/clubes/hunddersfield_town.jpg', '#0169B3'),
('Torino Football Club', '/img/clubes/torino.jpg', '#800000'),
('Stade Rennais Football Club', '/img/clubes/rennes.jpg', '#E30613'),
('Lyon', '/img/clubes/lyon.jpg', '#0055A4'),
('Orlando City', '/img/clubes/orlando_city.jpg', '#5C2D91'),
('Al Ahli', '/img/clubes/al_ahli.jpg', '#006C35'),
('Fluminense Football Club', '/img/clubes/fluminense.jpg', '#008000'),
('Querétaro Fútbol Club', '/img/clubes/queretaro.jpg', '#005BBB'),
('Clube Atlético Mineiro', '/img/clubes/atletico_mineiro.jpg', '#000000'),
('Clube de Regatas do Flamengo', '/img/clubes/flamengo.jpg', '#FF0000'),
('Grêmio Foot-Ball Porto Alegrense', '/img/clubes/gremio.jpg', '#00AEEF'),
('São Caetano Futebol', '/img/clubes/sao_caetano.jpg', '#005BBB'),
('Kabuscorp', '/img/clubes/kabuscorp.jpg', '#FF0000'),
('São Paulo Futebol Clube', '/img/clubes/sao_paulo.jpg', '#FF0000'),
('Bunyodkor', '/img/clubes/bunyodkor.jpg', '#007FFF'),
('AEK Atenas', '/img/clubes/aek.jpg', '#c7b550'),
('Olympiacos F.C.', '/img/clubes/olympiacos.jpg', '#E30613'),
('Sociedade Esportiva Palmeiras', '/img/clubes/palmeiras.jpg', '#008000'),
('Mogi Mirim Clube', '/img/clubes/mogi_mirim.jpg', '#FF0000'),
('Santa Cruz Futebol Clube', '/img/clubes/santa_cruz.jpg', '#FF0000'),
('AS Cannes', '/img/clubes/cannes.jpg', '#E30613'),
('Sport Club Corinthians Paulista', '/img/clubes/corinthians.jpg', '#000000'),
('Cruzeiro Esporte Clube', '/img/clubes/cruzeiro.jpg', '#003399'),
('VfB Stuttgart', '/img/clubes/stuttgart.jpg', '#E30613'),
('Dynamo Dresden', '/img/clubes/dynamo_dresden.jpg', '#FFCC00'),
('Al Jazira', '/img/clubes/al_jazira.jpg', '#FF0000'),
('AS Monaco', '/img/clubes/monaco.jpg', '#E30613'),
('D.C. United', '/img/clubes/dc_united.jpg', '#000000'),
('Chicago Fire', '/img/clubes/chicago.jpg', '#C8102E'),
('Kashiwa Reysol', '/img/clubes/kashiwa_reysol.jpg', '#FFD700'),
('Parma Calcio 1913', '/img/clubes/parma.jpg', '#005BBB'),
('CSKA Sofia', '/img/clubes/cska_sofia.jpg', '#ED1C24'),
('Hebros 1921 Harmanli', '/img/clubes/fc_hebros.jpg', '#FF0000'),
('Brescia Calcio', '/img/clubes/brescia.jpg', '#005BBB'),
('Bologna Football Club 1909', '/img/clubes/bologna.jpg', '#DA291C'),
('JS Saint Pierroise', '/img/clubes/js_saint_pierroise.jpg', '#000000'),
('En Avant de Guingamp', '/img/clubes/guingamp.jpg', '#E30613'),
('Girondins de Bordeaux', '/img/clubes/bordeaux.jpg', '#191970'),
('Club Brugge KV', '/img/clubes/club_brugge.jpg', '#005BBB'),
('Valenciennes Football Club', '/img/clubes/valenciennes.jpg', '#E30613'),
('New York Red Bulls', '/img/clubes/new_york_red_bulls.jpg', '#C8102E'),
('ASV Herzogenaurach', '/img/clubes/asv_herzogenaurach.jpg', '#000000'),
('PSV Eindhoven', '/img/clubes/psv.jpg', '#DA291C'),
('HFC Haarlem', '/img/clubes/haarlem.jpg', '#FF0000'),
('Metalurh Mariupol', '/img/clubes/metalurh_mariupol.jpg', '#005BBB'),
('Eintracht Braunschweig', '/img/clubes/eintracht_braunschweig.jpg', '#b89d05'),
('Chornomorets Odessa', '/img/clubes/chornomorets_odessa.jpg', '#005BBB'),
('SKA Odessa', '/img/clubes/ska_odessa.jpg', '#005BBB'),
('AS Saint-Étienne', '/img/clubes/saint_etienne.jpg', '#008000'),
('AS Nancy', '/img/clubes/nancy.jpg', '#DA291C'),
('Verona', '/img/clubes/verona.jpg', '#005BBB'),
('Lanerossi Vicenza', '/img/clubes/lanerossi_vicenza.jpg', '#FF0000'),
('Association du Servette Football Club', '/img/clubes/servette.jpg', '#7C1C2E'),
('Blacktown City Football Club', '/img/clubes/blacktown_city.jpg', '#000000'),
('Southampton Football Club', '/img/clubes/southampton.jpg', '#DA291C'),
('Scunthorpe United Football Club', '/img/clubes/scunthorpe_united.jpg', '#DA291C'),
('Charlton Athletic Football Club', '/img/clubes/charlton.jpg', '#C8102E'),
('Vejle', '/img/clubes/vejle.jpg', '#C52027'),
('TSV 1860 München', '/img/clubes/sc_1906_munchen.jpg', '#005BBB'),
('Feyenoord Rotterdam', '/img/clubes/feyenoord.jpg', '#DA291C'),
('Levante Unión Deportiva', '/img/clubes/levante.jpg', '#F3B202'),
('Washington Diplomats', '/img/clubes/washington_diplomats.jpg', '#C12745'),
('TSV 1861 Nördlingen', '/img/clubes/tsv_nordlingen.jpg', '#2BA358'),
('Unione Sportiva Alessandria', '/img/clubes/alessandria.jpg', '#A72223'),
('Nuneaton Borough', '/img/clubes/nuneaton_borough.jpg', '#000000'),
('Brisbane Lions', '/img/clubes/brisbane_lions.jpg', '#000000'),
('AFC Bournemouth', '/img/clubes/afc_bournemouth.jpg', '#DA291C'),
('Hong Kong Rangers', '/img/clubes/hong_kong_rangers.jpg', '#0000FF'),
('Sea Bees', '/img/clubes/sea_bees.jpg', '#000000'),
('San Jose Earthquakes', '/img/clubes/san_jose_earthquakes.jpg', '#000000'),
('Hibernian Football Club', '/img/clubes/hibernian.jpg', '#007A33'),
('Fort Lauderdale Strikers', '/img/clubes/fort_lauderdale_strikers.jpg', '#D03E48'),
('Fulham Football Club', '/img/clubes/fulham.jpg', '#000000'),
('Los Angeles Aztecs', '/img/clubes/los_angeles_aztecs.jpg', '#001F4F'),
('Cork Celtic', '/img/clubes/cork_celtic.jpg', '#000000'),
('Stockport County', '/img/clubes/stockport_county.jpg', '#000000'),
('Waterford United', '/img/clubes/waterford_united.jpg', '#2E3E8C'),
('Preston North End Football Club', '/img/clubes/preston_north_end.jpg', '#91cefa'),
('Buffalo Stallions', '/img/clubes/buffalo_stallions.jpg', '#234A73'),
('União de Tomar', '/img/clubes/uniao_de_tomar.jpg', '#C52027'),
('New Jersey Americans', '/img/clubes/new_jersey_americans.jpg', '#21124B'),
('Las Vegas Quicksilvers', '/img/clubes/las_vegas_quicksilvers.jpg', '#6796C0'),
('Toronto Metros-Croatia', '/img/clubes/toronto_blizzard.jpg', '#3C5677'),
('Sport Clube Beira-Mar', '/img/clubes/beira_mar.jpg', '#FFE60A'),
('Club de Fútbol Monterrey', '/img/clubes/monterrey.jpg', '#10243D'),
('Boston Minutemen', '/img/clubes/boston_minutemen.jpg', '#2F35D9'),
('Sporting Lourenço Marques', '/img/clubes/sporting_lourenco_marques.jpg', '#144B9A'),
('New York Cosmos', '/img/clubes/new_york_cosmos.jpg', '#d6b326'),
('Vorwärts Steyr', '/img/clubes/vorwarts_steyr.jpg', '#C52027'),
('Aris Limassol', '/img/clubes/aris_limassol.jpg', '#0A9949'),
('Cap-Ferret', '/img/clubes/cap_ferret.jpg', '#000000'),
('Biganos-Boiens', '/img/clubes/biganos_boiens.jpg', '#000000'),
('New York MetroStars', '/img/clubes/new_york_metrostars.jpg', '#C8102E'),
('RCF Vichy','/img/clubes/vichy.jpg', '#000000'),
('Hellas Verona Football Club', '/img/clubes/hellas_verona.jpg', '#005BBB'),
('Al-Nassr', '/img/clubes/al_nassr.jpg', '#a59955'),
('Al-Ahli', '/img/clubes/al_ahli.jpg', '#006C35'),
('Inter Miami', '/img/clubes/inter_miami.jpg', '#000000'),
('Al-Ittihad', '/img/clubes/al_ittihad.jpg', '#a59955'),
('JS Saint-Pierroise', '/img/clubes/saint_pierroise.jpg', '#000000');

-- Stanley Matthews
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Stanley Matthews'), (SELECT Id FROM Clube WHERE Nome = 'Stoke City Football Club'), 1932, 1947),
((SELECT Id FROM Jogador WHERE Nome = 'Stanley Matthews'), (SELECT Id FROM Clube WHERE Nome = 'Blackpool Football Club'), 1947, 1961),
((SELECT Id FROM Jogador WHERE Nome = 'Stanley Matthews'), (SELECT Id FROM Clube WHERE Nome = 'Stoke City Football Club'), 1961, 1965);

-- Alfredo Di Stéfano
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Alfredo Di Stéfano'), (SELECT Id FROM Clube WHERE Nome = 'Club Atlético River Plate'), 1945, 1949),
((SELECT Id FROM Jogador WHERE Nome = 'Alfredo Di Stéfano'), (SELECT Id FROM Clube WHERE Nome = 'Millonarios Fútbol Club'), 1949, 1953),
((SELECT Id FROM Jogador WHERE Nome = 'Alfredo Di Stéfano'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid Club de Fútbol'), 1953, 1964),
((SELECT Id FROM Jogador WHERE Nome = 'Alfredo Di Stéfano'), (SELECT Id FROM Clube WHERE Nome = 'RCD Espanyol'), 1964, 1966);

-- Raymond Kopa
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Raymond Kopa'), (SELECT Id FROM Clube WHERE Nome = 'Angers SCO'), 1949, 1951),
((SELECT Id FROM Jogador WHERE Nome = 'Raymond Kopa'), (SELECT Id FROM Clube WHERE Nome = 'Stade de Reims'), 1951, 1956),
((SELECT Id FROM Jogador WHERE Nome = 'Raymond Kopa'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid Club de Fútbol'), 1956, 1959),
((SELECT Id FROM Jogador WHERE Nome = 'Raymond Kopa'), (SELECT Id FROM Clube WHERE Nome = 'Stade de Reims'), 1959, 1967);

-- 	Luis Suárez Miramontes
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Luis Suárez Miramontes'), (SELECT Id FROM Clube WHERE Nome = 'Deportivo La Coruña'), 1953, 1954),
((SELECT Id FROM Jogador WHERE Nome = 'Luis Suárez Miramontes'), (SELECT Id FROM Clube WHERE Nome = 'Futbol Club Barcelona'), 1954, 1961),
((SELECT Id FROM Jogador WHERE Nome = 'Luis Suárez Miramontes'), (SELECT Id FROM Clube WHERE Nome = 'Internazionale'), 1961, 1970),
((SELECT Id FROM Jogador WHERE Nome = 'Luis Suárez Miramontes'), (SELECT Id FROM Clube WHERE Nome = 'Sampdoria'), 1970, 1973);

-- Omar Sivori
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Omar Sivori'), (SELECT Id FROM Clube WHERE Nome = 'Club Atlético River Plate'), 1950, 1952),
((SELECT Id FROM Jogador WHERE Nome = 'Omar Sivori'), (SELECT Id FROM Clube WHERE Nome = 'Juventus Football Club'), 1952, 1968),
((SELECT Id FROM Jogador WHERE Nome = 'Omar Sivori'), (SELECT Id FROM Clube WHERE Nome = 'SSC Napoli'), 1968, 1970);

-- Lev Yashin
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Lev Yashin'), (SELECT Id FROM Clube WHERE Nome = 'Dinamo Moskva'), 1950, 1952);

-- Denis Law
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Denis Law'), (SELECT Id FROM Clube WHERE Nome = 'Huddersfield Town FC'), 1956, 1960),
((SELECT Id FROM Jogador WHERE Nome = 'Denis Law'), (SELECT Id FROM Clube WHERE Nome = 'Manchester City Football Club'), 1960, 1961),
((SELECT Id FROM Jogador WHERE Nome = 'Denis Law'), (SELECT Id FROM Clube WHERE Nome = 'Torino Football Club'), 1961, 1962),
((SELECT Id FROM Jogador WHERE Nome = 'Denis Law'), (SELECT Id FROM Clube WHERE Nome = 'Manchester United Football Club'), 1962, 1973),
((SELECT Id FROM Jogador WHERE Nome = 'Denis Law'), (SELECT Id FROM Clube WHERE Nome = 'Manchester City Football Club'), 1973, 1974);

-- Eusébio
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Eusébio'), (SELECT Id FROM Clube WHERE Nome = 'Sporting Lourenço Marques'), 1957, 1960),
((SELECT Id FROM Jogador WHERE Nome = 'Eusébio'), (SELECT Id FROM Clube WHERE Nome = 'Sport Lisboa e Benfica'), 1960, 1975),
((SELECT Id FROM Jogador WHERE Nome = 'Eusébio'), (SELECT Id FROM Clube WHERE Nome = 'Boston Minutemen'), 1975, 1975),
((SELECT Id FROM Jogador WHERE Nome = 'Eusébio'), (SELECT Id FROM Clube WHERE Nome = 'Club de Fútbol Monterrey'), 1975, 1976),
((SELECT Id FROM Jogador WHERE Nome = 'Eusébio'), (SELECT Id FROM Clube WHERE Nome = 'Sport Clube Beira-Mar'), 1976, 1977),
((SELECT Id FROM Jogador WHERE Nome = 'Eusébio'), (SELECT Id FROM Clube WHERE Nome = 'Toronto Metros-Croatia'), 1976, 1976),
((SELECT Id FROM Jogador WHERE Nome = 'Eusébio'), (SELECT Id FROM Clube WHERE Nome = 'Las Vegas Quicksilvers'), 1977, 1977),
((SELECT Id FROM Jogador WHERE Nome = 'Eusébio'), (SELECT Id FROM Clube WHERE Nome = 'New Jersey Americans'), 1977, 1978),
((SELECT Id FROM Jogador WHERE Nome = 'Eusébio'), (SELECT Id FROM Clube WHERE Nome = 'União de Tomar'), 1977, 1978),
((SELECT Id FROM Jogador WHERE Nome = 'Eusébio'), (SELECT Id FROM Clube WHERE Nome = 'Buffalo Stallions'), 1979, 1980);

-- Josef Masopust
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Josef Masopust'), (SELECT Id FROM Clube WHERE Nome = 'ZSJ Technomat Teplice'), 1954, 1957),
((SELECT Id FROM Jogador WHERE Nome = 'Josef Masopust'), (SELECT Id FROM Clube WHERE Nome = 'Dukla Praga'), 1957, 1965),
((SELECT Id FROM Jogador WHERE Nome = 'Josef Masopust'), (SELECT Id FROM Clube WHERE Nome = 'Crossing Molenbeek'), 1961, 1970);

-- Bobby Charlton
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Bobby Charlton'), (SELECT Id FROM Clube WHERE Nome = 'Manchester United Football Club'), 1956, 1973),
((SELECT Id FROM Jogador WHERE Nome = 'Bobby Charlton'), (SELECT Id FROM Clube WHERE Nome = 'Preston North End Football Club'), 1974, 1975),
((SELECT Id FROM Jogador WHERE Nome = 'Bobby Charlton'), (SELECT Id FROM Clube WHERE Nome = 'Waterford United'), 1976, 1976);

-- Flórián Albert
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Flórián Albert'), (SELECT Id FROM Clube WHERE Nome = 'Ferencvárosi TC'), 1958, 1974);

-- George Best
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'George Best'), (SELECT Id FROM Clube WHERE Nome = 'Manchester United Football Club'), 1963, 1974),
((SELECT Id FROM Jogador WHERE Nome = 'George Best'), (SELECT Id FROM Clube WHERE Nome = 'Fulham Football Club'), 1976, 1977),
((SELECT Id FROM Jogador WHERE Nome = 'George Best'), (SELECT Id FROM Clube WHERE Nome = 'Los Angeles Aztecs'), 1976, 1978),
((SELECT Id FROM Jogador WHERE Nome = 'George Best'), (SELECT Id FROM Clube WHERE Nome = 'Fort Lauderdale Strikers'), 1978, 1979),
((SELECT Id FROM Jogador WHERE Nome = 'George Best'), (SELECT Id FROM Clube WHERE Nome = 'Hibernian Football Club'), 1979, 1980);

-- Gianni Rivera
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Gianni Rivera'), (SELECT Id FROM Clube WHERE Nome = 'Unione Sportiva Alessandria'), 1959, 1960),
((SELECT Id FROM Jogador WHERE Nome = 'Gianni Rivera'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 1960, 1979);

-- Gerd Müller
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Gerd Müller'), (SELECT Id FROM Clube WHERE Nome = 'TSV 1861 Nördlingen'), 1963, 1964),
((SELECT Id FROM Jogador WHERE Nome = 'Gerd Müller'), (SELECT Id FROM Clube WHERE Nome = 'FC Bayern München'), 1964, 1979),
((SELECT Id FROM Jogador WHERE Nome = 'Gerd Müller'), (SELECT Id FROM Clube WHERE Nome = 'Fort Lauderdale Strikers'), 1979, 1981);

-- Johan Cruijff
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Johan Cruijff'), (SELECT Id FROM Clube WHERE Nome = 'AFC Ajax'), 1964, 1973),
((SELECT Id FROM Jogador WHERE Nome = 'Johan Cruijff'), (SELECT Id FROM Clube WHERE Nome = 'Futbol Club Barcelona'), 1973, 1978),
((SELECT Id FROM Jogador WHERE Nome = 'Johan Cruijff'), (SELECT Id FROM Clube WHERE Nome = 'Los Angeles Aztecs'), 1979, 1980),
((SELECT Id FROM Jogador WHERE Nome = 'Johan Cruijff'), (SELECT Id FROM Clube WHERE Nome = 'Washington Diplomats'), 1980, 1981),
((SELECT Id FROM Jogador WHERE Nome = 'Johan Cruijff'), (SELECT Id FROM Clube WHERE Nome = 'Levante Unión Deportiva'), 1981, 1981),
((SELECT Id FROM Jogador WHERE Nome = 'Johan Cruijff'), (SELECT Id FROM Clube WHERE Nome = 'Washington Diplomats'), 1981, 1981),
((SELECT Id FROM Jogador WHERE Nome = 'Johan Cruijff'), (SELECT Id FROM Clube WHERE Nome = 'AFC Ajax'), 1981, 1983),
((SELECT Id FROM Jogador WHERE Nome = 'Johan Cruijff'), (SELECT Id FROM Clube WHERE Nome = 'Feyenoord Rotterdam'), 1983, 1984);

-- Franz Beckenbauer
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Franz Beckenbauer'), (SELECT Id FROM Clube WHERE Nome = 'FC Bayern München'), 1964, 1977),
((SELECT Id FROM Jogador WHERE Nome = 'Franz Beckenbauer'), (SELECT Id FROM Clube WHERE Nome = 'New York Cosmos'), 1977, 1980),
((SELECT Id FROM Jogador WHERE Nome = 'Franz Beckenbauer'), (SELECT Id FROM Clube WHERE Nome = 'Hamburger SV'), 1980, 1982),
((SELECT Id FROM Jogador WHERE Nome = 'Franz Beckenbauer'), (SELECT Id FROM Clube WHERE Nome = 'New York Cosmos'), 1983, 1983);

-- Oleg Blokhin
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Oleg Blokhin'), (SELECT Id FROM Clube WHERE Nome = 'Dynamo Kyiv'), 1969, 1988),
((SELECT Id FROM Jogador WHERE Nome = 'Oleg Blokhin'), (SELECT Id FROM Clube WHERE Nome = 'Vorwärts Steyr'), 1988, 1989),
((SELECT Id FROM Jogador WHERE Nome = 'Oleg Blokhin'), (SELECT Id FROM Clube WHERE Nome = 'Aris Limassol'), 1989, 1990);

-- Allan Simonsen
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Allan Simonsen'), (SELECT Id FROM Clube WHERE Nome = 'Vejle'), 1971, 1972),
((SELECT Id FROM Jogador WHERE Nome = 'Allan Simonsen'), (SELECT Id FROM Clube WHERE Nome = 'Borussia Mönchengladbach'), 1972, 1979),
((SELECT Id FROM Jogador WHERE Nome = 'Allan Simonsen'), (SELECT Id FROM Clube WHERE Nome = 'Futbol Club Barcelona'), 1979, 1982),
((SELECT Id FROM Jogador WHERE Nome = 'Allan Simonsen'), (SELECT Id FROM Clube WHERE Nome = 'Charlton Athletic Football Club'), 1982, 1983),
((SELECT Id FROM Jogador WHERE Nome = 'Allan Simonsen'), (SELECT Id FROM Clube WHERE Nome = 'Vejle'), 1983, 1989);

-- Kevin Keegan
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Kevin Keegan'), (SELECT Id FROM Clube WHERE Nome = 'Scunthorpe United Football Club'), 1968, 1971),
((SELECT Id FROM Jogador WHERE Nome = 'Kevin Keegan'), (SELECT Id FROM Clube WHERE Nome = 'Liverpool Football Club'), 1971, 1977),
((SELECT Id FROM Jogador WHERE Nome = 'Kevin Keegan'), (SELECT Id FROM Clube WHERE Nome = 'Hamburger SV'), 1977, 1980),
((SELECT Id FROM Jogador WHERE Nome = 'Kevin Keegan'), (SELECT Id FROM Clube WHERE Nome = 'Southampton Football Club'), 1980, 1982),
((SELECT Id FROM Jogador WHERE Nome = 'Kevin Keegan'), (SELECT Id FROM Clube WHERE Nome = 'Newcastle United Football Club'), 1982, 1984),
((SELECT Id FROM Jogador WHERE Nome = 'Kevin Keegan'), (SELECT Id FROM Clube WHERE Nome = 'Blacktown City Football Club'), 1985, 1985);

-- Karl-Heinz Rummenigge
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Karl-Heinz Rummenigge'), (SELECT Id FROM Clube WHERE Nome = 'FC Bayern München'), 1974, 1984),
((SELECT Id FROM Jogador WHERE Nome = 'Karl-Heinz Rummenigge'), (SELECT Id FROM Clube WHERE Nome = 'Internazionale'), 1984, 1987),
((SELECT Id FROM Jogador WHERE Nome = 'Karl-Heinz Rummenigge'), (SELECT Id FROM Clube WHERE Nome = 'Association du Servette Football Club'), 1987, 1989);

-- Paolo Rossi
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Paolo Rossi'), (SELECT Id FROM Clube WHERE Nome = 'Juventus Football Club'), 1973, 1975),
((SELECT Id FROM Jogador WHERE Nome = 'Paolo Rossi'), (SELECT Id FROM Clube WHERE Nome = 'Lanerossi Vicenza'), 1976, 1979),
((SELECT Id FROM Jogador WHERE Nome = 'Paolo Rossi'), (SELECT Id FROM Clube WHERE Nome = 'Juventus Football Club'), 1981, 1985),
((SELECT Id FROM Jogador WHERE Nome = 'Paolo Rossi'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 1985, 1986),
((SELECT Id FROM Jogador WHERE Nome = 'Paolo Rossi'), (SELECT Id FROM Clube WHERE Nome = 'Hellas Verona Football Club'), 1986, 1987);

-- Michel Platini
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Michel Platini'), (SELECT Id FROM Clube WHERE Nome = 'AS Nancy'), 1972, 1979),
((SELECT Id FROM Jogador WHERE Nome = 'Michel Platini'), (SELECT Id FROM Clube WHERE Nome = 'AS Saint-Étienne'), 1979, 1982),
((SELECT Id FROM Jogador WHERE Nome = 'Michel Platini'), (SELECT Id FROM Clube WHERE Nome = 'Juventus Football Club'), 1982, 1987);

-- Igor Belanov
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Igor Belanov'), (SELECT Id FROM Clube WHERE Nome = 'SKA Odessa'), 1979, 1980),
((SELECT Id FROM Jogador WHERE Nome = 'Igor Belanov'), (SELECT Id FROM Clube WHERE Nome = 'Chornomorets Odessa'), 1981, 1984),
((SELECT Id FROM Jogador WHERE Nome = 'Igor Belanov'), (SELECT Id FROM Clube WHERE Nome = 'Dynamo Kyiv'), 1985, 1989),
((SELECT Id FROM Jogador WHERE Nome = 'Igor Belanov'), (SELECT Id FROM Clube WHERE Nome = 'Borussia Mönchengladbach'), 1989, 1990),
((SELECT Id FROM Jogador WHERE Nome = 'Igor Belanov'), (SELECT Id FROM Clube WHERE Nome = 'Eintracht Braunschweig'), 1991, 1995),
((SELECT Id FROM Jogador WHERE Nome = 'Igor Belanov'), (SELECT Id FROM Clube WHERE Nome = 'Chornomorets Odessa'), 1995, 1996),
((SELECT Id FROM Jogador WHERE Nome = 'Igor Belanov'), (SELECT Id FROM Clube WHERE Nome = 'Metalurh Mariupol'), 1996, 1997);

-- Ruud Gullit
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Ruud Gullit'), (SELECT Id FROM Clube WHERE Nome = 'HFC Haarlem'), 1979, 1982),
((SELECT Id FROM Jogador WHERE Nome = 'Ruud Gullit'), (SELECT Id FROM Clube WHERE Nome = 'Feyenoord Rotterdam'), 1982, 1985),
((SELECT Id FROM Jogador WHERE Nome = 'Ruud Gullit'), (SELECT Id FROM Clube WHERE Nome = 'PSV Eindhoven'), 1985, 1987),
((SELECT Id FROM Jogador WHERE Nome = 'Ruud Gullit'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 1987, 1993),
((SELECT Id FROM Jogador WHERE Nome = 'Ruud Gullit'), (SELECT Id FROM Clube WHERE Nome = 'Sampdoria'), 1993, 1994),
((SELECT Id FROM Jogador WHERE Nome = 'Ruud Gullit'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 1994, 1994),
((SELECT Id FROM Jogador WHERE Nome = 'Ruud Gullit'), (SELECT Id FROM Clube WHERE Nome = 'Sampdoria'), 1994, 1995),
((SELECT Id FROM Jogador WHERE Nome = 'Ruud Gullit'), (SELECT Id FROM Clube WHERE Nome = 'Chelsea Football Club'), 1995, 1998);

-- Marco Van Basten
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Marco Van Basten'), (SELECT Id FROM Clube WHERE Nome = 'AFC Ajax'), 1981, 1987),
((SELECT Id FROM Jogador WHERE Nome = 'Marco Van Basten'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 1987, 1995);

-- Lothar Matthäus
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Lothar Matthäus'), (SELECT Id FROM Clube WHERE Nome = 'ASV Herzogenaurach'), 1978, 1979),
((SELECT Id FROM Jogador WHERE Nome = 'Lothar Matthäus'), (SELECT Id FROM Clube WHERE Nome = 'Borussia Mönchengladbach'), 1979, 1984),
((SELECT Id FROM Jogador WHERE Nome = 'Lothar Matthäus'), (SELECT Id FROM Clube WHERE Nome = 'FC Bayern München'), 1984, 1988),
((SELECT Id FROM Jogador WHERE Nome = 'Lothar Matthäus'), (SELECT Id FROM Clube WHERE Nome = 'Internazionale'), 1988, 1992),
((SELECT Id FROM Jogador WHERE Nome = 'Lothar Matthäus'), (SELECT Id FROM Clube WHERE Nome = 'FC Bayern München'), 1992, 2000),
((SELECT Id FROM Jogador WHERE Nome = 'Lothar Matthäus'), (SELECT Id FROM Clube WHERE Nome = 'New York MetroStars'), 2000, 2000);

-- Jean-Pierre Papin
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'RCF Vichy'), 1983, 1984),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'Valenciennes Football Club'), 1984, 1985),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'Club Brugge KV'), 1985, 1986),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'Olympique de Marseille'), 1986, 1992),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 1992, 1994),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'FC Bayern München'), 1994, 1996),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'Girondins de Bordeaux'), 1996, 1998),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'En Avant de Guingamp'), 1998, 1999),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'JS Saint-Pierroise'), 1999, 2001),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'Cap-Ferret'), 2001, 2004),
((SELECT Id FROM Jogador WHERE Nome = 'Jean-Pierre Papin'), (SELECT Id FROM Clube WHERE Nome = 'Biganos-Boiens'), 2009, 2009);


-- Roberto Baggio
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Roberto Baggio'), (SELECT Id FROM Clube WHERE Nome = 'Lanerossi Vicenza'), 1982, 1985),
((SELECT Id FROM Jogador WHERE Nome = 'Roberto Baggio'), (SELECT Id FROM Clube WHERE Nome = 'ACF Fiorentina'), 1985, 1990),
((SELECT Id FROM Jogador WHERE Nome = 'Roberto Baggio'), (SELECT Id FROM Clube WHERE Nome = 'Juventus Football Club'), 1990, 1995),
((SELECT Id FROM Jogador WHERE Nome = 'Roberto Baggio'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 1995, 1997),
((SELECT Id FROM Jogador WHERE Nome = 'Roberto Baggio'), (SELECT Id FROM Clube WHERE Nome = 'Bologna Football Club 1909'), 1997, 1998),
((SELECT Id FROM Jogador WHERE Nome = 'Roberto Baggio'), (SELECT Id FROM Clube WHERE Nome = 'Internazionale'), 1998, 2000),
((SELECT Id FROM Jogador WHERE Nome = 'Roberto Baggio'), (SELECT Id FROM Clube WHERE Nome = 'Brescia Calcio'), 2000, 2004);

-- Hristo Stoichkov
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Hristo Stoichkov'), (SELECT Id FROM Clube WHERE Nome = 'Hebros 1921 Harmanli'), 1982, 1984),
((SELECT Id FROM Jogador WHERE Nome = 'Hristo Stoichkov'), (SELECT Id FROM Clube WHERE Nome = 'CSKA Sofia'), 1985, 1990),
((SELECT Id FROM Jogador WHERE Nome = 'Hristo Stoichkov'), (SELECT Id FROM Clube WHERE Nome = 'Futbol Club Barcelona'), 1990, 1995),
((SELECT Id FROM Jogador WHERE Nome = 'Hristo Stoichkov'), (SELECT Id FROM Clube WHERE Nome = 'Parma Calcio 1913'), 1995, 1996),
((SELECT Id FROM Jogador WHERE Nome = 'Hristo Stoichkov'), (SELECT Id FROM Clube WHERE Nome = 'Futbol Club Barcelona'), 1996, 1998),
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
((SELECT Id FROM Jogador WHERE Nome = 'George Weah'), (SELECT Id FROM Clube WHERE Nome = 'Chelsea Football Club'), 1999, 2000),
((SELECT Id FROM Jogador WHERE Nome = 'George Weah'), (SELECT Id FROM Clube WHERE Nome = 'Manchester City Football Club'), 2000, 2001),
((SELECT Id FROM Jogador WHERE Nome = 'George Weah'), (SELECT Id FROM Clube WHERE Nome = 'Olympique de Marseille'), 2000, 2001),
((SELECT Id FROM Jogador WHERE Nome = 'George Weah'), (SELECT Id FROM Clube WHERE Nome = 'Al-Jazira'), 2001, 2003);

-- Mathias Sammer
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Mathias Sammer'), (SELECT Id FROM Clube WHERE Nome = 'Dynamo Dresden'), 1985, 1990),
((SELECT Id FROM Jogador WHERE Nome = 'Mathias Sammer'), (SELECT Id FROM Clube WHERE Nome = 'VfB Stuttgart'), 1990, 1992),
((SELECT Id FROM Jogador WHERE Nome = 'Mathias Sammer'), (SELECT Id FROM Clube WHERE Nome = 'Internazionale'), 1992, 1993),
((SELECT Id FROM Jogador WHERE Nome = 'Mathias Sammer'), (SELECT Id FROM Clube WHERE Nome = 'Borussia Dortmund'), 1993, 1998);

-- Ronaldo
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Cruzeiro Esporte Clube'), 1993, 1994),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'PSV Eindhoven'), 1994, 1996),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Futbol Club Barcelona'), 1996, 1997),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Internazionale'), 1997, 2002),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid Club de Fútbol'), 2002, 2007),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 2007, 2008),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Sport Club Corinthians Paulista'), 2009, 2011);

-- Zinedine Zidane
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Zinedine Zidane'), (SELECT Id FROM Clube WHERE Nome = 'AS Cannes'), 1989, 1992),
((SELECT Id FROM Jogador WHERE Nome = 'Zinedine Zidane'), (SELECT Id FROM Clube WHERE Nome = 'Girondins de Bordeaux'), 1992, 1996),
((SELECT Id FROM Jogador WHERE Nome = 'Zinedine Zidane'), (SELECT Id FROM Clube WHERE Nome = 'Juventus Football Club'), 1996, 2001),
((SELECT Id FROM Jogador WHERE Nome = 'Zinedine Zidane'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid Club de Fútbol'), 2001, 2006);

-- Rivaldo
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Santa Cruz Futebol Clube'), 1990, 1992),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Mogi Mirim Clube'), 1992, 1994),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Sociedade Esportiva Palmeiras'), 1994, 1996),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Deportivo La Coruña'), 1996, 1997),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Futbol Club Barcelona'), 1997, 2002),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 2002, 2004),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Cruzeiro Esporte Clube'), 2004, 2004),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Olympiacos F.C.'), 2004, 2007),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'AEK Atenas'), 2007, 2008),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Bunyodkor'), 2008, 2010),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'São Paulo Futebol Clube'), 2011, 2011),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Kabuscorp'), 2012, 2012),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'São Caetano Futebol'), 2013, 2013),
((SELECT Id FROM Jogador WHERE Nome = 'Rivaldo'), (SELECT Id FROM Clube WHERE Nome = 'Mogi Mirim Clube'), 2014, 2015);

-- Luís Figo
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Luís Figo'), (SELECT Id FROM Clube WHERE Nome = 'Sporting CP'), 1989, 1995),
((SELECT Id FROM Jogador WHERE Nome = 'Luís Figo'), (SELECT Id FROM Clube WHERE Nome = 'Futbol Club Barcelona'), 1995, 2000),
((SELECT Id FROM Jogador WHERE Nome = 'Luís Figo'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid Club de Fútbol'), 2000, 2005),
((SELECT Id FROM Jogador WHERE Nome = 'Luís Figo'), (SELECT Id FROM Clube WHERE Nome = 'Internazionale'), 2005, 2009);

-- Michael Owen
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Michael Owen'), (SELECT Id FROM Clube WHERE Nome = 'Liverpool Football Club'), 1996, 2004),
((SELECT Id FROM Jogador WHERE Nome = 'Michael Owen'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid Club de Fútbol'), 2004, 2005),
((SELECT Id FROM Jogador WHERE Nome = 'Michael Owen'), (SELECT Id FROM Clube WHERE Nome = 'Newcastle United Football Club'), 2005, 2009),
((SELECT Id FROM Jogador WHERE Nome = 'Michael Owen'), (SELECT Id FROM Clube WHERE Nome = 'Manchester United Football Club'), 2009, 2012),
((SELECT Id FROM Jogador WHERE Nome = 'Michael Owen'), (SELECT Id FROM Clube WHERE Nome = 'Stoke City Football Club'), 2012, 2013);

-- Pavel Nedved
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Pavel Nedved'), (SELECT Id FROM Clube WHERE Nome = 'Dukla Praga'), 1991, 1992),
((SELECT Id FROM Jogador WHERE Nome = 'Pavel Nedved'), (SELECT Id FROM Clube WHERE Nome = 'Sparta Praga'), 1992, 1996),
((SELECT Id FROM Jogador WHERE Nome = 'Pavel Nedved'), (SELECT Id FROM Clube WHERE Nome = 'SS Lazio'), 1996, 2001),
((SELECT Id FROM Jogador WHERE Nome = 'Pavel Nedved'), (SELECT Id FROM Clube WHERE Nome = 'Juventus Football Club'), 2001, 2009);

-- Andriy Shevchenko
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Andriy Shevchenko'), (SELECT Id FROM Clube WHERE Nome = 'Dynamo Kyiv'), 1994, 1999),
((SELECT Id FROM Jogador WHERE Nome = 'Andriy Shevchenko'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 1999, 2006),
((SELECT Id FROM Jogador WHERE Nome = 'Andriy Shevchenko'), (SELECT Id FROM Clube WHERE Nome = 'Chelsea Football Club'), 2006, 2009),
((SELECT Id FROM Jogador WHERE Nome = 'Andriy Shevchenko'), (SELECT Id FROM Clube WHERE Nome = 'Dynamo Kyiv'), 2009, 2012);

-- Ronaldinho Gaúcho
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldinho Gaúcho'), (SELECT Id FROM Clube WHERE Nome = 'Grêmio Foot-Ball Porto Alegrense'), 1998, 2001),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldinho Gaúcho'), (SELECT Id FROM Clube WHERE Nome = 'Paris Saint-Germain'), 2001, 2003),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldinho Gaúcho'), (SELECT Id FROM Clube WHERE Nome = 'Futbol Club Barcelona'), 2003, 2008),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldinho Gaúcho'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 2008, 2011),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldinho Gaúcho'), (SELECT Id FROM Clube WHERE Nome = 'Clube de Regatas do Flamengo'), 2011, 2012),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldinho Gaúcho'), (SELECT Id FROM Clube WHERE Nome = 'Clube Atlético Mineiro'), 2012, 2014),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldinho Gaúcho'), (SELECT Id FROM Clube WHERE Nome = 'Querétaro Fútbol Club'), 2014, 2015),
((SELECT Id FROM Jogador WHERE Nome = 'Ronaldinho Gaúcho'), (SELECT Id FROM Clube WHERE Nome = 'Fluminense Football Club'), 2015, 2015);

-- Fabio Cannavaro
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Fabio Cannavaro'), (SELECT Id FROM Clube WHERE Nome = 'SSC Napoli'), 1992, 1995),
((SELECT Id FROM Jogador WHERE Nome = 'Fabio Cannavaro'), (SELECT Id FROM Clube WHERE Nome = 'Parma Calcio 1913'), 1995, 2002),
((SELECT Id FROM Jogador WHERE Nome = 'Fabio Cannavaro'), (SELECT Id FROM Clube WHERE Nome = 'Internazionale'), 2002, 2004),
((SELECT Id FROM Jogador WHERE Nome = 'Fabio Cannavaro'), (SELECT Id FROM Clube WHERE Nome = 'Juventus Football Club'), 2004, 2006),
((SELECT Id FROM Jogador WHERE Nome = 'Fabio Cannavaro'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid Club de Fútbol'), 2006, 2009),
((SELECT Id FROM Jogador WHERE Nome = 'Fabio Cannavaro'), (SELECT Id FROM Clube WHERE Nome = 'Juventus Football Club'), 2009, 2010),
((SELECT Id FROM Jogador WHERE Nome = 'Fabio Cannavaro'), (SELECT Id FROM Clube WHERE Nome = 'Al-Ahli '), 2010, 2011);

-- Kaká
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Kaká'), (SELECT Id FROM Clube WHERE Nome = 'São Paulo Futebol Clube'), 2001, 2003),
((SELECT Id FROM Jogador WHERE Nome = 'Kaká'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 2003, 2009),
((SELECT Id FROM Jogador WHERE Nome = 'Kaká'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid Club de Fútbol'), 2009, 2013),
((SELECT Id FROM Jogador WHERE Nome = 'Kaká'), (SELECT Id FROM Clube WHERE Nome = 'AC Milan'), 2013, 2014),
((SELECT Id FROM Jogador WHERE Nome = 'Kaká'), (SELECT Id FROM Clube WHERE Nome = 'Orlando City'), 2015, 2017);

-- Cristiano Ronaldo
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Cristiano Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Sporting CP'), 2002, 2003),
((SELECT Id FROM Jogador WHERE Nome = 'Cristiano Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Manchester United Football Club'), 2003, 2009),
((SELECT Id FROM Jogador WHERE Nome = 'Cristiano Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid Club de Fútbol'), 2009, 2018),
((SELECT Id FROM Jogador WHERE Nome = 'Cristiano Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Juventus Football Club'), 2018, 2021),
((SELECT Id FROM Jogador WHERE Nome = 'Cristiano Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Manchester United Football Club'), 2021, 2022),
((SELECT Id FROM Jogador WHERE Nome = 'Cristiano Ronaldo'), (SELECT Id FROM Clube WHERE Nome = 'Al-Nassr'), 2023, 2025);

-- Lionel Messi
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Lionel Messi'), (SELECT Id FROM Clube WHERE Nome = 'Futbol Club Barcelona'), 2004, 2021),
((SELECT Id FROM Jogador WHERE Nome = 'Lionel Messi'), (SELECT Id FROM Clube WHERE Nome = 'Paris Saint-Germain'), 2021, 2023),
((SELECT Id FROM Jogador WHERE Nome = 'Lionel Messi'), (SELECT Id FROM Clube WHERE Nome = 'Inter Miami'), 2023, 2025);

-- Luka Modric
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Luka Modric'), (SELECT Id FROM Clube WHERE Nome = 'Dínamo Zagreb'), 2003, 2008),
((SELECT Id FROM Jogador WHERE Nome = 'Luka Modric'), (SELECT Id FROM Clube WHERE Nome = 'Tottenham'), 2008, 2012),
((SELECT Id FROM Jogador WHERE Nome = 'Luka Modric'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid Club de Fútbol'), 2012, 2025),
((SELECT Id FROM Jogador WHERE Nome = 'Luka Modric'), (SELECT Id FROM Clube WHERE Nome = 'Ac Milan'), 2025, 2025);

-- Karin Benzema
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Karim Benzema'), (SELECT Id FROM Clube WHERE Nome = 'Lyon'), 2005, 2009),
((SELECT Id FROM Jogador WHERE Nome = 'Karim Benzema'), (SELECT Id FROM Clube WHERE Nome = 'Real Madrid Club de Fútbol'), 2009, 2023),
((SELECT Id FROM Jogador WHERE Nome = 'Karim Benzema'), (SELECT Id FROM Clube WHERE Nome = 'Al-Ittihad'), 2023, 2025);

-- Rodri
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Rodri'), (SELECT Id FROM Clube WHERE Nome = 'Villarreal'), 2016, 2018),
((SELECT Id FROM Jogador WHERE Nome = 'Rodri'), (SELECT Id FROM Clube WHERE Nome = 'Atlético de Madrid'), 2018, 2019),
((SELECT Id FROM Jogador WHERE Nome = 'Rodri'), (SELECT Id FROM Clube WHERE Nome = 'Manchester City Football Club'), 2019, 2025);

-- Ousmane Dembélé
INSERT IGNORE INTO JogadorClube (JogadorId, ClubeId, AnoInicio, AnoFim) VALUES
((SELECT Id FROM Jogador WHERE Nome = 'Ousmane Dembélé'), (SELECT Id FROM Clube WHERE Nome = 'Stade Rennais Football Club'), 2015, 2016),
((SELECT Id FROM Jogador WHERE Nome = 'Ousmane Dembélé'), (SELECT Id FROM Clube WHERE Nome = 'Borussia Dortmund'), 2016, 2017),
((SELECT Id FROM Jogador WHERE Nome = 'Ousmane Dembélé'), (SELECT Id FROM Clube WHERE Nome = 'Futbol Club Barcelona'), 2017, 2023),
((SELECT Id FROM Jogador WHERE Nome = 'Ousmane Dembélé'), (SELECT Id FROM Clube WHERE Nome = 'Paris Saint-Germain'), 2023, 2025);

select * from clube;
