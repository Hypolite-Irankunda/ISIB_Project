/*

Cours interactif réalisé par Rudi GIOT basé sur les exemples et tutoriels fournis avec SuperCollider, Plus d'informations : http://rudi.giot.eu

*/

// Merci à Eli Fieldsteel qui donne de magnifiques cours sur sa chaine Youtube
// Merci à Nick Collins pour son excellent tutorial "http://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html"
// Merci à Andy Farnell et à l'auteur du Wiki : "https://en.wikibooks.org/wiki/Designing_Sound_in_SuperCollider"

// Vous allez fabriquer des sons avec SuperCollider (que nous noterons SC)

// Ajouter les infos trouvées à : "http://doc.sccode.org/Guides/ClientVsServer.html"

/* C'est un language de programmation orienté 'génération et traitement de sons', il permet de créer des synthétiseurs complexes en studio mais peut également servir dans des installations, des performances et également lors de concert (live coding).
*/

/*
Vous aurez déjà remarqué que les commentaires sont balisés, comme dans la plupart des languages de programmation, avec la combinaison slash-étoile */

// ou un double slash si le commentaire tient sur une seule ligne

// Par défaut dans SC les commentaires sont de couleur rouge

/* Ce cours va donc alterner constament entre commentaires et code
Chaque portion de code peut être exécutée pour, parfois, entendre le résultat sonore
En effet, chaque ligne de code n'est pas toujours destinée à être 'écoutée'
Voici par exemple un premier bout de code (ligne non commentée) que nous exécuterons et analyserons plus tard ... */

{SinOsc.ar(440, 0, 0.1)}.play;

/* Mais avant de pouvoir exécuter ce code il faut d'abord démarrer le serveur de sons
Ce qui se fait de plusieurs manières :
 - Menu Language -> Boot Server
 - Raccourci clavier : cmd-B (Mac) ou CTRL-B (Windows)
 - en exécutant la commande suivante : */

Server.local.boot;

/*
Mais comment exécuter cette commande ?
Vous devez d'abord la sélectionner (surlignée en bleu) et ensuite pousser sur
Shift + return (Mac), CTRL-Return (PC) en fonction de votre OS

Vous verrez ensuite dans la fenêtre "Post Window" en bas à droite de l'écran des messages qui indiquent le démarrage du serveur ainsi que dans la barre en bas à droite de cette fenêtre des indication sur l'état du serveur (en vert si le serveur est démarré) */

// vous pouvez maintenant essayer d'arrêter le serveur

Server.local.quit;

// Les informations sur le serveur sont maintenant grisée

// Redémarrez le serveur sinon on ne pourra pas faire grand chose ...

/* Vous remarquerez également sur la droite le 'Post window' qui contient tous les messages du système suite à une exécution de code, le problème c'est que cette fenêtre est rapidement remplie ...
Il est donc possible de la 'nettoyer' en cliquant-gauche au milieu de la fenêtre et on choisit 'Clear'

Cette 'Post window' peut également être fermée (pas conseillé) ou détachée pour être déplacée failement à un endroit plus approprié : vous devez pour cela cliquer dans le coin supérieur gauche et choisir 'Undock' ou 'Detach' */

// Si malencontreusement vous fermez une fenêtre importante vous pouvez aller dans le menu view -> docklets

/* Nous allons pouvoir essayer d'exécuter le son qu'on avait rencontré plus haut
                                          ATTENTION !!!!!
Certains sons peuvent vous détruire les oreilles : éviter de travailler au casque et mettez toujours le volume au plus bas */

{SinOsc.ar(440, 0, 0.1)}.play;

/* Normalement, ça devrait fonctionner, si vous n'entendez rien, refaite la procédure depuis le début et vérifiez que vous utilisez les bonnes combinaisons de touches */

// Vous remarquerez d'abord le générateur SinOsc.ar qui permet de générer un onde sinusoïdale et qui possède entre parenthèses trois arguments : la fréquence, la phase (en radiant) et l'amplitude

// Vous remarquerez ensuite que ce générateur se trouve entre des accolades qui définissent une fonction

// Puis l'opération .play qui permet d'écouter le résultat de cette fonction

// Et finalement le ';' qui termine, comme dans beaucoup de langage, une instruction

/* Vous entendez le "LA-440" depuis un moment et vous en avez déjà probablement marre (nos oreilles n'aiment pas trop les sinusoïdes pures) et souhaitez le faire taire !
Retenez bien cette commande qui est probablement la plus utile :

Shift + Cmd + "." (ou équivalent dans les autres OS) pour arrêter les sons joués*/

/* On peut faire beaucoup d'autres choses avec SC comme par exemple "faire parler" le serveur avec la ligne suivante (Attention, ça fonctionne uniquement sur Mac et si le synthétiseur vocal de l'OS est bien configuré)
*/

"I am SuperCollider 3".speak;

// On peut également faire exécuter des commandes de l'OS (commande du Shell) :

"ls -l".unixCmd;

// le résultat apparait dans la "Post Window"

// On peut aussi faire des opérations mathématiques :

1+1;

// Mais le but premier de SC c'est de faire du son ... ou mieux : de la musique !

// Le premier son que l'on avait obtenu provenait d'un simple ocillateur sinusoidal dont la fréquence était initialisée à 440Hz :

{ SinOsc.ar(440, 0, 0.1) }.play;

// N'oubliez pas Shift + Cmd + "." pour l'arrêter

/* On peut essayer de modifier les paramètres (arguments de l'oscillateur avec, par exemple une gréquence plus haute (880Hz) */

{SinOsc.ar(880, 0, 0.1)}.play;

// ou encore avec un volume plus important (Attention les oreilles)

{SinOsc.ar(440, 0, 0.8)}.play;

// le paramètre du milieu représente la phase, ce qui ne s'entend pas sur un son unique

{SinOsc.ar(440, 3.14, 0.8)}.play;

/* Pour faciliter la sélection du code on les place souvent entre parenthèses ( ) il suffit alors de cliquer deux fois sur une des parenthèses pour exécuter l'ensemble : */
// Cliquez deux fois sur la première parenthèse et
// Pressez ensuite Shift + return :

( {
	SinOsc.ar(440,0,0.1)
}.play;
)

// Pour Additionner des signaux on utilise simplement le + :

{SinOsc.ar(440,0,0.1) + SinOsc.ar(880,0,0.1)}.play;

// On peut maintenant réaliser un exemple qui permet d'entendre les problèmes de phases:

({
	SinOsc.ar(440,0,0.1) + SinOsc.ar(440,3.14,0.1)
}.play;
)

// Si vous n'entendez rien, c'est normal : 2 Sinus en opposition de phase -> zéro sur toute la ligne -> silence

// Il y a plusieurs types d'oscillateurs (Saw, Pulse, ...) ou de source de bruits (LFNoise, WhiteNoise) et plein d'autres curiosités que vous pouvez explorer (les différentes UGens) dans la documentation

{Saw.ar(440, 0.1)}.play;

{Pulse.ar(440, 0.1, 0.1)}.play;
{Pulse.ar(440, 0.5, 0.1)}.play;
{Pulse.ar(440, 0.9, 0.1)}.play;

{LFNoise0.ar(1000, 0.1)}.play;

{WhiteNoise.ar(0.1)}.play;

// On peut évidemment additionner des signaux différents :

{LFNoise0.ar(400, 0.1) + SinOsc.ar(660,0,0.1)}.play;

/* Quand vous ne connaissez pas une fonction et/ou ses arguments
vous pouvez obtenir de l'aide en sélectionnant la fonction et ensuite : "Cmd-d"
Essayez sur la fonction LFNoise0 ci-dessus ...
Vous verrez alors dans la fenêtre en haut à droite 'Help browser' l'aide sur cette fonction s'afficher
*/

// Il est parfois utile de visualiser l'onde sonore, pour ce faire utilisez le .scope à la place du .play
// Cliquez deux fois sur la première parenthèse et
// Pressez ensuite Shift + return :

( {
   SinOsc.ar(440,0 , 0.1)
  }.scope;
)


// Pour obtenir un analyseur de fréquence (FFT) temps réel exécutez cette ligne :

FreqScope.new;

// Les deux fenêtres 'Stethoscope' et 'Frequ analyser' sont complémentaires

// Sans fermer la fenêtre du FreqScope, réessayer l'addition suivante :

( {
	SinOsc.ar(440,0,0.1) + SinOsc.ar(440,3.14,0.1)
 }.play;
)

// récupérez la fenêtre si elle est cachée et visualisez,
// qu'à cause de l'imprécision sur pi, qu'il n'y a pas que du silence !


/* Pour programmer des synthétiseurs "proprement", on peut utiliser des variables. La notion de variable est très importante dans SC. Comme dans tous les langages on doit différencier variable globale et variable locale. Les lettres de a à z sont réservées pour servir de variable globales.
*/

/* Par exemple, on va souvent démarrer le serveur d'une manière différente (par rapport à ce qu'on a fait plus haut) : en assignant l'instance du serveur à une variable globale s qui sera utilisée plus loin dans certains synthétiseurs) : */

s=Server.local;
Server.default=s;
s.boot;

// La variable 's' est habituellement réservée pour stocker l'instance du serveur
// Vous pouvez exécuter ces 3 lignes mais comme le serveur est déjà démarré, ça ne servira à rien ...

// Vous remarquerez que lorsqu'on a plusieurs lignes de commandes on termine une ligne par ';'
// Nous avions déjà pris l'habitude depuis le début, même avec une seule ligne de mettre systématiquement ce ';'

/* On peut déclarer des variables locales (qui ne seront accessibles qu'à l'intérieur des parenthèses) en utilisant le mot clé : var
Pour assigner une variable (lui doner une valeur) on écrit le nom de la variable = la valeur à lui attribuer */

(
var number;   // déclaration de la variable
number = 2;   // assignation de la variable
number.cubed; // calcul du cube de la variable (et affichage dans la 'Post window'
)

number;

// Si vous exécutez les trois premières lignes, vous voyez 8 (3 au cube) apparaitre dans la Post window

// si vous exécutez les quatre lignes vous aurez une erreur car la variable number est locale et donc inconnue en dehors des parenthèses

// Attention le nom d'une variable doit commencer par une minuscule !

/* Pour déclarer une variable globale (autre que a -> z qui sont définies par défaut) il faut faire précéder son nom d'un tilde ~ */

~number = 2;
~number = ~number.cubed + 10 / 3;
~number;

// Attention : vous remarquerez que le résultat est 6 ce qui signifie que le + est réalisé avant le /

// Nous allons pouvoir maintenant créer un son et le stocker dans une variable (x par exemple)

x = {SinOsc.ar()}.play;

x.free;

// Exécuter d'abord la première ligne pour entendre le son
// et ensuite exécuter la seconde ligne pour libérer la mémoire de ce son (et donc ne plus l'entendre)


// Voici un exemple d'un synthétiseur plus complexe réalisé avec des variables (vous comprendrez son fonctionnement plus tard, mais vous pouvez déjà le tester en sélectionnant l'ensemble entre parenthèses et en l'exécutant

(
  {
	var source, randomFrequency, filteredSignal;

	source=WhiteNoise.ar(0.5);
	randomFrequency=LFDNoise3.ar(1, 1000, 2000);
	filteredSignal=LPF.ar(source,randomFrequency,0.1);

	filteredSignal}.scope;
)

// Il est souvent utile pour tester un son de jouer sur plusieurs paramètres en même temps pour écouter le résultat et pouvoir choisir le meilleur réglage
// Pour ce faire, nous pouvons faire appel à du MIDI ou de l'OSC que vous verrons plus tard
// Mais il existe une méthode beaucoup plus simple et immédiate : la souris !
// Il est en effet possible de récupérer la position de la souris en x ey y et de l'utiliser comme paramètre d'un son
// Essayer d'abord ceci :

(
{
	var mousePosition = MouseX.kr(0.0001, 1, 1);
	var sig = DC.ar(1) * mousePosition;
	Out.ar(0, sig);
}.scope;
)

// Vous voyez sur l'oscillo le signal monter et descendre en fonction de la position horizontale de la souris
// On utilise la fonction MouseX qui récupère la position de la souris en X, qui la "rescale" entre 1 et 100.000 de manière exponentielle (dernier paramètre = 1)
// On multiplie ensuite cette valeur avec un générateur de signal continu (DC) pour pouvoir l'afficher sur l'oscillo

// Dans l'exemple suivant on utilise les positions en X et Y pour modifier le comportement du Synthé et obtenir une sorte de Theremin :

(
{
	var freq = MouseX.kr(200, 1000, 1);
	var amp = MouseY.kr(0.1, 0.9, 1);
	var sig = SinOsc.ar(freq, 0, amp);
	Out.ar(0, sig);
}.play;
)

// Pour écrire des choses plus complexes, nous allons définir des synthétiseurs et les stocker dans des variables ('a', par exemple)

a = {SinOsc.ar(440)*0.1}.play;

// puis l'arrêter :

a.run(false);

// ensuite le ré-exécuter :

a.run;

// et finalement les détruire quand on n'en a plus besoin (libérer la mémoire) :

a.free;

// Attention essayer d'exécuter une à une les lignes suivantes :

a = {SinOsc.ar(440) * 0.1};

a.play;

a.free;

// Le 'free' semble ne pas fonctionner ... en fait vous libérer la mémoire correspondant à la variable 'a' qui contient la fonction {SinOsc.ar(440)*0.1} et pas le générateur de son (a.play)
// Vous auriez du faire ceci pour que ça fonctionne :

a = {SinOsc.ar(440) * 0.1}

a = a.play;

a.free;

// A ce stade du cours il est important de bien comprendre ce qu'est un UGen

/* Les Ugens (Unit Generators) représentent des opérations sur des signaux, ce sont les blocs de base des synthétiseurs du serveur SC. Ils sont utilisés pour generer or traiter des signaux audios ou des signaux de contrôle */

/* Tous les UGens répondent à une ou plusieurs des méthodes suivantes :
ar(arg1, arg2, ... ), kr(arg1, arg2, ... ) ou ir(arg1, arg2, ... )
respectivement pour AudioRate (ar), KontrolRate(kr) et InitialisationRate (ir)
*/

// ar sort des valeurs au Sample Rate : 44.100 fois par seconde si votre carte audio est configurée en 44.1kHz. Si vous voulez entendre un UGen, c'est 'ar' que vous devez choisir

{SinOsc.ar()}.play;

// par défaut kr sort une valeur toutes les 64 valeurs de ar ... ce qui signifie qu'un kr consomme beaucoup moins de ressource CPU qu'un ar
// On les utilisera (les kr) en général pour contrôler des paramètres d'autres UGen
// Exécutez par exemple :

{Line.kr(1, 0, 5)}.play;

// qui permet de générer une rampe (un signal qui va de 1 à 0 en 5 secondes)

// On n'entend rien ! N'est-ce pas ?

// Par contre la ligne suivante est très audibles, elle, puisque ce n'est pas le kr mais bien le ar qui génère le son joué (play). Le kr ne fait que contrôler le volume du son (volume max à zéro en 5 secondes) !

{SinOsc.ar(800, 0, Line.kr(1, 0, 5))}.play;

// On aurait pu écrire la même chose avec un ar à la place du kr :

{SinOsc.ar(800, 0, Line.ar(1, 0, 5))}.play;

// Mais si vous écoutez les deux versions, on n'entend pas de différence, le paramètre varie 64 fois moins vite avec le kr mais notre oreille n'est pas capable de détecter cette "approximation"
// Et comme le kr consomme moins de processeur, on le préférera toujours comme contrôleur de paramètres

// Les ir ne génère pas de valeurs en continu, ils calculent une seula valeur au moment où le synthétiseur est instancié ... comme son nom l'indique pour initialiser une valeur ... c'est celui que nous utiliserons le moins, nous reviendrons plus loin dessus

// Revenons à nos UGens de base et essayons de comprendre comment les utiliser
// Commençons par SinOsc
// Cliquez sur SinOsc de la ligne suivante et faites un cmd-D pour accéder à l'aide

SinOsc

// Vous pouvez lire dans la fenêtre 'Help browser' que cet UGen génère une sinusoïde, peut être utilisée avec les méthodes ar et kr et possède 4 arguments (ou paramètres) qui ont des valeurs par défaut (après les ':')
// Par exemple le premier paramètre 'freq' a comme valeur par défaut 440
// Concrètement les lignes suivantes sont équivalentes puisque nous utilisons les arguments par défaut

{SinOsc.ar(440, 0, 1, 0)}.play;

{SinOsc.ar(440)}.play;

{SinOsc.ar(440, 0, 1)}.play;

{SinOsc.ar(440, mul:1)}.play;

{SinOsc.ar()}.play;

// Vous remarquerez aussi à la fin de l'aide (fenêtre Help browser) qu'il y a des exemples qui peuvent être copié et même directement écouté en faisant une sélection + SHIFT-ENTER

// Pour aténuer le son on peut donc procéder de deux façons :

{SinOsc.ar(440, mul:0.125)}.play;

{SinOsc.ar(440) * 0.125}.play;

// Nous avons vu les variables plus haut, nous pourrions donc écrire :

(
a = {
	var freq=440;
	SinOsc.ar(freq) * 0.1
}.play;
)

// Les arguments sont plus intéressants (dans certains cas) que les variables, car ils peuvent prendre des valeurs différentes qui influencent alors un UGen
// Par exemple, pour changer la fréquence d'un oscillateur on utilise le mot-clé "arg" pour définir un argument :
(
a = {
	arg freq=440;
	SinOsc.ar(freq) * 0.1
}.play;
)

// Ne coupez pas le son !!!!!!! Essayez de modifier l'argument "Freq" pendant l'exécution du son :

a.set(\freq, 220);

// Puis avec :

a.set(\freq, 880);

// Arrêtez le son et libérez la mémoire avec :

a.free;

// Pour modifier aléatoirement un paramètre, on utilise un random (fonction rrand), commençons par exécuter le code suivant :

(
a = {
	arg freq=440;
	SinOsc.ar(freq) * 0.1
}.play
)

/* et ensuite modifions aléatoirement l'argument 'Freq' avec un rrand(220,880) qui donne une valeur aléatoire entre 220 et 880 : */

a.set(\freq, rrand(220,880) );

// Vous pouvez exécuter plusieurs fois de suite cette commande pour entendre les changements de fréquence, ensuite libérez la mémoire :

a.free;

// Le plus créatif dans la fabrication de synthétiseurs est de modifier les argument à partir d'autres UGens
// Par exemple, si on veut modifier la fréquence de manière linéaire on utilise le XLine (la variante du Line pour les fréquences). Dans notre exemple on ira de 20.000Hz jusque 200Hz en 6 secondes :

({
	SinOsc.ar( XLine.kr(20000, 200, 6), 0, 0.2)
}.play;
)

// Vous pouvez de cette manière, par exemple, vérifier votre BP du casque ou de les "capacités" de votre oreille ...

// On peut aussi utiliser des oscillateurs à basse fréquence comme signal de contrôle, par exemple LFPulse qui est un oscillateur carré (valeur passe de 0 à 1 et 1 à 0 à une fréquence donnée

// On peut l'utiliser comme argument d'un synthétiseur (sur l'amplitude, par exemple) :

({
	SinOsc.ar( 800, 0, LFPulse.kr(0.5))
}.play;
)

// Et de cette façon simuler une sonnerie de réveil électronique

// Exercice : A partir de ce code essayer de faire différents sons : Sonnerie occupée d'un téléphone (ou la sonnerie normale), Bip des feux de signalisation pour les piétons aveugles, une lerte de recul d'un camion ou encore une alarme incendie domestique







// Pour définir un synthétiseur (une espèce de fonction sonore)on utilise le mot clé 'SynthDef' après quoi on définira ce qu'il fait
// Pour exécuter le synthétiseur ainsi défini on utilisera ensuite le mot clé 'Synth'
// Mais commençons par définir un synthétiseur simple :

(
SynthDef.new(\sine, {  //On lui donne d'abord un nom, on aurait pu écrire "sine" à la place de \sine
	    var sig = SinOsc.ar(440,0,0.1);   //puis on définit ce qu'il doit faire
	    Out.ar(0, sig)   //puis on assigne le signal à un bus (ici le bus d'index 0)
	                     //On reparlera de ces bus plus loin
	}).add;                        // et on l'ajoute à la liste des synthétiseur
)
// Vous devez exécuter les lignes du dessus pour créer le synthétiseur (mais vous n'entendez rien , c'est normal)
// Puisqu'il est juste créé et qu'il faut maintenant l'appeler (exécuter) :

Synth(\sine);

// ou encore :

Synth("sine");

// ou encore mieux en l'assignant à une variable :

a=Synth.new(\sine);

// Pour pouvoir plus tard le libérer en faisant un :

a.free;

// Attention à chaque ligne exécutée de Synth, vous créez une instance du synthétiseur

a=Synth.new(\sine);
b=Synth.new(\sine);

// Pour les libérer :

a.free;
b.free;

// Exercice : refaite le Bip des feux de signalisation pour les piétons aveugles avec un SynthDef




// Si vous souhaitez passer des arguments (paramètres) à un synthétiseur :

(
SynthDef.new(\sine, {
		arg freq=440, amp=0.1;
	    var sig = SinOsc.ar(freq, 0, amp);
		Out.ar(0,sig);
	    }
).add;
)

// Pour l'instancier avec les paramètres par défaut:

a = Synth.new("sine");

a.free;

// ou en changeant la valeur des arguments :

a = Synth.new("sine",[\freq,880, \amp, 0.2]);

// Vous remarquerez que les arguments doivent être passés comme second paramètre et spécifiés entre crochets

/* Quelque soit le "constructeur" appelé, une fois le synthétiseur exécuté on peut changer un ou plusieurs paramètres en procédent comme on l'a déjà fait précédemment : */

a.set(\freq, 1000);

a.set(\amp, 0.1, \freq, 180);

a.free;

// Pour l'instant nous avons créé des sons et des synthétiseur "infinis", c'est à dire qu'ils produisent du son pendant une durée infiniment longue, la seule façon de les arrêter ou de les détruire (libérer la mémoire)
// Cet arrêt brutal n'est pas très "musical" et provoque souvent un click, il serait donc intéressant de produire des sons à durée finie qui se termine 'en douceur'
// Pour ce faire nous pouvons utiliser des enveloppes
// Les enveloppes peuvent être appliquée à l'amplitude mais aussi la fréquence, la vitesse de lecture, ...

// Pour générer une enveloppe on peut simplement utiliser un Line (on l'a déjà fait, plus haut, sans appeler cela une enveloppe)
// Et de l'utiliser comme signal de contrôle :

Line.kr(0.1, 0, 1);

// Cette ligne ci-dessus permet de passer de la valeur 0.1 à 0 en 1 seconde
// Si on l'utilise comme étant l'amplitude du signal SinOsc suivant :

{SinOsc.ar(440, 0, Line.kr(0.1, 0, 1))}.play;

// On entend le son s'éteindre en une seconde
// On peut dire que le "Line" permet donc de réaliser une enveloppe élémentaire

/* A la fin du Line, on n'entend plus le son (volume à zéro) cependant il est toujours en train d'être exécuté en mémoire, il faut donc quand même faire un "cmd + shift + ."
Ou alors il faut spécifier que l'oscillateur doit être libéré après un certain temps (doneAction:2, permet de libérer le synthé après la durée du Line) : */

{ SinOsc.ar(440, 0, Line.kr(0.5, 0, 1, doneAction:2) ) }.scope;

// Allez voir la documentation si vous voulez examiner les différentes valeurs que peut prendre "doneAction" et leurs différents effets

// Pour vérifier que votre Synthé a bien été libéré en mémoire vous pouvez afficher la liste des dépendance entre Synthé grâce à la commande :

s.plotTree;

// Après avoir exécuté cette ligne vous verrez apparaitre une nouvelle fenêtre qui visualise les différents synthé présents en mémoire.
// Réexécutez la ligne qui lance le dernier synthé, regardez le apparaitre dans la liste et puis disparaitre après une seconde.

// Si des synthétiseurs sont toujours présents dans la liste et que vous ne pouvez plus les détruire, vous pouvez utiliser la méthode :

s.freeAll;

// Construisons un petit synthétiseur qui va permettre de générer de petites mélodies aléatoires ...
// Pour cela nous allons utiliser ExpRand qui est une fonction qui génère des nombre aléatoires (selon une distribution exponentielle). Ses deux paramètres sont les valeurs min et max générées

ExpRand(30, 500);

// Exemple pour être utilisé comme fréquence (d'où la distribution exponentielle) d'un synthétiseur

// Et pour changer des SinOsc, utilisons une UGen un peu différente : Pulse (regardez dans l'aide ses particularités)

(
{
	var sig, env, freq;
	env = Line.kr(0.5, 0, 1, doneAction:2);
	freq = ExpRand(30, 1000);
	sig = Pulse.ar(freq, mul:env);
}.play
)

// Si vous exécutez ces lignes plusieurs fois de suite et assez rapidement vous obtenez une petite mélodie aléatoire
// Vous pouvez regarder en même temps la fenêtre 'Node Tree' dans laquelle vous voyez les Synthé apparaitre et disparaitre après une seconde d'exécution
// Nous pouvons donc jouer à l'infini sans jamais surcharger la mémoire

// La manière dont le son s'aténue n'est pas très naturelle car linéaire
// Nous préférerons en général utiliser une XLine (courbe exponentielle) qui donnera un résultat plus naturel à l'oreille
// Attention, si la valeur de fin est 0 le synthé ne fonctionnera pas (on ne peut pas passer par zéro pour une exponentielle)
// Vous devez donc spécifier un paramètre très petit proche de zéro mais pas égal à zéro :

XLine.kr(0.5, 0.0001, 1, doneAction:2);

// Ecoutez maintenant le résultat avec le synthé précédent et constatez que le son s'éteind de manière plus naturelle

(
{
	var sig, env, freq;
	env = XLine.kr(0.5, 0.0001, 1, doneAction:2);
	freq = ExpRand(30, 1000);
	sig = Pulse.ar(freq, mul:env);
}.play
)

// Si nous avions utilisé les dB comme unité, nous aurions pu conserver le Line

(
{
	var sig, env, freq;
	env = Line.kr(-6, -40, 1, doneAction:2);
	freq = ExpRand(30, 1000);
	sig = Pulse.ar(freq, mul:env.dbamp);
}.play
)

// Pour faire le sound design d'un jeu dans l'espace, on pourrait aussi jouer sur la fréquence avec le Xline :

(
{
	var sig, env, freq;
	env = Line.kr(-6, -40, 1, doneAction:2);
	freq = XLine.kr(880, 110, 1, doneAction:2);
	sig = Pulse.ar(freq, mul:env.dbamp);
}.play
)

// Mais nous pourrions alors avoir deux doneAction antagonistes, par exemple dans ce cas suivant :

(
{
	var sig, env, freq;
	env = Line.kr(-6, -40, 1, doneAction:2);
	freq = XLine.kr(880, 110, 5, doneAction:2);
	sig = Pulse.ar(freq, mul:env.dbamp);
}.play
)

// quand l'enveloppe a fini après une seconde le synthé s'arrête alors que la descente en fréquence qui dure normalement 5 secondes n'est pas encore terminée
// Il est donc prudent de n'avoir qu'un seul doneAction appliqué à la UGen la plus longue !
// Voir l'illustration de ce principe dans l'exemple suivant :

(
{
	var sig, env, freq;
	env = Line.kr(-6, -40, 5, doneAction:2);
	freq = XLine.kr(880, 110, 2);
	sig = Pulse.ar(freq, mul:env.dbamp);
}.play
)


// Si nous voulons des enveloppes plus complexes nous utiliserons une autre UGen que le Line ou le XLine : la fonction Env
// Pour visualiser cette enveloppe (Env) nous utiliserons la méthode plot :

Env.new.plot;

// Si vous exécutez la ligne précédente vous verrez apparaitre une nouvelle fenêtre avec l'enveloppe par défaut (si aucun paramètre n'est spécifié) triangulaire

/* Pour générer une enveloppe plus personelle nous allons d'abord spécifier les valeurs par lesquelles on veut passer (par exemple 0, 1 et 0) et les spécifier sous forme de tableau (entre crochets) -> [1,0,1] Ensuite il faut spécifier le nombre de secondes entre ces valeurs (par exemple : 1 seconde et puis encore 1 seconde) -> [1, 1]
Pour trois valeurs prises on spécifie donc 2 intervalles de temps*/

Env.new([0, 1, 0],[1, 1]).plot;

// Nous retrouvons avec cet exemple l'enveloppe par défaut
// Changeons donc les paramètres pour obtenir une autre forme
// Par exemple, on passe de 1 à 0 en 1 seconde et ensuite on passe de 0 à 1 en 0.5 secondes :

Env.new([1, 0, 1],[1, 0.5]).plot;

// Pour des sons percussifs, on utilisera plutôt des formes du style :

Env.new([0, 1, 0],[0.05, 0.5]).plot;


// Vous aurez remarqué qu'on ne peut pas "entendre" les enveloppes. Elles ne sont utiles que quand elles sont utilisées, par exemple, sur l'amplitude des oscillateurs
// Mais pour ce faire il faut d'abord la convertir en un signal de contrôle avec la UGen EnvGen.kr

EnvGen.kr(Env.new([0, 1, 0], [1, 1]), doneAction:2);

// Si vous exécutez la ligne précédente, vous n'entendez évidemment rien
// Par contre si nous la multiplions avec l'amplitude d'un signal sinusoidal :

(
{
	var env, sig;
	env = EnvGen.kr(Env.new(
		[0, 1, 0],
		[1, 1]),
		doneAction:2);
	sig = SinOsc.ar(440, 0, 1) * env;
}.play;
)

// Cela devient audible et intéressant
// Changeons l'oscillateur et l'enveloppe

(
{
	var env, sig;
	env = EnvGen.kr(Env.new(
		[0, 1, 0.2, 0],
		[0.5, 1, 2]),
		doneAction:2);
	sig = Pulse.ar(ExpRand(30, 800)) * env;
}.play;
)

// Essayons ensuite les exemples suivants (essayer d'abord de les comprendre avant de les exécuter) :

{Saw.ar(EnvGen.ar(Env.new([1000,20],[1.0]), doneAction:2), 0.1)}.play;

{Saw.ar(EnvGen.ar(Env.new([10000,20],[0.5]), doneAction:2),EnvGen.ar(Env.new([0.1,0],[2.0])))}.play;

// Nous pouvons également générer des enveloppes non-linéaires grâce au paramètre \exp :

Env.new([0, 1, 0.2, 0], [0.5, 1, 2], \exp).plot;

// Nous avons déjà évoqué plus haut le problème lié aux valeurs 0 avec des fonctions exponentielles
// Nous devons donc transformer les 0 en 0.001, par exemple :

Env.new([0.001, 1, 0.2, 0.001], [0.5, 1, 2], \exp).plot;

// Une autre solution, pour avoir encore plus de flexibilité, utilise un troisième tableau de valeur à la place du \exp :

Env.new([0, 1, 0.2, 0], [0.5, 1, 2], [2, 2, 2]).plot;

// Les trois '2' donne la courbure de chacun des segments de l'enveloppe, essayons avec des plus grands nombre et visualisons le résultat:

Env.new([0, 1, 0.2, 0], [0.5, 1, 2], [9, 9, 9]).plot;

// Comparer les courbes obtenues et vérifiez que si on avait mis des zéros, on aurait eu des droites :

Env.new([0, 1, 0.2, 0], [0.5, 1, 2], [0, 0, 0]).plot;

// On peut aussi avoir des valeurs négatives, par exemple :

Env.new([0, 1, 0.2, 0], [0.5, 1, 2], [-5, 9, -19]).plot;

// Vous voyez maintenant toute la souplesse et la multiplicité des possibilité de la fonction Env
// Vous pouvez écouter le résultat que provoque cette enveloppe dans le son précédent :

(
{
	var env, sig;
	env = EnvGen.kr(Env.new(
		[0, 1, 0.2, 0],
		[0.5, 1, 2],
		[-5, 9, -19],
		doneAction:2));
	sig = Pulse.ar(ExpRand(30, 800)) * env;
}.play;
)

// Quand nous avons des enveloppes de durée fixe (ce qui est notre cas, pour l'instant) on peut également utiliser le paramètre 'gate' qui va permettre de faire un reset de l'enveloppe

(
x = {
	arg gate = 0;
	var env, sig;
	env = EnvGen.kr(Env.new(
		[0, 1, 0.2, 0],
		[0.5, 1, 2],
		[-5, 9, -19]), gate);
	sig = Pulse.ar(ExpRand(30, 800)) * env;
}.play;
)

// Si vous lancez le synthé précédent il ne se passe rien car la valeur de gate est à zéro
// Pour trigger le synthé il faut mettre sa valeur à '1' avec l'instruction :

x.set(\gate, 1);

// Vous pouvez entendre maintenant le son mais si vous réexécutez cette ligne plusieurs fois, le son ne se relance pas
// C'est à cause du fait que le trigger ne fait son effet qu'au passage d'une valeur non-positive à positive (passage de 0 à 1, par exemple)
// A l'exécution du set gate à 1 ... il reste à 1 et ne trigge plus le synthé !
// Il faut donc remettre la valeur à 0 puis ensuite à 1 :

x.set(\gate, 0);

x.set(\gate, 1);

// C'est un peu laborieux ! C'est pour cette raison que SC propose des variables particulières qui ont un nom qui débute pat 't_' et qui ont comme particularité de revenir à 0 quand elles ont été assignée à 1

(
x = {
	arg t_gate = 0;
	var env, sig;
	env = EnvGen.kr(Env.new(
		[0, 1, 0.2, 0],
		[0.5, 1, 2],
		[-5, 9, -19]), t_gate);
	sig = Pulse.ar(ExpRand(30, 800)) * env;
}.play;
)

// On peut alors exécuter la ligne suivante plusieurs fois de suite sans devoir réinitialiser l'argument à 0 :

x.set(\t_gate, 1);

// Si on veut lancer le synthé dès sa création on peut initialiser l'argument à 1 dès sa déclaration :

(
x = {
	arg t_gate = 1;
	var env, sig;
	env = EnvGen.kr(Env.new(
		[0, 1, 0.2, 0],
		[0.5, 1, 2],
		[-5, 9, -19]), t_gate);
	sig = Pulse.ar(ExpRand(30, 800)) * env;
}.play;
)

x.set(\t_gate, 1);

// Si on laisse le doneAction à 2, on pourra re-trigger le synthé tant que l'enveloppe n'est pas terminée, sinon le synthé disparait de la mémoire est n'est plus utilisable ! Essayez sur le synthé suivant :

(
x = {
	arg t_gate = 1;
	var env, sig;
	env = EnvGen.kr(Env.new(
		[0, 1, 0.2, 0],
		[0.5, 1, 2],
		[-5, 9, -19]), t_gate, doneAction:2);
	sig = Pulse.ar(ExpRand(30, 800)) * env;
}.play;
)

x.set(\t_gate, 1);

// En informatique musicale, une enveloppe est souvent caractérisée par les 4 paramètres ADSR (Attack, Decay, Sustain, Release)
// Pour réaliser une Attaque-Délai-Soutien-Relâche complète il suffit, par exemple, de faire  :

Env.new([0, 1, 0.5, 0],[0.01, 0.5, 0.1]).plot;

// Cependant, il existe un UGen plus simple et complet pour obtenir un résultat un peu différent :

Env.adsr(0.01, 0.5, 0.5, 0.1, 1.0, 0).plot;

// Si vous dessinez (plot) les deux lignes précédentes vous verrez la même chose
// Cependant ils ne produisent pas le même résultat dans le EnvGen !
// En effet, le Sustain va maintenir le son à un certain niveau, jusqu'à avoir le gate qui repasse à 0
// Si nous voulons l'utiliser, nous allons donc devoir revenir au gate à la place du t_gate :

(
x = {
	arg gate = 0;
	var env, sig;
	env = EnvGen.kr(
		Env.adsr(0.01, 0.5, 0.5, 0.1, 1.0, 0), gate);
	sig = Pulse.ar(ExpRand(30, 800)) * env;
}.play;
)

x.set(\gate, 1);

// Exécuter d'abord la ligne du dessus (comme si vous enfonciez - attack une touche d'un clavier)
// Exécuter ensuite la ligne du dessous (comme si vous relachiez - release la touche du clavier)

x.set(\gate, 0);

// Dans le même genre que l'ADSR, il y a d'autres enveloppes "prédéfinies" comme par exemple 'perc' (pour des sons percussifs) :

Env.perc(0.05, 0.1, 1.0, -4).plot;

// Utilisée dans un synthétiseur, ça donnerait :

(
x = {
	arg t_gate = 0;
	var env, sig;
	env = EnvGen.kr(Env.perc(0.05, 0.1, 1.0, -4), t_gate);
	sig = PinkNoise.ar() * env;
}.play;
)

x.set(\t_gate, 1);


// Pour varier les plaisirs vous pouvez explorer d'autres Oscillateurs : Saw, Blip, ...

{ Blip.ar(200, 3, 0.2) }.play;

{ Blip.ar(200, Line.kr(1, 100, 20), 0.2) }.play;

// ou d'autres sources de bruit : PinkNoise, LFNoise0 :


// Mettre ici quelques exemples et exercices


/* Vous n'êtes pas encore sourd de l'oreille gauche ?
Vous avez en effet sans doute remarqué que les sons n'étaient audibles que d'un seul côté ! */

// On peut visualiser l'utilisation des canaux d'entrées/sorties en utilisant :

s.meter;

// On peut également utiliser le raccourci cmd-m

// Si vous relancez un synthétiseur vous verrez le son sortir par le canal 0, c'est-à-dire le canal gauche

// Pour envoyer différents sons dans plusieurs canaux on peut, par exemple, créer un tableau (netre crochets) de UGens :

{ [ SinOsc.ar(400, 0, 0.1), SinOsc.ar(600, 0, 0.1) ] }.play;

// Le premier élément du tableau est lu dans le premier canal audio, et ainsi de suite ...

// On peut écrire cela plus rapidement en utilisant SinOsc avec deux paramètres de fréquences spécifiés sous forme de tableau (gauche à 400Hz et droite à 600Hz) :

{SinOsc.ar([400, 660], 0, 0.1)}.play;

// Voilà l'équilibre enfin rétabli entre vos deux oreilles !

// Le système de SC est très bien pensé car si vous générez deux UGens différentes sur deux canaux et que vous utilisez une opérations mathématique entre ces deux tableaux de UGens, il fera l'opération canal par canal, ce qui permet des écritures relativement simplifiées :

(
x = {
	var amp = SinOsc.kr([7, 1]);
	var sig = SinOsc.ar([300, 500]);
	sig = sig * amp;
}.play
)

x.free;

// Il est évident que si nous augmentons le nombres de canaux nous ne pourrons pas entendre les supplémentaires (à moins que vous n'ayez une installation 5.1 ou octophonique)
// Ces quelques lignes ne devrait donc rien apporter auditivement alors que sur les dBMeter on voit clairement que 5 canaux sont utilisés :

(
x = {
	var amp = SinOsc.kr([7, 1, 3, 10, 0.5]);
	var sig = SinOsc.ar([300, 500, 50, 400, 800]);
	sig = sig * amp;
}.play
)

s.meter;

x.free;

// On pourrait rassembler tous les canaux dans un seul canal (0, par défaut) en faisant un Mix et créer ainsi de nouveaux sons très texturés (avec des harmoniques)

(
x = {
	var amp = SinOsc.kr([7, 1, 3, 10, 0.5]);
	var sig = SinOsc.ar([300, 500, 50, 400, 800]);
	sig = sig * amp;
	Mix.new(sig) * 0.2;
}.play
)

x.free;

// Pour dupliquer des signaux on utilise la fonction dup, elle permet par exemple de dupliquer un signal dans plusieurs canaux
// Par exemple, essayez cette ligne très simple et regardez ce que cela produit dans la Post window :

10.dup(3);

// Vous voyez qu'un tableau de trois '10' a été créé.
// Nous pouvons alors nous servir de cette fonction pour écrire :

(
x = {
	var amp = SinOsc.kr(10.dup(5));
	var sig = SinOsc.ar(300.dup(5));
	sig = sig * amp;
}.play
)

// Ou encore :

(
x = {
	var amp = SinOsc.kr([7, 1, 3, 10, 0.5]);
	var sig = SinOsc.ar([300, 500, 50, 400, 800]);
	sig = sig * amp;
	Mix.new(sig).dup(2) * 0.2;
}.play
)

// Une alternative à ce Mix...dup(2) est d'utiliser le Splay qui disperse un tableau de signaux dans le champs stéréophonique (2 canaux) :

(
x = {
	var amp = SinOsc.kr([7, 1, 3, 10, 0.5]);
	var sig = SinOsc.ar([300, 500, 50, 400, 800]);
	sig = sig * amp;
	Splay.ar(sig) * 0.2;
}.play
)


// Mais si vous voulez utiliser dup vous pouvez raccorcir l'écriture avec '!'
// En effet, 3!2 est équivalent à 3.dup(2)
// On gagne en rapidité d'écriture mais on perd en lisibilité du code ...

// Attention à l'endroit où vous faire votre .dup !
// En effet les deux lignes quivantes donnent des résultats différents

x = {PinkNoise.ar(0.3).dup(2)}.play;

x = {PinkNoise.ar(0.3.dup(2))}.play;

// Dans le premier cas on a une instance du bruit dupliqué dans deux canaux
// Dans le second cas on a deux instances de bruit, une dans chaque canal

// Que se passe-t-il quand on duplique la génération d'un nombre aléatoire ?
// Essayez cette ligne et observez le résultat dans la Post window :

rrand(0, 100).dup(5);

// Il génère un nombre aléatoire et la duplique 5 fois dans un tableau, ce qui est logique
// Mais souvent, nous voudrons plutôt créer un tableau de 5 valeurs aléatoirs distinctes
// Pour ce faire nous allons créer une fonction qui crée des valeurs aléatoires (avec les accolades) :

{rrand(0, 100)}

// Et dupliquer son exécution :

{rrand(0, 100)}.dup(5);

// Exécutez plusieurs fois cette ligne et obserez la Post window
// Voilà qui est beaucoup plus intéressant !
// Appliquons cette syntaxe dans un exemple sonore :

(
x = {
	var amp = SinOsc.kr({rrand(0, 10)}.dup(5));
	var sig = SinOsc.ar({exprand(300, 800)}.dup(5));
	sig = sig * amp;
	Mix.new(sig).dup(2) * 0.2;
}.play
)

x.free;

// Exécutez-le plusieurs fois pour entendre les variations à chaque exécution

// Par contre, si vous l'exécutez dans un SynthDef, ça ne fonctionne pas comme on pourrait l'espèrer
// Essayez d'abord le synthé suivant :

(
SynthDef.new(\sine, {
	var sig = SinOsc.ar({exprand(300, 800)}.dup(2) ,0 , 0.2);
	Out.ar(0, sig)
	}).add;
)

x = Synth.new("sine");

// A chaque exécution vous obtenez le même résultat ... pas de changement aléatoire !
// Le problème vient du fait que lorsque vous créez le SynthDef (au moment de la compilation du synthétiseur) la génération aléatoire se fait et ne change plus à l'exécution du synthé (Synth.new)

// La solution se trouve dans la syntaxe : ExpRand avec E majuscule et R majuscule permet de générer des valeurs aléatoires à l'exécution du Synth et pas à sa compilation
// Faites donc bien attention à l'utilisation (ou pas) des majuscules dans exprand

(
SynthDef.new(\sine, {
	var sig = SinOsc.ar({ExpRand(300, 800)}.dup(2) ,0 , 0.2);
	Out.ar(0, sig)
	}).add;
)

x = Synth.new("sine");

// Avec la nouvelle version ci-dessus, faites plusieurs exécutions du Synth et écoutez les fréquences aléatoires générées (toutes différentes)

// Lorsqu'on définit un synthétiseur il faut également gérer dans quel canal doit aller quel signal ...
// Reprenons un exemple déjà vu plus haut :

(
SynthDef.new(\sine, {
	var sig = SinOsc.ar(440, 0, 0.1);
	Out.ar(0, sig)
	}).add;
)

x = Synth.new("sine");

// Si nous voulons mettre du signal à droite (en plus du gauche), il suffit de faire :

(
SynthDef.new(\sine, {
	var sig = SinOsc.ar(440, 0, 0.1);
	[Out.ar(0, sig), Out.ar(1, sig)]
	}).add;
)

x = Synth.new("sine");

// Par contre quand le signal est déjà à la base multi-canaux , on ne spécifie que la première des sorties à partir de la quelle on veut écouter le son multi-canaux

(
SynthDef.new(\sine, {
	var sig = SinOsc.ar(440,0,0.1);
	sig = Splay.ar(sig); // Pour rappel Splay génère un signal stéréo (2 canaux)
	Out.ar(0, sig)
	}).add;
)

x = Synth.new("sine");

// Pour spacialiser le son dans les différentes sorties, on peut aussi utiliser le "pan". Qui permet de doser le volume d'un son monophonique dans chacun des canaux gauche et droit
// Par exemple, pour faire la balance Gauche (-1) / Droite (1) d'un signal mono (bruit blanc) en 5 secondes, on utilise Pan2 avec un Line en paramètre :

{Pan2.ar( WhiteNoise.ar(0.1), Line.kr(-1, 1, 5, doneAction:2)) }.play;


// Les itérations
// Lorqu'on veut dans SC répéter une fonction plusieurs fois on peut avoir recours aux itérateurs
// Par exemple avec la méthode 'do' :

(
[3, 2, 6, 11, 5].do{
	arg item;
	item.postln;
})

/* Pour bien comprendre cet exemple il faut connaitre la notion de tableau (entre crochet) qui a été vue plus haut mais aussi la méthode post qui permet d'envoyer ce qui le précède (souvent à des fin de deboguage) dans la fenêtre de monitoring (Post window). */
// postln fait la même chose mais en plus fait un retour à la ligne)

"Hello World".postln;

//On pourrait également utiliser le pipe (<<) et l'instruction Post :

Post << "Hello World" << nl;

// Mais après cette petite parenthèse, reprenons notre itérateur 'do' et analysons ce qu'on voit dans la Post window
// SC prend chaque élément du tableau à son tour et l'affiche (grâce au postln)

// Si on veut savoir où on en est dans l'itération on peut utiliser l'argument count :

(
[3, 2, 6, 11, 5].do{
	arg item, count;
	count.post;
	" : ".post;
	item.postln;
})

// Dans le cas où on veut assigner des valeurs à un tableau on utilisera plutôt la méthode 'collect' à la place du 'do' après avoir déclaré le tableau avec un Array.newClear(nombre_d_elements);

(
x = Array.newClear(5);

x = x.collect{
	arg item;
	item = rrand(0,10);
}
)

// Il existe beaucoup de raccorcis syntaxiques dont je ne suis pas fan mais les voici au cas où vous si vous les rencontreriez ...

x = [1, 2, 3, 4, 5].collect{
	arg item;
	item.cubed;}

// Peut être raccourcis en :

x = [1, 2, 3, 4, 5].collect(_.cubed);

// Ou encore :

[0, 1, 2, 3, 4, 5].do{
	arg item;
	item.postln;
}

// Qui devient en raccourci :

5.do{
	arg item;
	item.postln;
}

// Comment utiliser les itérateurs avec UGens ?
// Par exemple, pour générer des harmoniques à la fondamentales :

(
SynthDef.new(\organ, {
	var sig = 0;
	[440, 880, 1760].do{
		arg item;
		sig = sig + SinOsc.ar(item, 0, 0.1);
	};
	Out.ar(0, sig);
}).add;
)

x = Synth.new("organ");

// Ce synthé permet donc de générer des sinosoïdes avec 2 harmoniques à 880 et 1760 Hz
// Pour pouvoir changer la note quand on le souhaite on peut le réécrire de cette façon :

(
SynthDef.new(\organ, {
	arg freq = 440;
	var sig = 0;
	[1, 2, 3].do{
		arg item;
		sig = sig + SinOsc.ar(item*freq.dup(2), 0, 0.1);
	};
	Out.ar(0, sig);
}).add;
)

x = Synth.new("organ", [\freq, 440]);
x = Synth.new("organ", [\freq, 60.midicps]);
x = Synth.new("organ", [\freq, 33.midicps]);

// Vous noterez l'utilisation du numéro des notes midi (60 correspond à un DO, 33 à un LA) et de leur conversion en Hz grâce à la méthode .midicps
// Améliorons le synthé avec une enveloppe percussive et un doneAction :

(
SynthDef.new(\organ, {
	arg freq = 440;
	var sig = 0;
	var env = EnvGen.kr(Env.perc(0.01, 1, 1, -2), doneAction:2);
	[1, 2, 3].do{
		arg item;
		sig = sig + SinOsc.ar(item*freq.dup(2), 0, 0.1);
	};
	sig = sig * env;
	Out.ar(0, sig);
}).add;
)

x = Synth.new("organ", [\freq, 24.midicps]);

// Ce qui avec un DO aussi bas ne sonne plus comme un orgue mais plutôt un gros tambour ...

// On peut aussi grâce aux itérateurs générer des accords de plusieurs notes (ici un DO majeur) :

(
[60, 64, 67].do{
	arg midinote;
	Synth.new(\organ, [\freq, midinote.midicps]);
})

// Cette technique de génération d'accord n'est pas optimale car on pourrait avoir de légers décalages entre les différentes notes jouées ...

// Architecture du serveur SC

// Nous aurons besoin des élemnts suivants pour bien comprendre ce qu'il se passe, exécutez donc ces deux lignes suivantes, pour afficher le Node Tree et les niveaux des E/S :

s.plotTree;
s.meter;

// Les trois notions importantes pour comprendre le fonctionnement d'un serveur sont : Node, Bus  et ordre d'exécution

// Pour visualiser le nombre de bus disponibles :

s.options.numAudioBusChannels;
s.options.numInputBusChannels;
s.options.numOutputBusChannels;

// Ces paramètres peuvent être assignés en fonction de votre carte son, par exemple si vous avez 2 entrées et 4 sorties :

s.options.numInputBusChannels = 2;
s.options.numOutputBusChannels = 4;

// Après initialisation, vous devez rebooter le serveur :

s.reboot;

// En général au niveau de l'assignation des bus on conserve la configuration par défaut :
//      de 0 à 7 -> Outputs
//      de 8 à 15 -> Inputs
//      de 16 à 127 -> Bus privés (pour le routage interne des signaux)


// Pour illustrer le fonctionnement des bus, nous allons d'abord créer deux synthétiseurs
// Le premier va créer du son et le second sera un effet

(
SynthDef.new(\sound, {
	arg out;
	var sig;
	sig = SinOsc.ar(440, 0, 0.1);
	Out.ar(out, sig);
}).add;
)

// Vous remarquerez dans ce synthé la sortie qui devra être passée en argument !

(
SynthDef.new(\effect, {
	arg in, out;
	var sig;
	sig = In.ar(in, 1);
	sig = FreeVerb.ar(sig, 0.5, 0.8, 0.1).dup(2);
	Out.ar(out, sig);
}).add;
)

// Vous remarquerez comment on récupère le signal du bus à travers l'instruction In qui prend en paramètre le numéro du bus et le nombre de canaux

// Nous allons maintenant pouvoir d'abord créer l'effet. N'oubliez pas préalablement d'exécuter les deux synthétiseurs définis plus haut avant d'exécuter :

y = Synth.new(\effect, [\in, 16, \out, 0]);

// Vous n'entendez toujours rien puisque le son n'est pas créé et qu'il n'y a donc rien sur le bus 16

// Vous devez donc générer le son sur le bus interne 16

x = Synth.new(\sound, [\out, 16]);

// Si vous libérer le son, vous l'entendrez se couper dans la reverb qui elle reste active.

x.free;

// Il est plus élégant de sauvegarder le bus dans une variable globale (qui porte un nom indiquant la fonction du bus)

~reverbBus = Bus.audio(s, 1);

// Vous voyez dans la Post window que le bus audio est assigné au bus interne 16 (le premier disponible entre 16 et 255) sur 1 canal sur le serveur localhost

// Nous pouvons maintenant appeler nos deux synthé en utilisant la variable globale que nous venons de créer :

y = Synth.new(\effect, [\in, ~reverbBus, \out, 0]);

x = Synth.new(\sound, [\out, ~reverbBus]);

s.freeAll;

// Libérez la mémoire et réexécutez les deux lignes suivantes dans cet ordre :

x = Synth.new(\sound, [\out, ~reverbBus]);

y = Synth.new(\effect, [\in, ~reverbBus, \out, 0]);

// Normalement il n'y a pas de son !
// Cela est du à l'ordre d'exécution
// Regardez dans la fenêtre Node Tree, dans Group1, vous verrez d'abord effect et ensuite sound, ce qui signifie que effect est calculé avant sound et de ce fait on n'entend rien
// Il faut donc toujours faire attention à la manière dont les Nodes sont calculés au sein des Groups
// Un Group est un ensemble ordonné de Nodes
// Un Node au sein d'un Group peut être un Synth, un sous-Group ou une combinaison des deux

// Nous avons déjà vu que lorsqu'on crée un Synth il apparait dans le Node Tree sous forme d'un rectangle blanc au sein d'un Group

// Pour créer un sous-Group dans le Group 1 créé par défaut au démarrage, il suffit de faire :

g = Group.new;

// Vous voyez alors apparaitre un nouveau ractangle gris (un sous-Group) à l'intérieur du Group 1
// Pour libérer la mémoire d'un Group, il suffit de faire comme pour un synthé :

g.free;

// A quoi servent ces Groups ?
// On va pouvoir y mettre des Synth dans un ordre précis (grâce à un paramètre) lors de la création du Synth, par exemple :

x = Synth.new(\sound, [\out, ~reverbBus]);

y = Synth.new(\effect, [\in, ~reverbBus, \out, 0], s, \addToTail);

// Le addToTail ajoute l'effet comme dernier noeud (à la Tail = Queue) et permet donc une exécution logique pour pouvoir écouter notre son dans la reverb

s.freeAll;

// Une autre façon de procéder aurait été d'ajouter la reverb après le Synth (variable x):

x = Synth.new(\sound, [\out, ~reverbBus]);

y = Synth.new(\effect, [\in, ~reverbBus, \out, 0], x, \addAfter);

// Libérons juste le Synth x :

x.free;

// et recréons-le avec une autre méthode que le new :

x = Synth.before(y, \sound, [\out, ~reverbBus]);

// Nous pouvons aller plus loin avec ces groupes, mais pour le montrer nous allons d'abord libérer la mémoire de ce qui y reste :

s.freeAll;

// Ensuite nous allons créer deux variables globales qui contiendront deux sous groupes (un pour le Synth et l'autre pour les effets) :

~synthGroup = Group.new;

~effectGroup = Group.after(~synthGroup);

// Nous allons ensuite affecter les deux synthé précédent à leur groupe respectif :

x = Synth.new(\sound, [\out, ~reverbBus], ~synthGroup);

y = Synth.new(\effect, [\in, ~reverbBus, \out, 0], ~effectGroup);

// Ce qui est intéressant avec cette m'thode, c'est que nous allons pouvoir créer plusieurs synthés dans un seul groupe
// ce qui nous permettra de modifier un paramètre globalement sur tous les synthés d'un même groupe !

// Par exemple, libérons d'abord x :

x.free;

// Créons ensuite un synthé avec un argument :

(
SynthDef.new(\sound, {
	arg out, fundamental=440;
	var sig, freq;
	freq = LFNoise0.kr(3).exprange(fundamental, fundamental*4).round(fundamental);
	sig = SinOsc.ar(freq, 0, 0.1);
	Out.ar(out, sig);
}).add;
)

// Nous allons alors créer 8 instances du même synthé :

8.do{
	Synth.new(\sound, [\fundamental, 440, \out, ~reverbBus], ~synthGroup);
}

// Vous voyez qu'ils apparaissent dans le même groupe dans la fenêtre Node Tree

// Maintenant, si vous faites :

~synthGroup.set(\fundamental, 150);

// Vous entendez que vous pouvez changer un paramètre sur 8 synthé à la fois

// Vous pouvez également libérer en une seule ligne tous les synthés d'un groupe :

~synthGroup.freeAll;



// Les Filtres

// Filtres HPF, BPF, Resonz

{ Resonz.ar(LFNoise0.ar(400),Line.kr(10000, 1000, 10), 0.1)}.scope


// Lançons-nous dans un Sound Design simple
// Essayons de reproduire le bruit du vent d'une tempête
// On peut partir d'un bruit blanc

{WhiteNoise.ar(1), 1000)}.play;

// Et ensuite lui appliquer un filtre passe bas (LPF) :

(
{LPF.ar(WhiteNoise.ar(1), 1000)}.play;
)

// où 1000 est en Hz la fréquence de coupure

/* Pour avoir une meilleure simulation, il serait intéressant de faire varier légèrement la fréquence de coupure. Essayons alors de générer une rampe linéaire pour aller de 1000 à 3500 en 5 secondes avec : */

Line.ar(1000, 3500, 5);

// intégrée dans le filtre qui agit sur un bruit blanc :

{LPF.ar(WhiteNoise.ar(0.5), Line.ar(1000, 3500, 5))}.play;

/* C'est déjà plus intéressant mais la modification devrait fluctuer continuellement
On va alors plutôt utiliser un oscillateur lent en triangle (LFTri) : */

{LPF.ar(WhiteNoise.ar(0.5), LFTri.ar(0.2, 0, 1000, 2000))}.play;

// Le résultat est encore meilleur avec de l'aléatoire LFDNoise3

{LPF.ar(WhiteNoise.ar(0.5), LFDNoise3.ar(1, 1000, 2000))}.play;




// Les Reverbs







// Après la synthèse soustractive et la génération d'enveloppe, nous allons générer des sons en modulation de fréquence (FM) !!!??????????????? Ici c'est l'amplitude qui est modulée et la la fréquence !!!???? :

({
SinOsc.ar(
	SinOsc.ar(10,0,10,440),
	0.0,
	EnvGen.kr(Env([0.5,0.0],[1.0]), doneAction:2)
	)
}.scope
)






// Les Buffers

// Contrairement aux UGnes vues précédemment qui génère su son à partir de calculs (Sinusoïdes, Bruits, Triables, Scies, ...) les Buffers vont contenir des échantillons de sons

// ces échantillons peuvent provenir d'un enregistrement micro (Line In) ou d'un fichier WAV, AIFF, ...

/* Pour construire un buffer b auquel on assigne un fichier wav ou aiff (le répertoire 'sounds' avec les sons d'exemple doit se trouver dans le répertoire supercollider) */

// Pour aller chercher un fichier dans le répertoire dans lequel se trouve votre fichier .scd, vous pouvez faire :

b = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "Sounds/a11wlk01.wav");

// Vous pouvez aussi essayer de simplement faire un drag and drop depuis le Finder/Explorer ... ça fonctionne très bien !

// Nous pouvons ensuite, pour vérifier que le son est bien chargé, lire le Buffer simplement avec :

b.play;

// Nous pouvons évidemment libérer le Buffer après son utilisation :

b.free;

// Nous aurions aussi pu conserver l'allocation mémoire réservée au son mais remttre tous les samples à zéro (il faut d'abord recréer le Buffer) :

b = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "Sounds/a11wlk01.wav");

b.play;

b.zero;

b.play;

// Pour effacer tous les Buffers en une seule ligne :

Buffer.freeAll;

// Quand vous créeez un Buffer il contient un certain nombre de Frames, pour connaitre ce nombre :

b.numFrames;

// Et aussi un certain nombre de Channel :

b.numChannels;

// Dans notre exemple, on a 1 Channel et 188.893 Frames et donc le même nombre de Samples

// essayons avec le son suivant :

c = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "Sounds/Loop.wav");

c.play;

c.numFrames;

c.numChannels;

c.duration;

// Cette dernière ligne c.duration nous donne la durée du son : 12.972970521542 secondes dans notre exemple

// tandis que sampleRate nous donne le taux d'échantillonage :

c.sampleRate;

// Comme notre son est échatilloné à 44.110 samples/canal (ou frames) par secondes on devrait donc avoir au total 12.972970521542 * 44.110 = 572.108

// Et c'est exactement ce nombre que l'on obtient avec :

c.numFrames;

// Dans ce cas-ci nous avons donc 572.108 Frames sur deux canaux ce qui fait un total de 2 x 572.108 samples (ou échantillons) soit 1.144.216 samples

// Le nombre de samples est toujours égal au nombre de frames x le nombre de canaux

// Comme nous sommes ici en présence d'un son stéréo, on aurait pu vouloir ne charger dans le Buffer qu'un seul canal (Gauche par exemple), on aurait alors utilisé la méthode :

c = Buffer.readChannel(s, thisProcess.nowExecutingPath.dirname +/+ "Sounds/Loop.wav", channels:[0]);

c.play;

// Chaque Buffer est associé à un numéro de Buffer :

c.bufnum;

// Ce numéro (identifiant) est créé par SC au chargement du Buffer

// pour obtenir toutes ces infos en une fois, on peut faire un :

c.query;

// Si je ne désire pas utiliser la totalité d'un fichier WAV il est préférable de ne charger dans le Buffer que la partie utile (pour ne pas surcharger la mémoire inutilement) :

c = Buffer.readChannel(s, thisProcess.nowExecutingPath.dirname +/+ "Sounds/Loop.wav", 0, 44100);

// '0' indique qu'on prend les Frames à partir de la première (indice 0) jusqu'à la 44100ème Frame ... soit au total une seconde de son :

c.play;

// Exercice : Charger la dernière demi-seconde du fichier Loop.wav


// Pour charger plusieurs fichiers sons rapidement, on peut utiliser la méthode suivante ...

// D'abord créer un tableau qui contiendra les Buffers

~musicBox = Array.new;

// Ensuite créer un Path vers le répertoire qui contient les samples à charger dans les Buffers

~sampleFolder = PathName.new(thisProcess.nowExecutingPath.dirname +/+ "Sounds/MusicBox/");

// Regardez si vous obtenez bien la liste des samples avec cette instruction :

~sampleFolder.entries;

// Nous puvons maintenant itérer sur ce tableau de nom de fichiers :

(
~sampleFolder.entries.do({
	arg path;
	path.postln;
	~musicBox = ~musicBox.add(Buffer.read(s, path.fullPath));
});
)

// Vérifiez que notre musicBox est bien remplie de samples :

~musicBox;

// Et ensuite essayons de jouer quelques samples du tableau :

~musicBox.at(0).play;
~musicBox.at(3).play;
~musicBox.at(5).play;
~musicBox.at(7).play;

// Ou encore avec la syntaxe simplifiée :

~musicBox[9].play;

// Attention le nombre de Buffer est limité :

s.options.numBuffers;

// à 1024 comme vous pouvez le voir dans la Post window

// Si on veut jouer un peu avec les Buffers on va utiliser essentiellement les deux UGnes : PlayBuf (PlayBuffer) et BufRd (BufferRead)

// Commencons à créer un Synth à partir de PlayBuf :

(
SynthDef.new(\wavPlayer, {
	arg amp=1, out=0, bufNumber=0, rate=1;
	var sig;
	sig = PlayBuf.ar(1, bufNumber, rate, doneAction:2);
	sig = sig * amp;
	Out.ar(out, sig.dup(2));
	}).add;
)

x = Synth.new(\wavPlayer, [\bufNumber, 0]);

// On peut changer le playback Rate, ce qui permettra par exemple de lire les échantillons deux fois plus vite :

x = Synth.new(\wavPlayer, [\bufNumber, 0, \rate, 2]);

// Ou cinq fois plus lentement :

x = Synth.new(\wavPlayer, [\bufNumber, 0, \rate, 0.2]);

// Vous noterez que cette "vitesse de lecture" affecte le pitch du son

// On aurait un roblème de lecture si le sample rate du fichier et le sample rate du serveur SC étaient différents
// Si cale vous arrivait, sachez qu'il existe une méthode qui résoud ce problème :

sig = PlayBuf.ar(1, bufNumber, BufRateScale.kr(bufNumber) * rate, doneAction:2);

// Nous pouvons ensuite compliquer un peu notre Synth en utilisant un trigger et en permettant le choix de la position de lecture au démarrage :

(
SynthDef.new(\wavPlayer, {
	arg amp=1, out=0, bufNumber=0, t_trig=1, initPos=0, rate=1;
	var sig;
	sig = PlayBuf.ar(1, bufNumber, BufRateScale.kr(bufNumber) * rate, t_trig, initPos, doneAction:2);
	sig = sig * amp;
	Out.ar(out, sig.dup(2));
	}).add;
)

x = Synth.new(\wavPlayer, [\t_trig, 1]);

x = Synth.new(\wavPlayer, [\bufNumber, 0, \rate, 0.5, \initPos, 35000]);

// Ce dernier provoque de léger 'tic' au démarrage ...
// Il serait donc intéressant de lui appliquer une enveloppe :

(
SynthDef.new(\wavPlayer, {
	arg amp=1, out=0, bufNumber=0, t_trig=1, initPos=0, rate=1;
	var sig, env;
	env = EnvGen.kr(Env([0,1],[0.01]));
	sig = PlayBuf.ar(1, bufNumber, BufRateScale.kr(bufNumber) * rate, t_trig, initPos, doneAction:2);
	sig = sig * amp * env;
	Out.ar(out, sig.dup(2));
	}).add;
)

// Vous pouvez maintenant déclencher le son sans le vilain 'tic' au démarrage :

x = Synth.new(\wavPlayer, [\bufNumber, 0, \rate, 0.5, \initPos, 35000]);

x = Synth.new(\wavPlayer, [\bufNumber, 0, \rate, 1, \initPos, 55000]);

// On utilise souvent en sound design les son "à l'envers"
// On peut facilement faire ça ici en commençant la lecture à la fin du son tout en appliquant un playback rate négatif :

x = Synth.new(\wavPlayer, [\bufNumber, 0, \rate, -1, \initPos, 120000]);

x = Synth.new(\wavPlayer, [\bufNumber, 0, \rate, -3, \initPos, 120000]);

// Pour être plus précis et commencer à la toute dernière position du Buffer on écrit :

x = Synth.new(\wavPlayer, [\bufNumber, ~musicBox[0].bufnum, \rate, -1, \initPos, ~musicBox[0].numFrames-2]);

// Pourquoi fait-on moins 2 ?
// numFrames donne le nombre de Frames, comme on commence à l'indice 0, on devrait faire moins 1
// Cependant si on commence la lecture au dernier sample, SC estime que la lecture est terminée et s'arrête (même si le rate est à -1)
// Le truc est donc de le faire commencer un sample avant la fin ... d'où le moins 2

// On utilise souvent des sons qui doivent être bouclés (loop)
// C'est un des arguments de PlayBuf (le doneAction est ignoré si loop=1):

(
SynthDef.new(\wavPlayer, {
	arg amp=1, out=0, bufNumber=0, t_trig=1, initPos=0, rate=1, loop=0;
	var sig, env;
	env = EnvGen.kr(Env([0,1],[0.01]));
	sig = PlayBuf.ar(1, bufNumber, BufRateScale.kr(bufNumber) * rate, t_trig, initPos, loop, doneAction:2);
	sig = sig * amp * env;
	Out.ar(out, sig.dup(2));
	}).add;
)

x = Synth.new(\wavPlayer, [\bufNumber, 0, \rate, 1, \loop, 1]);

// A partir d'ici on pourrait avec un seul son de base créer un Synthé avec plusieurs notes à base de samples
// Il suffit, comme on l'avu plus haut d'accélérer ou décélérer la vitesse de lecture pour avoir d'autres 'pitch'
// Le problème est d'avoir la bonne vitesse pour atteindre la bonne note
// Heureusement SC fournit une fonction qui fait ça ...
// Vous devez donner le nombre de demi-tons à augmenter (positif) ou diminuer (négatif), par exemple pour avoir le bon playback rate pour augmenter notre son de base d'une quinte juste (7 demi-tons) on écrira :

playbackrate = 7.midiratio;

//  Pour avoir le bon playback rate pour diminuer notre son de base d'une octave (12 demi-tons) on écrira :

playbackrate = -12.midiratio;

// Intégré dans notre lecteur, ça donne :

x = Synth.new(\wavPlayer, [\bufNumber, 0, \rate, 7.midiratio]);

x = Synth.new(\wavPlayer, [\bufNumber, 0, \rate, -12.midiratio]);

// Comparer avec l'original pour entendre la quinte et l'octave :

x = Synth.new(\wavPlayer, [\bufNumber, 0, \rate, 1]);

// Assez joué avec PlayBuf, passons au BufRd !
// La construction du Synth est relativement semblable sauf que le BufRd nécessite un paramètre obligatoire qui est le pointeur : le curseur sur le sample qui sera lu ...
// S'il reste constant vous lirez une valeur constante, ce qui au niveau sonore est très ... silencieux !
// Cette valeur doit donc changer à chaque nouveau cycle de calcul
// On va donc, par exemple, changer la valeur du pointeur avec un Line
// Attention, le calcul se fait à chaque cycle, on utilise donc le ar et pas le kr !

(
SynthDef.new(\wavPlayer, {
	arg amp=1, out=0, bufNumber=0 ;
	var sig, pointer;
	pointer = Line.ar(0, BufFrames.kr(bufNumber)-1, BufDur.kr(bufNumber), doneAction:2);
	sig = BufRd.ar(1, bufNumber, pointer);
	sig = sig * amp;
	Out.ar(out, sig.dup(2));
	}).add;
)

x = Synth.new(\wavPlayer, [\bufNumber, 0]);

// On a refait le même synthé que plus haut
// On pourrait aussi l'améliorer en mettant un point de départ et d'arrivée

(
SynthDef.new(\wavPlayer, {
	arg amp=1, out=0, bufNumber=0, start, end;
	var sig, pointer;
	pointer = Line.ar(start, end, BufDur.kr(bufNumber), doneAction:2);
	sig = BufRd.ar(1, bufNumber, pointer);
	sig = sig * amp;
	Out.ar(out, sig.dup(2));
	}).add;
)

x = Synth.new(\wavPlayer, [\bufNumber, ~musicBox[0].bufnum, \start, 0, \end, ~musicBox[0].numFrames-2]);

// Ce qui permet d'avoir rapidement un son à l'envers

x = Synth.new(\wavPlayer, [\bufNumber, ~musicBox[0].bufnum, \start, ~musicBox[0].numFrames-1, \end, 0]);

// Ou n'importe quelle portion à une vitesse pas adaptée mais parfois intéressante au niveau créatif ...

x = Synth.new(\wavPlayer, [\bufNumber, ~musicBox[0].bufnum, \start, 50000, \end, 1000]);

// Si on veut boucler, on va devoir utiliser un Phasor à la place du Line :

(
SynthDef.new(\wavPlayer, {
	arg amp=1, out=0, bufNumber=0, start, end, rate=1;
	var sig, pointer;

	pointer = Phasor.ar(1, rate, start, end);
	sig = BufRd.ar(1, bufNumber, pointer);
	sig = sig * amp;
	Out.ar(out, sig.dup(2));
	}).add;
)

x = Synth.new(\wavPlayer, [\bufNumber, ~musicBox[0].bufnum, \start, 0, \end, ~musicBox[0].numFrames-2]);

x.free;

// Bouclons sur la première seconde :

x = Synth.new(\wavPlayer, [\bufNumber, ~musicBox[0].bufnum, \start, 0, \end, 44100]);

x = Synth.new(\wavPlayer, [\bufNumber, ~musicBox[0].bufnum, \start, 5000, \end, 10000, \rate, 0.1]);

// On peut également à la place de Phasor utiliser Sweep, LFSaw, LFDNoise ou même un SinOsc ...
// Expérimentez-les et choisissez ce qui convient le mieux dans votre projet

// A partir des toutes ces nouvelles infos, on peut réaliser de la synthèse granulaire
// Nous allons d'abord charger un son dans un buffer :

b = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "Sounds/a11wlk01.wav");

//
(
{
var singrain1, singrain2, sfgrain;
singrain1=SinOsc.ar(440,0,XLine.kr(1.0, 0.0001, 0.05));
singrain2=FSinOsc.ar(800, 0.0, Line.kr(1.0,0,0.05).squared);
sfgrain=(PlayBuf.ar(1,b.bufnum, BufRateScale.kr(b.bufnum)))*EnvGen.kr(Env([0,1,1,0],[0.01,0.01,0.01], -4));

[singrain1,singrain2,sfgrain]
}.plot(0.1,s)
)

//simple sine grain synthdef - note the all important doneAction
(
SynthDef(\sinegrain, {arg pan, freq, amp; var grain;

grain= SinOsc.ar(freq, 0, amp)*(XLine.kr(1.001,0.001,0.1,doneAction:2)-0.001);

Out.ar(0,Pan2.ar(grain, pan))}).add;
)

//listen to a single grain;
Synth(\sinegrain,[\freq,rrand(100,10000),\amp, exprand(0.05,0.1), \pan, 1.0.rand2]);

//schedule 100 random grains over 1 second
(
{
100.do{arg i;

	Synth(\sinegrain,[\freq,rrand(100,10000),\amp, exprand(0.05,0.1), \pan, 1.0.rand2]);
	0.01.wait
};
}.fork
)


//schedule 200 random grains over time, decreasing the range of allowed random frequencies and lowering the density over time
(
{
200.do{arg i;
var timeprop = (i/199.0)**3;

	Synth(\sinegrain,[\freq,exprand(100,5000-(20*i)),\amp, exprand(0.05,0.1), \pan, 1.0.rand2]);
	rrand((timeprop*0.1).max(0.01),timeprop*0.3).wait
};
}.fork
)

//simple playbuf grain synthdef - note the all important doneAction
(
SynthDef(\sfgrain, {arg bufnum=0, pan=0.0, startPos=0.0, amp=0.1, dur=0.04;
var grain;

grain= PlayBuf.ar(1,bufnum, BufRateScale.kr(bufnum), 1, BufFrames.ir(bufnum)*startPos, 0)*(EnvGen.kr(Env.perc(0.01,dur),doneAction:2)-0.001);

Out.ar(0,Pan2.ar(grain, pan))}).add;
)


b = Buffer.read(s,thisProcess.nowExecutingPath.dirname +/+ "Sounds/a11wlk01.wav");


//individual grain
Synth(\sfgrain,[\bufnum, b.bufnum, \startPos,rrand(0.0,1.0),\amp, exprand(0.005,0.1), \pan, 1.0.rand2]);


//schedule 200 random soundfile playback grains over time, with random offset positions into the soundfile and lowering the density over time
(
{
200.do{arg i;
var timeprop = (i/199.0)**3;

	Synth(\sfgrain,[\bufnum, b.bufnum, \startPos,rrand(0.0,timeprop),\amp, exprand(0.005,0.1), \pan, 1.0.rand2]);
	rrand((timeprop*0.1).max(0.01),timeprop*0.4).wait
};
}.fork
)



// Les Paterns

// Les Patterns servent essnetiellement à générer des séquences d'événements pour réaliser une boite à rythme ou une séquence mélodique jouée automatiquement

// Créons d'abord un synthétiseur :

(
SynthDef.new(\sound, {
	arg out=0, freq=440;
	var sig, env;
	env = EnvGen.kr(Env([0,1,0], [0.1, 0.3], [1, -1]), doneAction:2);
	sig = SinOsc.ar(freq, 0, 0.5) * env;
	Out.ar(out, sig);
}).add;
)

Synth.new(\sound, [\freq, 440, \out, 0]);

// Nous allons maintenant créer un Pattern avec la fonction Pbind :

(
p = Pbind(
	\type, \note,
	\instrument, \sound).play;
)

// Les arguments de Pbind vont toujours par paires
// On spécifie en général pour commencer le type (ici de type note, qui est la valeur par défaut)
// Puis le synthé (mot clé instrument) qui doit être joué

// Si vous l'exécutez vous devriez entendre une note jouée toute les secondes
// Vous pouvez le visualiser dans :

s.plotTree;

// Et quand vous en avez assez :

p.stop;

// Si vous voulez accélérer (ou ralentir) le 'métronome', il suffit de changer l'argument \dur :

(
p = Pbind(
	\instrument, \sound,
	\dur, 0.2
).play;
)

// La plupart du temps, nous travaillerons plutôt avec des séquences que l'on peut générer avec Pseq
// Par exemple pour lancer le synthé après 0.6s, pui 0.3s, puis 0.3s et puis boucler (inf) :

(
p = Pbind(
	\instrument, \sound,
	\dur, Pseq([0.6, 0.3, 0.3], inf)
).play;
)

// Les musiciens entendront noire, deux croches, ...

// On peut aussi changer la fréquence des notes :

(
p = Pbind(
	\instrument, \sound,
	\dur, Pseq([0.6, 0.3, 0.3], inf),
	\freq, Pseq([440, 220, 220], inf)
).play;
)

// Si on ne met pas les même nombre de valeurs dans chaque tableau, il va y avoir une désynchronisation des notes par rapport au rythme, ce qui peut être intéressant musicalement parlant :

(
p = Pbind(
	\instrument, \sound,
	\dur, Pseq([0.6, 0.3, 0.3], inf),
	\freq, Pseq([440, 220, 220, 880], inf)
).play;
)

// A la place de 'inf' on peut spécifier le nombre exact de répétitions (c'est toujours le plus petit nombre de répétition qui l'emporte en cas de conflit)

(
p = Pbind(
	\instrument, \sound,
	\dur, Pseq([0.6, 0.3, 0.3], 4),
	\freq, Pseq([440, 220, 220, 880], inf).trace
).play;
)

// Notez l'utilisation du 'trace' qui permet de garder une vue (Post window) sur les fréquences jouées ... on l'utilise souvent à des fin de déboguage ...

// Si vous préférez utiliser les note midi plutôt que les fréquences, souvenez-vous de ce qu'on a fait plus haut ...

(
p = Pbind(
	\instrument, \sound,
	\dur, Pseq([0.6, 0.3, 0.3], inf),
	\freq, Pseq([60, 67, 72].midicps, inf)
).play;
)

// Comme on a utilisé le mot clé 'freq' comme argument dans notre synthé, nous pourrions même écrire ceci :

(
p = Pbind(
	\instrument, \sound,
	\dur, Pseq([0.6, 0.3, 0.3], inf),
	\midinote, Pseq([60, 67, 72], inf)
).play;
)

// Et cela sans même avoir défini midinote comme argument dans notre Synth
// SC fait la traduction ... mais uniquement si c'est 'freq' qui est utilisé comme nom d'argument !

// Si on veut jouer de l'aléatoire, on peut changer le Pseq en Pexprand :

(
p = Pbind(
	\instrument, \sound,
	\dur, Pseq([0.6, 0.3, 0.3], inf),
	\freq, Pexprand(50, 4000, inf).trace
).play;
)

// Vous venez de créer votre première oeuvre expérimentale !
// Vous pouvez la rendre encore plus crédible, en multipliant les arguments et l'aléat :

(
SynthDef.new(\sound, {
	arg out=0, freq=440, attack=0.1, release=0.3, amp=1, pan=0;
	var sig, env;
	env = EnvGen.kr(Env([0,1,0], [attack, release], [1, -1]), doneAction:2);
	sig = SinOsc.ar(freq);
	sig = Pan2.ar(sig, pan, amp);
	sig = sig * env ;
	Out.ar(out, sig);
}).add;
)

(
p = Pbind(
	\instrument, \sound,
	\dur, Pwhite(0.4, 0.9, inf),
	\freq, Pexprand(50, 600, inf),
	\attack, Pwhite(2, 3, inf),
	\release, Pwhite(2, 5, inf),
	\amp, Pexprand(0.01, 0.05, inf),
	\pan, Pwhite(-0.9, 0.9, inf)
).play;
)

// Pour l'arrêter gentiment, vous pouvez faire un :

p.stop;

// qui arrête la génération de patterns mais pas le son !

// On peut essayer le suivant qui n'utilise plus frequ mais la combinaison de midinote et harmonic
// Ceci permet de garder des notes chromatiques plutôt que des fréquences totalement aléatoires

(
p = Pbind(
	\instrument, \sound,
	\dur, Pwhite(0.4, 0.9, inf),
	\midinote, 32,
	\harmonic, Pexprand(1,80, inf).round,
	\attack, Pwhite(2, 3, inf),
	\release, Pwhite(2, 5, inf),
	\amp, Pexprand(0.01, 0.05, inf),
	\pan, Pwhite(-0.9, 0.9, inf)
).play;
)

// Le problème avec ce dernier Pbind c'est qu'on génère des fréquences à niveau équivalent
// En général on préfère avoir les fréquences élevées moins fortes en volume
// Il faudrait donc pouvoir lier un paramètre à un autre ... c'est possible avec Pkey qui récupère la valeur générée pour un autre argument
// Ici nous allons récupérer harmonic pour définir amp (après l'avoir ramené dans un range correspondant à amp : en faisant 1/x qui correspond à la méthode reciprocal) :

(
p = Pbind(
	\instrument, \sound,
	\dur, Pwhite(0.4, 0.9, inf),
	\midinote, 32,
	\harmonic, Pexprand(1,80, inf).round,
	\attack, Pwhite(2, 3, inf),
	\release, Pwhite(2, 5, inf),
	\amp, Pkey(\harmonic).reciprocal * 0.5,
	\pan, Pwhite(-0.9, 0.9, inf)
).play;
)

// Pour apporter des modification à un Pattern lorsqu'il est joué, on doit intégrer le Pbind dans un Pdef (un peu comme on le faisait avec les Synth) :

(
Pdef(
	\mySequencer,
	Pbind(
	\instrument, \sound,
	\dur, Pwhite(0.1, 0.4, inf),
	\midinote, 30,
	\harmonic, Pexprand(1,80, inf).round,
	\attack, Pwhite(2, 3, inf),
	\release, Pwhite(2, 5, inf),
	\amp, Pkey(\harmonic).reciprocal * 0.4,
	\pan, Pwhite(-0.9, 0.9, inf)
	);
).play;
)

// Impossible de stoper ce Pdef ... en effet si vous vider la mémoire

s.freeAll;

// Le séqeunceur continue à sévir en envoit encore des sons dans le Node tree ... La seule façon de l'arrêter est de faire un stop :

(
Pdef(
	\mySequencer,
	Pbind(
	\instrument, \sound,
	\dur, Pwhite(0.1, 0.4, inf),
	\midinote, 30,
	\harmonic, Pexprand(1,80, inf).round,
	\attack, Pwhite(2, 3, inf),
	\release, Pwhite(2, 5, inf),
	\amp, Pkey(\harmonic).reciprocal * 0.4,
	\pan, Pwhite(-0.9, 0.9, inf)
	);
).stop;
)

// Nous allons maintenant appliquer cette technique de Pattern à une boite à rythme
// Chargons d'abord quelques samples dans des Buffers :

(
~beatBox = Array.new;
~sampleFolder = PathName.new(thisProcess.nowExecutingPath.dirname +/+ "Sounds/DrDreSampleKit/");
~sampleFolder.entries;
~sampleFolder.entries.do({
	arg path;
	path.postln;
	~beatBox = ~beatBox.add(Buffer.read(s, path.fullPath));
});
)

(
SynthDef.new(\beatPlayer, {
	arg amp=1, out=0, bufNumber=0, t_trig=1, initPos=0, rate=1, loop=0;
	var sig, env;
	env = EnvGen.kr(Env([0,1],[0.01]));
	sig = PlayBuf.ar(1, bufNumber, BufRateScale.kr(bufNumber) * rate, t_trig, initPos, loop, doneAction:2);
	sig = sig * amp * env;
	Out.ar(out, sig.dup(2));
	}).add;
)

// Pour tester si tout est bien chargé, exécutez la ligne suivante en changeant le numéro pour entendre les différents samples :

Synth.new(\beatPlayer, [\bufNumber, 2]);

// Construisons ensuite notre Pbind dans le Pdef :

(
Pdef(
	\myBeatBox,
	Pbind(
		\instrument, \beatPlayer,
		\dur, Pseq([0.1], inf),
		\bufNumber, 2,
		\rate, 1,
		\amp, 0.3
	);
).play;
)

// N'oubliez pas de remplacer le play par le stop pour arrêter le marteau pilon !

(
Pdef(
	\myBeatBox,
	Pbind(
		\instrument, \beatPlayer,
		\dur, Pseq([0.4], inf),
		\bufNumber, Pxrand(~beatBox, inf),
		\rate, 1,
		\amp, 0.3
	);
).play;
//).stop;
)



// OSC
// Pour connaitre le port sur lequel SC écoute :

NetAddr.langPort;

// Pour écouter sur le port par défaut on peut définir un OSC listener de cette façon :

(
OSCdef.new(
	\toggle,
	{
		arg message, time, addr, port;
		[message, time, addr, port].postln;
	},
	'/toggle'
);
)

// Le paramètre qui nous intéresse est le message, nous pouvons donc en général simplifier en :

(
OSCdef.new(
	\toggle,
	{
		arg message, time, addr, port;
		message.postln;
	},
	'/toggle'
);
)

// Et encore plus simplement si on ne veut conserver que la valeur associée au message :

(
OSCdef.new(
	\toggle,
	{
		arg message, time, addr, port;
		message[1].postln;
	},
	'/toggle'
);
)

// Nous pouvons en créer plusieurs pour obtenir différents messages :

(
OSCdef.new(
	\toggle,
	{
		arg message, time, addr, port;
		message[1].postln;
	},
	'/toggle'
);
)

(
OSCdef.new(
	\rotary,
	{
		arg message, time, addr, port;
		message[1].postln;
	},
	'/rotary'
);
)

(
SynthDef.new(\drone, {
	arg freq=40, nharm=10, detune=0.2, gate=0, pan=0, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env.adsr(0.05, 0.1, 0.5, 3), gate);
	sig = Blip.ar(freq * LFNoise1.kr(0.2.dup(16)).bipolar(detune.neg, detune).midiratio, nharm);
	sig = sig * LFNoise1.kr(0.5.dup(16)).exprange(0.1, 1);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)

// Tester d'abord le sythétiseur :

x = Synth.new(\drone, [\gate, 1]);

x.free;

// Nous allons maintenant changer les paramètres du synthé à partir des messages OSC envoyés :

(
OSCdef.new(
	\toggle,
	{
		arg message, time, addr, port;
		message[1].postln;
		x.set(\gate, message[1]);
	},
	'/gate'
);
)

(
OSCdef.new(
	\rotary,
	{
		arg message, time, addr, port;
		message[1].postln;
		x.set(\freq, message[1]);
	},
	'/freq'
);
)

// Ensuite créer le synthé :

x = Synth.new(\drone);

// Vous pouvez maintenant envoyer des messages OSC et vous entendrez votre synthé résonner !


// Avec Reactivision le port par défaut est 3333
// Pour écouter sur ce port on peut définir un OSC listener de cette façon :

thisProcess.openUDPPort(3333); // attempt to open 3333
thisProcess.openPorts; // list all open ports

n = NetAddr.new("127.0.0.1", 3333);


(
OSCdef.new(
	\tuio,
	{
		arg message, time, addr, port=3333;
		[message, time, addr, port].postln;
	},
	'/tuio/2Dobj'
);
)



// Le MIDI

// Pour cmmuniquer avec des périhériques MIDI ou d'autres Synthé MIDI, SuperCollider nécessite un initialisation du MIDI :

MIDIClient.init;

// Après quoi vous verrez apparaitre dans la Post window la liste des canaux MIDI en entrée et en sortie
// Vous pouvez alors vous connecter à celui de votre choix, ou comme moi, ne pas faire votre choix et vous connecter à tous les canaux midi en entrée :

MIDIIn.connectAll;



/* Il est intéressant parfois d'avoir une vue sur l'état des serveurs, vous pouvez ouvrir cette fenêtre en sélectionnant les deux lignes suivantes et pressez Shift + return : */

Server.local.makeWindow;
Server.internal.makeWindow;


// Exemple d'utilisation du micro (In) avec Delay pour faire une Reverb

(
Ndef(\verb, {
var input, output, delrd, sig, deltimes;
// Choose which sort of input you want by (un)commenting these lines:
//input = Pan2.ar(PlayBuf.ar(1, b, loop: 0), -0.5); // buffer playback, panned halfway left
input = SoundIn.ar([0,1]); // TAKE CARE of feedback - use headphones
//input = Dust2.ar([0.1, 0.01]); // Occasional clicks
// Read our 4-channel delayed signals back from the feedback loop
delrd = LocalIn.ar(4);
// This will be our eventual output, which will also be recirculated
output = input + delrd[[0,1]];
// Cross-fertilise the four delay lines with each other:
sig = [output[0]+output[1], output[0]-output[1], delrd[2]+delrd[3], delrd[2]-delrd[3]];
sig = [sig[0]+sig[2], sig[1]+sig[3], sig[0]-sig[2], sig[1]-sig[3]];
// Attenutate the delayed signals so they decay:
sig = sig * [0.4, 0.37, 0.333, 0.3];
// Here we give delay times in milliseconds, convert to seconds,
// then compensate with ControlDur for the one-block delay
// which is always introduced when using the LocalIn/Out fdbk loop
deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
// Apply the delays and send the signals into the feedback loop
LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));
// Now let's hear it:
Out.ar(0, output);
}).play
)

// Très drôle : "http://blog.leapmotion.com/sculpting-sound-real-time-supercollider/"
// "https://forum.openframeworks.cc/t/an-openframeworks-lt-gt-supercollider-connection-solution/12403"

