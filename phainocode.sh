#!/bin/sh
set -e
clear

start(){
	echo -e "Phainocode 4.1\n"
	echo -e "Welcome to Phainocode 4.1 bash implementation (v0.5)!\nSource: https://github.com/Whiletruedoend/phainocode\n\nPlease, choose option:\n"
	echo "1. Encrypt"
	echo "2. Decrypt (NOT YET)"
	echo -e "3. Quit\n"
	
	menu;
}

menu(){
	read -e -p "Enter value [1-3]: " OPTION

	if [[ $OPTION -eq 1 ]]; then
		encryptMenu;
	elif [[ $OPTION -eq 2 ]]; then
		decryptMenu;
	elif [[ $OPTION -eq 3 ]]; then
		exit 0;
	else
		echo "Wrong option value!"
		menu;
	fi
}

finish(){
	CODE="$1"
	read -e -p "Export results into file? [y/N]: " EXPORT
	EXPORT=${EXPORT:-"N"}

	if [[ $EXPORT == "Y" ]] || [[ $EXPORT == "y" ]]; then
		FILE_NAME=`date +"%Y_%m_%d_%H_%M_%S"`
		EXPORT_PATH="$HOME/pcode_$FILE_NAME.txt"
		echo $CODE > $EXPORT_PATH
		echo "Successfully exported to: $EXPORT_PATH"
	fi
	
	read -e -p "Show results? [Y/n]: " SHOW
	SHOW=${SHOW:-"Y"}

	if [[ $SHOW == "y" ]] || [[ $SHOW == "Y" ]]; then
		echo -e "Results:\n"
		echo $CODE
	fi
}

encryptMenu(){
	read -e -p "Read instructions? [y/N]: " INSTRUCTIONS
	INSTRUCTIONS=${INSTRUCTIONS:-"N"}

	if [[ $INSTRUCTIONS == "Y" ]] || [[ $INSTRUCTIONS == "y" ]]; then
		instructions
	fi
	
	NEW_CODE="Phaino 4.1"
	CURRENT_ANSWER=1
	TOTAL_ANSWER_COUNT=72

  #template
	#clear
	#echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	#echo -e "Answer"
  	#EXAMPLE="AnBdfg"
  	#PERMITTED_SYMBOLS="A B C D E G H J L M N O P S T U W a c d e l m n p s u x # 0 @ & ? ~ + - * $ > ! % < = 1 2 3 4 5"
  	#NEW_CODE="$NEW_CODE$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS") "
  	#CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))

  #hobby
	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Choose your hobby (maybe several):
  A - artistic arts;
  B - biology and medicine;
  C - communications;
  D - home economics and construction;
  E - electrical equipment;
  G - graphics;
  H - social manipulation (hacking);
  J - jurisprudence;
  L - linguistics and semiotics;
  M - mathematics and computer science;
  N - exact natural sciences;
  O - exploitation and improvement of the organism;
  P - computer science {PC};
  S - social sciences;
  T - publishing and proofreading {typing};
  U - journalism;
  W - security and military activities;
  a - mechanical engineering {automobile};
  c - commerce;
  d - design;
  e - education;
  l - literature;
  m - music;
  h - philosophy;
  p - policy;
  s - psychology;
  u - cooking;
  x - non-academic sciences and theories {x-science}.\n"

	EXAMPLE="AMPSam"
	PERMITTED_SYMBOLS="A B C D E G H J L M N O P S T U W a c d e l m h n p s u x # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE _$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #birthdate
	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Enter your date of Birth: <n1><n2><n3>
   The <n1> parameter specifies the day as a two-digit number;
   The <n2> parameter specifies the month as a two-digit number;
   The <n3> parameter specifies the year as the last 2 digits in the Gregorian
   lendar. The parameter can be omitted;\n"
  	EXAMPLE="151295"
  	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5 6 7 8 9"
  	NEW_CODE="$NEW_CODE b$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
  	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #gender&sexuality
  	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Enter your gender and sexuality: <l><s>
  The l parameter indicates gender and related characteristics:
    X - female;
    Y - male;
    ' - virginity;
  The parameter s describes the degree of sexuality:
    5 - 'I think only about sex';
    4 - active;
    3 - normal;
    2 - below average;
    1 - 'antisex';\n"
  	EXAMPLE="X'1"
  	PERMITTED_SYMBOLS="X Y ' # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
  	NEW_CODE="$NEW_CODE X$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
  	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #bod
	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Enter your body type: <n><s>
  The parameter n describes the height in cm.
  The parameter s describes the relative nature of the transverse physique: 
    5 - fat;
    4 - thicker than average;
    3 - normal;
    2 - thinner than average;
    1 - thin;\n"
	EXAMPLE="1803"
  	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5 6 7 8 9"
  	NEW_CODE="$NEW_CODE bod$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
  	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #kg
  	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Enter your body weight in kg\n"
	EXAMPLE="85"
  	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5 6 7 8 9"
  	NEW_CODE="$NEW_CODE kg$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
  	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #Har
  	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Enter Hair color and type: <l><s>
  The l parameter describes the color and related characteristics:
    B - black;
    b - brown;
    g - grey;
    l - light;
    r - red;
    w - white;
    \" - wig;
    ' - the hair is artificially dyed;
  The s parameter describes the length/thickness of the hairstyle:
    5 - below the belt;
    4 - from the shoulders to the waist;
    3 - thick hair, but not long;
    2 - short haircut;
    1 - bald or shaved;\n"
	EXAMPLE="r'3"
  	PERMITTED_SYMBOLS="B b g l r w \" ' # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
  	NEW_CODE="$NEW_CODE Har$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
  	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #har
	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Enter your facial vegetation: <s1><s2><s3>
	The s1 parameter describes the beard:
		5 - long beard;
		4 - short beard;
		3 - \"weekly unshaven\";
		2 - \"two days unshaven\";
		1 - clean shaven;
	The s2 parameter describes the mustache:
		3 - \"like a cricket\";
		2 - small;
		1 - clean shaven;
	The s3 parameter describes the sideburns:
		3 - sideways;
		2 - medium;
		1 - absent;\n"
	EXAMPLE="422"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE har$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #eye
  	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Enter your eye color and vision: <l><s>
   The l parameter describes the color of the iris:
    B - black;
    G - green;
    b - brown;
    g - grey;
    l - light-blue;
    r - red;
  The s parameter describes the features of vision:
    5 - \"I see like an eagle\";
    4 - normal;
    3 - \"I don't see very well, but I don't wear glasses or contact lenses\";
    2 - \"I wear contact lenses\";
    1 - \"I wear glasses\";\n"
	EXAMPLE="G/l4"
	PERMITTED_SYMBOLS="B G b g l r # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE eye$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #skn
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Enter your skin color:
    5 - \"negro\";
    4 - swarthy;
    3 - tanned European;
    2 - slightly tanned European;
    1 - \"pale toadstool\";\n"
	EXAMPLE="2"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE skn$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #drs
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Enter clothing type: <s1><s2><s3>
  The s1 parameter describes the preferred clothing style:
    5 - strictly official;
    4 - with a tendency towards formality;
    3 - standard;
    2 - with a tendency to the caller;
    1 - the caller;
  The s2 parameter describes the fashion of the clothes:
    5 - \"according to the last squeak\";
    4 - \"I try to keep up\";
    3 - indifferent;
    2 - with a tendency towards conservatism;
    1 - stubborn conservative;
  The s3 parameter describes the personality of the garment:
    5 - completely individual style;
    4 - \"I try to stick to a certain style\";
    3 - indifferent;
    2 - \"I dress normally\";
    1 - \"I completely blend in with the crowd on the street\";\n"
	EXAMPLE="332"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE drs$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #bad
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Enter bad habits: <s1><s2><s3>
	The s1 parameter describes the consumption of alcoholic beverages:
    5 - a convinced teetotaler;
    4 - only on special days;
    3 - moderate;
    2 - \"I love it more often\";
    1 - \"Nutro demands regularly.\"
  The s2 parameter describes smoking:
    5 - \"I can't stand tobacco smoke organically\";
    4 - \"I do not smoke\";
    3 - occasionally;
    2 - moderate;
    1 - \"This is what my lungs love\";
  The s3 parameter describes the use of other psychoactive substances:
    5 - \"I don't even eat chocolate\";
    4 - \"I do not use\";
    3 - \"I love tonic drinks\";
    2 - \"I play around, sometimes, with easy means\";
    1 - \"This is necessary for me regularly to maintain clarity of mind\";\n"
	EXAMPLE="323"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE bad$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #Hea
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Enter your health condition:
    5 - \"Healthy as a bull\";
    4 - \"I hardly get sick\";
    3 - \"I am sick like everyone else\";
    2 - \"chronicle\";
    1 - \"wreck\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE Hea$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #hea
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude towards the idea of a rational healthy lifestyle:
    5 - an ardent adherent;
    4 - approving;
    3 - indifferent;
    2 - devil-may-care;
    1 - \"It is better to have some fun than torment yourself all your life\";\n"
	EXAMPLE="4~"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE hea$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #sp
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude to physical education:
     5 - professional athlete;
     4 - amateur;
     3 - moderate;
     2 - rarely;
     1 - \"frail\";\n"
	EXAMPLE="3*"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE sp$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #pc
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Enter your role of the computer in life: <n><s1><s2>
  The n parameter indicates the year of starting work with the computer in the 
  form of the last 2 digits.
  The s1 parameter describes the intensity of the session:
    5 - almost round the clock every day;
    4 - a lot;
    3 - moderately;
    2 - rarely;
    1 - extremely rare;
  The s2 parameter describes psychological attachment:
    5 - \"crazy\";
    4 - \"I'm fond of\";
    3 - \"I use it as a familiar tool\";
    2 - \"I use it only when necessary\";
    1 - \"I try not to use\";\n"
	EXAMPLE="084+4"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5 6 7 8 9"
	NEW_CODE="$NEW_CODE pc$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #hw
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Enter your hardware: <s><l>
  The s parameter describes the general modernity of the 
  base part of the computer system you are using as your base:
    5 - \"Just installed the processor announced 2 weeks ago\";
    4 - not older than 2 years;
    3 - typical;
    2 - obsolete;
    1 - \"exhibits of the historical museum\". 
  The l parameter lists the special peripherals with which you have:
    A - Arvid;
    C - CD burner;
    D - DVD burner;
    M - precision input manipulator;
    P - high quality printer;
    S - Sound adapter;
    a - palmtop;
    d - widescreen display;
    f - digital camera;
    l - plotter;
    m - modem;
    n - notebook;
    p - low quality printer;
    s - scanner;
    v - digital video camera;\n"
	EXAMPLE="4Pmns"
	PERMITTED_SYMBOLS="A C D M P S a d f l m n p s v # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE hw$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #Net
	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude towards the main types of computer communications: <s1><s2><s3>
	The s1 parameter describes the attitude towards BBS:
		5 - old sysop / regular;
		4 - approving;
		3 - neutral;
		2 - condemning;
		1 - \"They became extinct in the last century\";
	The s2 parameter describes the relationship to FTN networks:
		5 - seasoned fidoshnik;
		4 - approving;
		3 - neutral;
		2 - condemning;
		1 - \"A bunch of unshaven fidoras\";
	The s3 parameter describes the relationship to the Internet:
		5 - a seasoned Internet user;
		4 - approving;
		3 - neutral;
		2 - condemning;
		1 - \"The World's Dump of Pornography\";\n"
	EXAMPLE="3?5"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE Net$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #net
  	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Used types of computer communications:
    B - BBS;
    F - Fido;
    I - IRC;
    Q - ICQ;
    U - Usenet;
    W - WWW;
    c - HTTP-chats;
    e - e-mail;
    f - small FTN networks;
    p - file-sharing networks {peer-to-peer};
    u - forums;\n"
	EXAMPLE="Wceu&"
	PERMITTED_SYMBOLS="B F I Q U W c e f p u # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE net$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #Int
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "The quality of the Internet access you use:
    5 - dedicated line at home;
    4 - purchased dialup;
    3 - dedicated line at work;
    2 - donated/public/shorthand dialup;
    1 - public places/at a friend's;\n"
	EXAMPLE="5"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE Int$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #com
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "What is most important for you in computer communications:
    5 - communication only;
    4 - communication rather than data (passive information);
    3 - both communication and data;
    2 - data rather than communication;
    1 - data only;\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE com$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #msg
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Frequency of reading network correspondence and sending replies to it:
    5 - every day;
    4 - from 1 to 3 days;
    3 - from 3 to 7 days;
    2 - from 1 to 2 weeks;
    1 - sporadically;\n"
	EXAMPLE="5"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE msg$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #ech
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
    echo -e "How many network echo conferences do you write out approximately:
    5 - > 500;
    4 - 100-500;
    3 - 50-100;
    2 - 10-50;
    1 - < 10;\n"
	EXAMPLE="?"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE ech$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #sl
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude towards computer slang:
    5 - \"IMHO current subject and use it\";
    4 - approving;
    3 - neutral;
    2 - condemning;
    1 - \"Stop mocking the language!\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE sl$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #OS
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Your relation with operating systems: <s1><s2><s3><s4>
  The s1 parameter describes the relation to DOS:
    5 - \"old, but reliable\";
    4 - approving;
    3 - neutral;
    2 - condemning;
    1 - \"dead long ago\".
  The s2 parameter describes the relationship to OS / 2:
    5 - \"the best system\";
    4 - approving;
    3 - neutral;
    2 - condemning;
    1 - \"dead-end invention\";
  The s3 parameter describes the relation to Linux (Unix in general):
    5 - \"system of the future\";
    4 - approving;
    3 - neutral;
    2 - condemning;
    1 - \"inventions of eccentrics\";
  The s4 parameter describes the relation to Windows (all versions):
    5 - \"Of course, but what else?\";
    4 - approving;
    3 - neutral;
    2 - condemning;
    1 - \"Must die!\";\n"
	EXAMPLE="4?41"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE OS$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #os
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Classes of operating systems used:
    D - DOS and Windows 3.x;
    L - Linux;
    N - Novell Netware;
    O - OS / 2;
    T - Windows NT +;
    U - Unix (except Linux);
    W - Windows'95 +;\n"
	EXAMPLE="4?41"
	PERMITTED_SYMBOLS="D L N O T U W # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE os$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #prg
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Enter your programming languages skill: <l1><l2><s>
	The l1 parameter lists the types of programming languages that you speak:
    A is Ada;
    B - Basic;
    C - C ++;
    F - Fortran;
    J - Java;
    K is Cobol;
    P - Pascal;
    R - REXX;
    V - VisualBasic;
    a - Assembler;
    c - C;
    d - Delphi;
    f - Forth;
    l - Lisp;
    o - Prolog;
    r - Perl;
    x - FoxPro;
    y - Python;
  The l2 parameter lists the operating systems under which you program:
    D - DOS и Windows 3.x;
    L - Linux;
    N - Novell Netware;
    O - OS/2;
    T - Windows NT+;
    U - Unix (except Linux);
    W - Windows'95+;
  The s parameter describes the degree of programming skill:
    5 - masterly;
    4 - not bad;
    3 - medium;
    2 - with difficulty;
    1 - theoretical concepts only;\n"
	EXAMPLE="CJcyLW4"
	PERMITTED_SYMBOLS="A B C F J K P R V a c d f l o r x y D L N O T U W # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE prg$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #dem
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude towards demomaking:
    5 - \"I write myself\";
    4 - approving;
    3 - neutral;
    2 - \"Freaks, they have nothing else to do\";
    1 - \"idiocy\";\n"
	EXAMPLE="?"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE dem$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #WWW
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "What web technologies do you own:
    A - ASP;
    C - CSS;
    D - DHTML;
    F - Flash;
    G - CGI;
    H - HTML;
    I - ISAPI;
    J - JavaScript, VBScript, JScript;
    Q - SQL;
    S - SSI;
    V - VBScript;
    W - WAP;
    X - XML;
    a - Java Applets;
    h - PHP;
    j - JSP;
    p - PerlScript;
    u - Push;\n"
	EXAMPLE="QXh"
	PERMITTED_SYMBOLS="A C D F G H I J Q S V W X a h j p u # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE WWW$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #CvP
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "What style of programming languages (C/C ++ or Pascal/Delphi) do you prefer:
    3 - C/C++;
    2 - both equally;
    1 - Pascal/Delphi;\n"
	EXAMPLE="2"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE CvP$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #wrz
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "The size of the available fund of computer information (software,data, 
  digitized data, source codes, etc.):
    5 - gigabytes of \"vares\";
    4 - a lot;
    3 - medium set;
    2 - little;
    1 - \"I try to live at a minimum\";\n"
	EXAMPLE="5"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE wrz$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #hex
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Do you know how to work with programs at an undocumented (machine) level:
    5 - \"I read\" hex \"like a book, crush any protection\";
    4 - quite experienced;
    3 - medium;
    2 - with difficulty;
    1 - \"I can't do it at all\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE hex$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #pol
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Political views:
    5 - anarchist;
    4 - liberal;
    3 - moderate;
    2 - conservative;
    1 - totalitarian;\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE pol$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #ec
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude towards regulation of the economy:
    5 - \"For completely state administration\";
    4 - \"I sympathize with public administration\";
    3 - neutral;
    2 - \"I sympathize with the free market\";
    1 - \"For a completely free market\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE ec$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #Eg
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude towards the idea of equality of people in society:
    5 - \"All are born the same and are worthy of equal rights\";
    4 - \"Good equality allows for exceptions\";
    3 - neutral;
    2 - \"Everyone deserves what he has achieved himself\";
    1 - \"Equality exists only in a herd of sheep\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE Eg$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #pub
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude towards publicity and public availability of information:
    5 - \"Everything must be open\";
    4 - \"It is necessary to secret only when absolutely necessary\";
    3 - neutral;
    2 - \"Freedom of information must be monitored\";
    1 - \"Availability of information leads to trouble\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE pub$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #gov
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude towards the current government:
    5 - an ardent admirer;
    4 - approving;
    3 - neutral;
    2 - condemning;
    1 - \"How long will the people endure?\"\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE gov$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #USA
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Relationship to the United States and North American Culture:
    5 - \"a model for all mankind\";
    4 - \"I kind of sympathize\";
    3 - neutral;
    2 - \"Yankee, go home!\";
    1 - \"Remove this abomination from the face of the planet\";\n"
	EXAMPLE="2"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE USA$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #mil
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitudes towards the existence of universal conscription:
    5 - \"A worthy army can only be created in this way\";
    4 - approving;
    3 - neutral;
    2 - condemning;
    1 - \"a cynical kind of legal slavery\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE mil$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #gun
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude towards the idea of legalizing firearms for self-defense:
    5 - \"like in the Wild West\";
    4 - \"Allow under strict control\";
    3 - \"The society is not ready yet, and then we will see\";
    2 - \"Only employees of organizations at risk\";
    1 - \"In the state of drunkards and psychopaths, everyone will shoot each other\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE gun$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #exe
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude towards the death penalty:
    5 - \"That's right, the freaks must be destroyed\";
    4 - \"Sometimes it is reasonable\";
    3 - neutral;
    2 - condemning;
    1 - \"Murder is never allowed\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE exe$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #sex
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Your attitude to the sexual revolution:
    5 - \"Against this, only physiologically defective\";
    4 - approving;
    3 - neutral;
    2 - condemning;
    1 - \"unhealthy idea of preoccupied libertines\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE sex$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #abo
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude towards abortion:
    5 - \"Parenting must be a licensed profession\";
    4 - approving;
    3 - neutral;
    2 - condemning;
    1 - \"real murder\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE abo$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #god
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitudes towards the participation of religion in society:
    5 - \"Yes, we must all live according to the laws of God\";
    4 - approving;
    3 - neutral;
    2 - condemning;
    1 - \"Tired of these clerics, how long can you cling to the old days?\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE god$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #(c)
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Relationship to copyright:
    5 - \"Without him, no one will create anything\";
    4 - approving;
    3 - neutral;
    2 - condemning;
    1 - \"brake of progress\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE (c)$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #hak
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude towards computer dissidence: <s1><s2>
  The parameter s1 characterizes the attitude towards computer hooligans and virus writes:
    5 - \"Wolf - the orderly of the forest\";
    4 - \"Only the lamer is afraid of them\";
    3 - neutral;
    2 - condemning;
    1 - \"socially dangerous elements\";
  The s2 parameter characterizes the attitude towards computer \"pirates\" and crackers:
    5 - \"monopoly fighters\";
    4 - approving;
    3 - neutral;
    2 - condemning;
    1 - \"commonplace thieves\";\n"
	EXAMPLE="33"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE hak$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #drg
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude towards the idea of drug legalization:
    5 - \"Down with the prohibition that feeds the drug mafia!\";
    4 - approving;
    3 - neutral;
    2 - condemning;
    1 - \"idiotic inventions of drug addicts\";\n"
	EXAMPLE="2"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE drg$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #xsc
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitudes towards unofficial (non-academic) sciences and revolutionary concepts in the official sciences:
    5 - \"Conservatism\" of academics \"inhibits cognition\";
    4 - approving;
    3 - neutral;
    2 - condemning;
    1 - \"There is only one science - official, the rest is charlatanism\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE xsc$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #UFO
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude to the problem of UFOs and extraterrestrial civilizations:
    5 - \"They've been here for a long time\";
    4 - \"Aliens do visit Earth, although their role is often exaggerated\";
    3 - neutral;
    2 - \"Perhaps there is alien life somewhere, but it is very far away and
         not relevant\";
    1 - \"Life on Earth is unique\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE UFO$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #fuk
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude towards obscene language:
    5 - \"Only jerks can't swear\";
    4 - \"a convenient way to express many emotions\";
    3 - neutral;
    2 - \"unless only in extreme cases\";
    1 - \"completely unacceptable for a cultured person\";\n"
	EXAMPLE="2"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE fuk$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #psy
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Personality type, determined by the following empirical test  [Пинт  А.А.
  Самоучитель безопасной езды, практическое пособие. - М.: За  рулём,  1998,
  с. 178]. The test does not pretend to be scientific, but it is convenient 
  in practice for non-specialists. Note also the alternate Psy token described 
  by below. 
  1. Interlace your fingers and notice the hand with the finger on top:
    0 - right;
    1 - left.
  2. Place straightened hands with thumbs spaced apart in front of you so that 
  they form a septum with a gap. Look at a small object through this gap with both eyes. 
  Then, while remaining in the same position, close your right and left eyes alternately. 
  You will only see the object with one eye. Notice this eye: 
    0 - right;
    1 - left.
  3. Interlace your arms over your chest and notice the hand that is on top:
    0 - right;
    1 - left.
  4. Clap your hands and notice the palm on top:
    0 - right;
    1 - left.
  The resulting digits are joined as the digits of a 2-ary number in the order of 1234. 
  Then this number is converted into a hexadecimal representation, in which it is written. 
  Test interpretation:\n"
  	read -p "Press Enter to continue..." value
	clear
	echo -e "Test interpretation: 
    0000 - Orientation to conventional wisdom. Conservatism with the most stable behavior 
               (\"correct\" type). 
    0001 - Insecure conservatism. Weak temperament. Indecision.
    0010 - Strong type who does not perceive the weak. Determination. Feeling
               humor. Energy. A tendency to flirt. Temperament. Artistry.
    0011 - A rare and independent type. High contact, but honey lazy addiction.
    0100 - Business type combining analytical mind and gentleness
                (type of \"business woman\"). Slow addictive. Caution.
                Prudence. Tolerance. Delayed development of relations.
                Some coldness. 
    0101 - Weakest type. Defenselessness. Failure to go into conflict. 
               Exposure to various influences. 
    0110 - Restlessness, frequent emotional hunger. Ability not to create conflicts. 
               Some impermanence. Emotional slowness. Languor. Simplicity. Courage in 
               communication. The ability to switch to a new type of behavior. 
    0111 - Inconsistency and independence. Analyticity combined with
                emotionality.
    1000 - Good adaptability. Emotionality combined with sufficient persistence in 
               strategic matters. High susceptibility to other people's influence. 
               Easy contact with almost all other types. Phlegmatic tendency. 
    1001 - Softness, compliance with careful influence. Requires especially
                careful attitude to yourself (type of \"little queen\").
    1010 - The strongest type, difficult to convince. Perseverance, sometimes turning
               into an obsession with secondary details. Strong personality. 
               The ability to overcome difficulties. Some conservatism due to lack of attention
                to someone else's point of view. Doesn't like infantilism. 
    1011 - Strong, but not obsessive, almost unconvincing. Internal aggressiveness, 
               covered by external softness and emotionality. Fast interaction, but honey
               lingering mutual understanding. 
    1100 - Friendliness and simplicity, some scattered interests.
    1101 - Innocence. Softness. Gullibility. A very rare type.
    1110 - Emotionality combined with determination. The tendency to make ill-considered 
               decisions under the influence of emotions. 
    1111 - The ability to look at things in a new way. The greatest emotionality. Individuality. 
               Selfishness. Stubbornness. The desire for self-defense, sometimes turning into isolation.\n"
	EXAMPLE="0000"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1"
	NEW_CODE="$NEW_CODE psy$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #Psy
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Personality type determined in socionics (analytical psychology C.G. Jung): <l1><l2><l3><l4><l5>
   Work with a token requires special knowledge, or consultation with a specialist,
   therefore, as an alternative convenient in practice for non-specialists,
   you can use the psy token described above.
  The l1 parameter describes introversion / extroversion: 
    I - introvert;
    E - extrovert.
  The l2 parameter describes the sensibility/intuitiveness: 
    S - sensoric;
    N - intuitive.
  The l3 parameter describes consistency/ethics: 
    T - thinking;
    F - feeling;
  The l4 parameter describes rationality/irrationality:
    J - judging (rationality);
    P - perceiving (irrationality);
  The l5 parameter describes your temperament:
    c - choleric;
    f - phlegmatic;
    s - sanguine;
    m - melancholic.\n"
	EXAMPLE="INTJc"
	PERMITTED_SYMBOLS="I E S N T F J P c f s m # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE Psy$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #mus
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude towards music: <l><s>
  The l parameter describes the preferred musical styles:
    c - classical music;
    f - folk music;
    I - instrumental music;
    J - jazz (classical);
    B - blues;
    A - vanguard;
    R - rock;
    M - metal;
    Y - synthesized AY / YM music;
    m - heavy metal;
    p - punk rock (alternative music);
    a - author's song;
    v - popular vocal music;
    d - disco, brit-pop, synth-pop;
    e - electronic classical music;
    r - rap;
    b - breakbeat, jungle, tech-step;
    i - IDM;
    j - jazz (improvisation);
    t - trance, ambient;
    T - techno, minimal;
    h - house, garage, acid jazz;
    H - hardcore, happy hardcore, old school;
    G - gabba, speedcore, noisecor;
  The s parameter describes how often you listen to music:
    5 - constantly;
    4 - often;
    3 - moderately;
    2 - rarely;
    1 - never;\n"
	EXAMPLE="cIRYaet4"
	PERMITTED_SYMBOLS="c f I J B A R M Y m p a v d e r b i j t T h H G # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE mus$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #TV
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Do you often watch TV:
    5 - constantly;
    4 - often;
    3 - moderately;
    2 - rarely;
    1 - never;\n"
	EXAMPLE="2"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE TV$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #gam
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude towards computer games: <l><s>
  The <l> parameter describes the preferred game classes:
    3 - 3D action;
    S - strategic;
    e - economic and strategic;
    i - abstract intellectual;
    q - dialogue (\"quests\");
    s - simulators;
    w - military-strategic {war};
  The s parameter describes how often you play:
    5 - almost round the clock every day;
    4 - a lot;
    3 - moderately;
    2 - rarely;
    1 - never;\n"
	EXAMPLE="3Se3"
	PERMITTED_SYMBOLS="S e i q s w # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE gam$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #RP
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Attitude towards role-playing games:
    5 - \"Without this the world is wretched\";
    4 - approving;
    3 - neutral;
    2 - condemning;
    1 - \"kindergarten\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE RP$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #hum
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "How do you rate your sense of humor:
    5 - big \"hokhmach\";
    4 - \"I like to joke\";
    3 - normal;
    2 - \"I usually don't like it\";
    1 - \"I hate nonsense\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE hum$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #lab
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "How do you assess your performance: <s1><s2><s3><s4><s5>
  The s1 parameter describes the initiative:
    5 - \"easy to climb\";
    4 - high;
    3 - medium;
    2 - low;
    1 - \"hard to climb\";
  The s2 parameter describes hard work on one's own initiative:
    5 - a workaholic;
    4 - quite active;
    3 - average;
    2 - rather lazy;
    1 - a quitter;
  The parameter s3 describes the ability to be hired:
    5 - a workaholic;
    4 - quite active;
    3 - average;
    2 - rather lazy;
    1 - a quitter;
  The s4 parameter describes ingenuity:
    5 - \"generator of ideas\";
    4 - high;
    3 - medium;
    2 - low;
    1 - template;
  The s5 parameter describes conscientiousness:
    5 - a perfectionist;
    4 - high;
    3 - medium;
    2 - low;
    1 - hack;\n"
	EXAMPLE="33333"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE lab$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #lov
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "The nature of sexual activity:
    5 - \"I have a permanent partner\";
    4 - \"mostly with an informal partner\";
    3 - moderate;
    2 - \"Do not mind sometimes flirting\";
    1 - active \"pickup\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE lov$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #lib
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "How often do you read literature: <s1><s2><s3><s4>
  The s1 parameter describes prosaic fiction:
    5 - constantly;
    4 - often;
    3 - moderately;
    2 - rarely;
    1 - never;
  The s2 parameter describes the verses:
    5 - constantly;
    4 - often;
    3 - moderately;
    2 - rarely;
    1 - never;
  The s3 parameter describes popular science literature:
    5 - constantly;
    4 - often;
    3 - moderately;
    2 - rarely;
    1 - never;
  The s4 parameter describes scientific, technical and special literature:
    5 - constantly;
    4 - often;
    3 - moderately;
    2 - rarely;
    1 - never;\n"
	EXAMPLE="2334"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE lib$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #edu
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Education and erudition: <s1><s2>
  Parameter s1 describes formal education:
    5 - scientific degree;
    4 - higher;
    3 - secondary or secondary special;
    2 - incomplete secondary;
    1 - initial.
  Parameter s2 describes one's own assessment of actual education:
    5 - \"walking encyclopedia\";
    4 - quite erudite;
    3 - average;
    2 - below average;
    1 - ignorant.\n"
	EXAMPLE="43"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE edu$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #lng
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Knowledge of foreign languages: <s><l>
  The s parameter describes the knowledge of the English language:
    5 - perfect;
    4 - not bad;
    3 - average;
    2 - at the beginner level;
    1 - \"I don't know\".
  The l parameter describes the knowledge of other foreign languages. Languages are specified in
  as ISO 639 2-letter designators listed alphabetically back to back;\n"
	EXAMPLE="RU4EN3"
	PERMITTED_SYMBOLS="A B C D E F G H I J K L M N O P Q R S T U V W X Y Z # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE lng$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #mth
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Relationship to the exact sciences:
    5 - an ardent adherent;
    4 - \"I respect\";
    3 - neutral;
    2 - \"I do not like\";
    1 - \"I Hate\".\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE mth$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #ph
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Philosophical views:
    5 - a convinced materialist;
    4 - a doubting materialist;
    3 - undecided;
    2 - a fan of mysticism;
    1 - deeply religious.\n"
	EXAMPLE="1"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE ph$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #God
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Religion:
    C - Confucianism;
    b - Buddhism;
    c - Catholicism;
    e - esoteric religious systems;
    i - Hinduism;
    j - Judaism;
    k - Krishnaism;
    m - Islam;
    o - Orthodoxy;
    p - Protestantism;
    n - the latest religious systems;
    l - other local religious systems.\n"
	EXAMPLE="o"
	PERMITTED_SYMBOLS="C b c e i j k m o p n l # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE God$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #co
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Sociability:
    5 - \"I am ready to take part even in an official event\";
    4 - \"I will gladly come to a party, but informal\";
    3 - \"I can meet, but only in a narrow circle\";
    2 - \"I agree to talk by phone\";
    1 - \"I strictly observe virtuality\".\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE co$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #arg
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Your tendency to accept someone else's opinion:
    5 - \"No way!\";
    4 - \"In a dispute, truth is born\";
    3 - neutral;
    2 - \"Better to agree than to persuade\";
    1 - \"Just don't hit me!\"\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE arg$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #hom
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Dwelling and its interior:
    5 - the dwelling of a madman;
    4 - with some non-standard elements;
    3 - standard;
    2 - \"I'm not filling the house alone\";
    1 - \"I have little of my own.\"\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE hom$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #cok
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Do you like to cook:
    3 - \"I'm fond of\";
    2 - \"Moderate\";
    1 - \"I prefer to eat ready-made;\" \n"
	EXAMPLE="2"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE cok$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #veg
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Your attitude towards vegetarianism:
    5 - an old vegetarian;
    4 - Young vegetarian;
    3 - neutral;
    2 - \"You won't last long on a carrot\";
    1 - \"We don't keep the vegetarian one!\"\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE veg$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #drn
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Favorite drinks:
    C - alcoholic cocktails;
    G - carbonated;
    K - jelly;
    b - beer;
    c - non-alcoholic cocktails;
    f - coffee;
    g - cognacs;
    h - chocolat;
    i - infusion;
    j - juices;
    k - kvass;
    l - liqueurs;
    m - dairy;
    o - compotes;
    r - rums;
    s - mineral;
    t - teas;
    v - vodka;
    w - wine;\n"
	EXAMPLE="fhjks"
	PERMITTED_SYMBOLS="C G K b c f g h i j k l m o r s t v w # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE drn$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #pet
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Pets or plants:
     a - amphibians;
     b - birds;
     c - cats;
     d - dogs;
     f - indoor flowers;
     i - invertebrates;
     m - mouses;
     q - aquarium animals;
     r - reptiles;
     v - martens or viverrids.\n"
	EXAMPLE="cdf"
	PERMITTED_SYMBOLS="a b c d f i m q r v # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE pet$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #nat
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Do you often visit nature:
    5 - \"I live constantly\";
    4 - often;
    3 - moderately;
    2 - rarely;
    1 - \"All nature is somewhere outside the window.\"\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE nat$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS");" # <--- add ; at the end
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))

	NEW_CODE="$(clearDelete "$NEW_CODE")"
	finish "$NEW_CODE"
}

checkAnswer() {
  local SUCCESS=false
  until [ $SUCCESS = true ]; do
  	read -e -p "Enter answer [ex. "$1"]: " ANSWER
	local RES="$(containsElement "$ANSWER" "$2")"
	if [[ $RES -eq 1 ]]; then
		SUCCESS=true
		echo "$ANSWER"
	elif [[ $RES -eq 2 ]]; then #skip question
		SUCCESS=true
		echo "^DEL^"
	else
		echo "Wrong value, try again!" >&2
	fi
  done
}

containsElement () {
	local PARAMS=$1
	local FILTER=$2

	local FOUND=0
	
	#skip question
	if [[ $PARAMS == "" ]]; then
        FOUND=2
        echo $FOUND
		return $FOUND
    fi

	for (( i=0; i<${#PARAMS}; i++ )); do
		if [[ $FILTER =~ "${PARAMS:$i:1}" ]]; then
			FOUND=1
		else
			FOUND=0
			return $FOUND
		fi
	done
	echo $FOUND
}

# Removing skipped questions from the answer
clearDelete() {
    CLEAR_STRING=""
	for i in $1; do
        if [[ ! $i =~ "^DEL^" ]]; then
        CLEAR_STRING="$CLEAR_STRING "$i""
        fi
	done
    if [[ ! "${CLEAR_STRING: -1}" == ";" ]]; then
        CLEAR_STRING="$CLEAR_STRING;"
    fi
    echo "$CLEAR_STRING"
}

#NotYet!
decryptMenu(){
	read -e -p "Enter Phainocode: " CODE
	echo -e "Parsing code..."
	CODE="$(parse $CODE)"
	TOKENS_COUNT="999"
	#TOKENS_COUNT=$(parse $CODE)
	#echo $CODE
	#echo $TOKENS_COUNT
	#TOKENS=1 # TODO
	echo -e "$TOKENS_COUNT tokens are found!"

	finish "$CODE"
}

#NotYet!
parse(){
	TOKENS_COUNT=0
	CODE="" # reset old code value
	for token in $@; do
		if [ $token == "Phaino" ] || [ $token == "4.1" ]; then
			continue
		fi
		CODE="${CODE} $(decryptList $token)"
		TOKENS_COUNT=$(( TOKENS_COUNT + 1 ))
		#echo $token
	done
	#CODE="..."
	echo $CODE
	#echo $TOKENS_COUNT
}

#NotYet!
decryptList(){ # for decrypt
	#birthdate
	if [[ $1 =~ "b\d{4}(?:\d{2})?|b#" ]]; then # ^b[0-9]+|b# TODO: support another symbols
      echo "$1"
	else 
      echo "oops" 
	fi
	#echo "$1"
}

instructions(){
	clear
    echo -e "There are three types of variables used in tokens: literal, numeric, and relative.\n\nThe literal variable takes as the main part any letter or combination of letters, 
the meaning of which is given in the explanatory text. A combination of several values 
at the same time is permissible.\n"
	echo -e "Example: osLW - 'I use Linux and Windows'95+';\n"
	echo -e "Numeric variable takes some integer as the main part a number written in 
10-ary notation, unless otherwise specified in the explanatory text.\n"
	echo -e "Example: kg75 - 'My weight is 75 kg';\n"
	echo -e "The relative variable characterizes a certain relative value, subjectively 
estimated by you independently, and as the main part takes one of the standard
symbols (1, 2, 3, 4, 5), selected from the scale, given in the explanatory text.\n"
	echo -e "Example: veg2 - 'I have a negative attitude towards vegetarianism';\n"
	echo -e "Below in the text, variable designations are enclosed in angle brackets. <l>
denotes a literal variable, <n> is numeric, <s> is relative. If
there are several variables in the token, then each of them is numbered.\n"
	
	read -p "Press Enter to continue..." value

	clear
	echo -e "The following metacharacters modify the meaning, but they can also replace it, depending on the meaning. Their order is predetermined.\n"
	echo -e "# - 'secret'\n
    Indicates that you do not want to disclose information about yourself on this matter
    (used as an independent meaning).\n"
	echo -e "Example: b# - 'Don't ask me how old I am, I don't admit it anyway!'\n"
	echo -e "0 - 'not relevant'\n
    Indicates that you objectively do not have the opportunity in this aspect,
    the question is irrelevant to you or is rejected by you (used as an independent
    value).\n"
	echo -e "Example: Int0 - 'I have no access to the Internet.'\n"
	echo -e "@ - 'all'\n
    For literal variables, replaces an enumeration of all possible values
    (used as an independent meaning).\n"
	echo -e "Example: WWW@ - 'I am a true master of web technologies and I own them all.'\n"
	echo -e "& - 'etc'\n
    Indicates a non-standard answer (used as an independent value for relative 
    variables or as one of the options for whether teral, recorded last).\n"

	echo -e "Example: HarB&  - 'I am a brunette with a very unusual haircut.'\n"

	read -p "Press Enter to continue..." value

	clear
	echo -e "? - 'don't know'\n
    Indicates that you are not aware of the matter and cannot express your
    opinion (used as an independent meaning). 

    Example: dem? - 'What is 'demomaking', I do not know, and therefore
                                    I can't tell how I feel about him.'\n"
	echo -e "~ - 'variably'\n
    Indicates that your answer to a question is volatile and varies widely
    affairs depending on conditions or your mood (used as meaning alone or 
    in addition to the previously indicated meaning and immediately after it). 

    Example: hum3~ - 'I usually have a normal sense of humor, but it happens
                      changeable.'"

	echo -e "+ - 'with a little'\n
    For relative variables, means your choice of an intermediate value
    on a scale higher than that indicated, but less than the scale division. 
    In combination with the highest value, it indicates your desire to draw 
    attention to a particularly high degree of this characteristic.For literal
    variables, means a higher than usual degree of the selected value.
    (Used in addition to and immediately after the above value).

    Example: fuk5+ - 'I just love to swear! :-)'\n"

	read -p "Press Enter to continue..." value
	
	clear
	echo -e "- - 'without little'\n
    For relative variables, means your choice of an intermediate value on a 
    scale lower than that indicated, but by an amount less than the price
    of the scale. Combined with the lowest value means your aspiration to
    draw attention to a particularly low degree of this characteristic. For
    literal variables means a lower than usual degree of the chosen-value.
    (Used in addition to the above value and immediately after it). 

     Example: lng3-fr- - 'I know English below average, I know a little French.'\n"
	echo -e "* - 'note'\n
    Means that the specified standard answer requires further clarification
     and is valid only in some of its subdomains (used in addition to the 
     previously indicated value and immediately after it). This symbol 
     serves as a warning to the interlocutor that the information given 
     requires further clarification by means of natural language. 

    Example: wrz4* - 'I have a large fund of computer information, but not 
                                    in general, but only of special types.'\n"

	echo -e "$ - 'forcedly'\n
    Means that this characteristic is forced under the influence of 
    circumstances and does not coincide with your inner desire (used in
    addition to and immediately after the above value). 

    Example: ech1$ - 'I rarely read echo conferences, because I do not have 
                                                      for this enough time.'\n"
	read -p "Press Enter to continue..." value
	
	clear
	echo -e "> - 'desire'\n
    Means that the characteristic that follows immediately after this symbol 
    in the form of the 'main representation of the quantity' is not valid, 
    but only the one you want (for literal variables it is used as an 
    independent value, for relative variables - in addition to the specified 
    actual value and immediately after it).

    Example: petc>m - 'I have a cat and I also plan to have a rodent.'\n"

	echo -e "! - 'refusal'\n
    Indicates that you do not wish to discuss the matter in principle.
     considerations (used as an independent value or in addition to the 
     previously specified value and immediately after it). This symbol
     serves as a warning to the interlocutor. 

    Example: God!  - 'I would rather not discuss the topic of religion.'\n"

	 echo -e "% - 'recruiter'\n
    Indicates that through you it is possible to contact an activist in an 
    activity, associated with the meaning of the token. (Used in addition to 
    the specified before and immediately after). 

    Example: god1% - 'I am a big opponent of religion and through me you can 
                            contact an even greater activist in this matter.'\n"
	
	read -p "Press Enter to continue..." value
	
	clear
	echo -e "=<s> - 'merit'\n
    For a number of tokens (by meaning) through the relative parameter s 
    indicates assessment of the results of your activities in this field. 
    (Used in addition to and immediately after the above value).

    Example: xsc4=3 - 'I have a positive attitude towards unrecognized sciences, 
                            and I have a number of developments in this area.'\n"
	echo -e "< - 'attention'\n
    Indicates your desire to pay special attention to this characteristic (used in
    addition to the previously indicated value and immediately after it). 

    Example: arg5< - 'Keep in mind that you shouldn't even try to convince me of 
                                            anything: you will be worse off.'\n"
	read -p "Press Enter to continue..." value
	
	clear

}

start
