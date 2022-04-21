#!/bin/bash
set -e
clear

start(){
	echo -e "Phainocode 4.1 RU\n"
	echo -e "Реализация стандарта Phainocode 4.1 на bash (v0.5)!\nИсходный код: https://github.com/Whiletruedoend/phainocode\n\nПожалуйста, выберите пункт:\n"
	echo "1. Создать новый токен"
	echo "2. Расшифровать (Ещё не реализовано)"
	echo -e "3. Выход\n"
	
	menu;
}

menu(){
	read -e -p "Введите значение [1-3]: " OPTION

	if [[ $OPTION -eq 1 ]]; then
		encryptMenu;
	elif [[ $OPTION -eq 2 ]]; then
		decryptMenu;
	elif [[ $OPTION -eq 3 ]]; then
		exit 0;
	else
		echo "Опция не существует!"
		menu;
	fi
}

finish(){
	CODE="$1"
	read -e -p "Экспортировать результаты в файл? [y/N]: " EXPORT
	EXPORT=${EXPORT:-"N"}

	if [[ $EXPORT == "Y" ]] || [[ $EXPORT == "y" ]]; then
		FILE_NAME=`date +"%Y_%m_%d_%H_%M_%S"`
		EXPORT_PATH="$HOME/pcode_$FILE_NAME.txt"
		echo $CODE > $EXPORT_PATH
		echo "Успешно экспортировано в: $EXPORT_PATH"
	fi
	
	read -e -p "Показать результаты? [Y/n]: " SHOW
	SHOW=${SHOW:-"Y"}

	if [[ $SHOW == "y" ]] || [[ $SHOW == "Y" ]]; then
		echo -e "Результаты:\n"
		echo $CODE
	fi
}

encryptMenu(){
	read -e -p "Показать инструкцию? [y/N]: " INSTRUCTIONS
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
	echo -e "Ваши увлечения (может быть несколько значений):
  A - Артистические искусства;
  B - Биология и медицина;
  C - Коммуникации {communications};
  D - Домоводство и строительство;
  E - Жлектрическая техника;
  G - Графика;
  H - Социальное манипуляторство (хакерство);
  J - Юриспруденция;
  L - Лингвистика и семиотика;
  M - Математика и информатика;
  N - Точные естественные науки;
  O - Эксплуатация и совершенствование организма;
  P - Компьютерное дело;
  S - Социальные науки;
  T - Издательство и корректура;
  U - Публицистика;
  W - Охранная и военная деятельность;
  a - Механическая техника;
  c - Коммерция;
  d - Дизайн;
  e - Образование;
  l - Литература;
  m - Музыка;
  h - Философия;
  p - Политика;
  s - Психология;
  u - Кулинария;
  x - Неакадемические науки и теории.\n"

	EXAMPLE="AMPSam"
	PERMITTED_SYMBOLS="A B C D E G H J L M N O P S T U W a c d e l m h n p s u x # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE _$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #birthdate
	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Введите дату рождения в следующем формате: <n1><n2><n3>
   Параметр <n1> указывает день в виде двузначного числа.
   Параметр <n2> указывает месяц в виде двузначного числа.
   Параметр <n3> указывает год в виде 2 последних цифр по григорианскому 
   календарю. Параметр может быть опущен;\n"
  	EXAMPLE="151295"
  	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5 6 7 8 9"
  	NEW_CODE="$NEW_CODE b$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
  	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #gender&sexuality
  	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Введите пол и сексуальность: <l><s>
  Параметр l указывает пол и сопутствующие характеристики:
    X - Женщина;
    Y - Мужчина;
    ' - Девственность;
  Параметр s описывает степень сексуальности:
    5 - 'Только и думаю о сексе';
    4 - Активная;
    3 - Средняя;
    2 - Ниже средней;
    1 - 'Антисекс';\n"
  	EXAMPLE="X'1"
  	PERMITTED_SYMBOLS="X Y ' # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
  	NEW_CODE="$NEW_CODE X$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
  	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #bod
	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Введите телосложение: <n><s>
  Параметр n описывает рост в см.
  Параметр s описывает относительный характер поперечного телосложения:
    5 - Тучный;
    4 - Толще среднего;
    3 - Средний;
    2 - Тоньше среднего;
    1 - Худой;\n"
	EXAMPLE="1803"
  	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5 6 7 8 9"
  	NEW_CODE="$NEW_CODE bod$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
  	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #kg
  	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Ваша масса тела, в кг;\n"
	EXAMPLE="85"
  	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5 6 7 8 9"
  	NEW_CODE="$NEW_CODE kg$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
  	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #Har
  	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Введите цвет и тип волос: <l><s>
  Параметр l описывает цвет и сопутствующие характеристики:
    B - Чёрный;
    b - Коричневый;
    g - Серый;
    l - Светлый;
    r - Рыжий;
    w - Белый;
    \" - Парик;
    ' - Волосы искусственно окрашены;
  Параметр s описывает длину/густоту причёски:
    5 - Ниже пояса;
    4 - От плеч и до пояса;
    3 - Густая причёска, но не длинная;
    2 - Короткая стрижка;
    1 - Лысый или бритый;\n"
	EXAMPLE="r'3"
  	PERMITTED_SYMBOLS="B b g l r w \" ' # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
  	NEW_CODE="$NEW_CODE Har$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
  	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #har
	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Введите лицевую растительность: <s1><s2><s3>
  Параметр s1 описывает бороду:
    5 - Длинная борода;
    4 - Короткая борода;
    3 - \"Недельная небритость\";
    2 - \"Двухдневная небритость\";
    1 - Гладко выбрит;
  Параметр s2 описывает усы:
    3 - \"Как у сверчка\";
    2 - Маленькие;
    1 - Гладко выбрит;
  Параметр s3 описывает бакенбарды:
    3 - Пейсы;
    2 - Средние;
    1 - Отсутствуют;\n"
	EXAMPLE="422"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE har$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #eye
  	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Введите цвет глаз и особенности зрения: <l><s>
  Параметр l описывает цвет радужины:
    B - Чёрный;
    G - зелёный;
    b - Коричневый;
    g - Серый;
    l - Голубой;
    r - Красный;
  Параметр s описывает особенности зрения:
    5 - \"Вижу как орёл\";
    4 - Нормальное;
    3 - \"Вижу не очень хорошо, но ни очки, ни контактные линзы не ношу\";
    2 - \"Ношу контактные линзы\";
    1 - \"Ношу очки\";\n"
	EXAMPLE="G/l4"
	PERMITTED_SYMBOLS="B G b g l r # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE eye$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #skn
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Введите цвет кожи:
    5 - \"Негр\";
    4 - Смуглый;
    3 - Загорелый европеец;
    2 - Слегка загорелый европеец;
    1 - \"Бледная поганка\";\n"
	EXAMPLE="2"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE skn$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #drs
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Введите тип одежды: <s1><s2><s3>
  Параметр s1 описывает предпочитаемый стиль одежды:
    5 - Строго официальный;
    4 - С тенденцией к официальности;
    3 - Стандартный;
    2 - С тенденцией к вызывающему;
    1 - Вызывающий;
  Параметр s2 описывает модность одежды:
    5 - \"По последнему писку\";
    4 - \"Стараюсь не отставать\";
    3 - Безразлично;
    2 - С тенденцией к консервативности;
    1 - Упрямый консерватор;
  Параметр s3 описывает индивидуальность одежды:
    5 - Совершенно индивидуальный стиль;
    4 - \"Стараюсь придерживаться определённого стиля\";
    3 - Безразлично;
    2 - \"Одеваюсь большей частью стандартно\";
    1 - \"Полностью сливаюсь с толпой на улице\";\n"
	EXAMPLE="332"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE drs$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #bad
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Введите вредные привычки: <s1><s2><s3>
  Параметр s1 описывает употребление алкогольных напитков:
    5 - Убеждённый трезвенник;
    4 - Только по особым дням;
    3 - Умеренное;
    2 - \"Люблю почаще\";
    1 - \"Нутро требует регулярно\";
  Параметр s2 описывает курение:
    5 - \"Органически не переношу табачного дыма\";
    4 - \"Не курю\";
    3 - Изредка;
    2 - Умеренное;
    1 - \"Это то, что любят мои лёгкие\";
  Параметр s3 описывает употребление прочих психоактивных веществ:
    5 - \"Не ем даже шоколад\";
    4 - \"Не употребляю\";
    3 - \"Люблю тонизирующие напитки\";
    2 - \"Балуюсь, бывает, лёгкими средствами\";
    1 - \"Это необходимо мне регулярно для поддержания ясности ума\";\n"
	EXAMPLE="323"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE bad$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #Hea
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Введите ваше состояние здоровья:
    5 - \"Здоров, как бык\";
    4 - \"Почти не болею\";
    3 - \"Болею, как все\";
    2 - \"Хроник\";
    1 - \"Развалина\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE Hea$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #hea
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к идее рационального здорового образа жизни:
    5 - Ярый приверженец;
    4 - Одобрительное;
    3 - Безразличное;
    2 - Наплевательское;
    1 - \"Лучше уж раз \"оттянуться\", чем всю жизнь себя мучить\";\n"
	EXAMPLE="4~"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE hea$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #sp
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к занятиям физической культурой:
    5 - Профессиональный спортсмен;
    4 - Любитель;
    3 - Умеренное;
    2 - Редко;
    1 - \"Хиляк\";\n"
	EXAMPLE="3*"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE sp$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #pc
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Введите роль компьютера в вашей жизни: <n><s1><s2>
  Параметр n указывает год начала работы с ПК в виде 2 последних цифр.
  Параметр s1 описывает интенсивность занятий:
    5 - Почти круглые сутки каждый день;
    4 - Много;
    3 - Умеренно;
    2 - Редко;
    1 - Крайне редко;
  Параметр s2 описывает психологическую привязанность:
    5 - \"Помешанный\";
    4 - \"Увлекаюсь\";
    3 - \"Использую как привычный инструмент\";
    2 - \"Использую только по необходимости\";
    1 - \"Стараюсь не использовать\";\n"
	EXAMPLE="084+4"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5 6 7 8 9"
	NEW_CODE="$NEW_CODE pc$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #hw
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Введите ваше аппаратное обеспечение: <s><l>
  Параметр s описывает общую современность базовой части 
  компьютерной системы, используемой вами в качестве основной:
    5 - \"Только что поставил процессор, анонсированный 2 недели назад\";
    4 - Не старше 2 лет;
    3 - Типичное;
    2 - Устаревающее;
    1 - \"Экспонаты исторического музея\";
  Параметр l перечисляет специальные периферийные устройства, которыми вы
  располагаете:
    A - Arvid;
    C - Пишущий привод CD;
    D - Пишущий привод DVD;
    M - Манипулятор точного ввода;
    P - Принтер высококачественный;
    S - Звуковой адаптер;
    a - Карманный компьютер;
    d - Щирокоэкранный дисплей;
    f - Цифровой фотоаппарат;
    l - Плоттер;
    m - Модем;
    n - Портативный компьютер;
    p - Принтер низкокачественный;
    s - Сканер;
    v - Цифровая видеокамера;\n"
	EXAMPLE="4Pmns"
	PERMITTED_SYMBOLS="A C D M P S a d f l m n p s v # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE hw$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #Net
	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Введите отношение к основным типам компьютерных коммуникаций: <s1><s2><s3>
  Параметр s1 описывает отношение к BBS:
        5 - Старый сисоп/завсегдатай;
        4 - Одобрительное;
        3 - Нейтральное;
        2 - Осуждающее;
        1 - \"Они вымерли в прошлом веке\";
  Параметр s2 описывает отношение к FTN-сетям:
        5 - Матёрый фидошник;
        4 - Одобрительное;
        3 - Нейтральное;
        2 - Осуждающее;
        1 - \"Сборище небритых фидорасов\";
  Параметр s3 описывает отношение к Интернету:
        5 - Матёрый интернетчик;
        4 - Одобрительное;
        3 - Нейтральное;
        2 - Осуждающее;
        1 - \"Всемирная помойка порнографии\";\n"
	EXAMPLE="3?5"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE Net$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #net
  	clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Введите используемые виды компьютерных коммуникаций:
    B - BBS;
    F - Фидо;
    I - IRC;
    Q - Пейджинговые системы (ICQ);
    U - Usenet;
    W - WWW;
    c - HTTP-чаты (chat);
    e - E-mail;
    f - Малые FTN-сети;
    p - Файлобменные сети (peer-to-peer);
    u - Форумы;\n"
	EXAMPLE="Wceu&"
	PERMITTED_SYMBOLS="B F I Q U W c e f p u # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE net$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #Int
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Введите качество используемого вами доступа в Интернет:
    5 - Выделенка дома;
    4 - Купленный dialup;
    3 - Выделенка на работе;
    2 - Подаренный/публичный/кракнутый dialup;
    1 - Публичные заведения/у друга;\n"
	EXAMPLE="5"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE Int$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #com
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Что для вас главное в компьютерных коммуникациях:
    5 - Только общение;
    4 - Скорее общение, чем данные (пассивная информация);
    3 - И общение, и данные;
    2 - Скорее данные, чем общение;
    1 - Только данные;\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE com$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #msg
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Частота чтения сетевой переписки и отправки ответов на неё:
    5 - Каждый день;
    4 - От 1 до 3 дней;
    3 - От 3 до 7 дней;
    2 - От 1 до 2 недель;
    1 - Эпизодически;\n"
	EXAMPLE="5"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE msg$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #ech
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
    echo -e "Сколько сетевых эхоконференций примерно выписываете:
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
	echo -e "Отношение к компьютерному сленгу:
    5 - \"Имхо тока сабж и юзаю\";
    4 - Одобрительное;
    3 - Нейтральное;
    2 - Осуждающее;
    1 - \"Хватит издеваться над языком!\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE sl$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #OS
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к основным классам операционных систем: <s1><s2><s3><s4>
  Параметр s1 описывает отношение к DOS:
    5 - \"Старо, но надёжно\";
    4 - Одобрительное;
    3 - Нейтральное;
    2 - Осуждающее;
    1 - \"Давно умерло\";
  Параметр s2 описывает отношение к OS/2:
    5 - \"Самая лучшая система\";
    4 - Одобрительное;
    3 - Нейтральное;
    2 - Осуждающее;
    1 - \"Тупиковое изобретение\";
  Параметр s3 описывает отношение к Linux (Unix вообще):
    5 - \"Система будущего\";
    4 - Одобрительное;
    3 - Нейтральное;
    2 - Осуждающее;
    1 - \"Выдумки чудаков\";
  Параметр s4 описывает отношение к Windows (всех версий):
    5 - \"Конечно, а что же ещё?\";
    4 - Одобрительное;
    3 - Нейтральное;
    2 - Осуждающее;
    1 - \"Must die!\";\n"
	EXAMPLE="4?41"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE OS$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #os
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Какие классы операционных систем вы используете:
    D - DOS и Windows 3.x;
    L - Linux;
    N - Novell Netware;
    O - OS/2;
    T - Windows NT+;
    U - Unix (кроме Linux);
    W - Windows'95+;\n"
	EXAMPLE="4?41"
	PERMITTED_SYMBOLS="D L N O T U W # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE os$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #prg
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Введите ваш навык программирования: <l1><l2><s>
  Параметр l1 перечисляет типы языков программирования, которыми владеете:
    A - Ada;
    B - Basic;
    C - C++;
    F - Fortran;
    J - Java;
    K - Cobol;
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
  Параметр l2 перечисляет операционные системы, под которыми программируете:
    D - DOS и Windows 3.x;
    L - Linux;
    N - Novell Netware;
    O - OS/2;
    T - Windows NT+;
    U - Unix (кроме Linux);
    W - Windows'95+;
  Параметр s описывает степень умения программировать:
    5 - Виртуозно;
    4 - Неплохо;
    3 - Средне;
    2 - С трудом;
    1 - Только теоретические представления;\n"
	EXAMPLE="CJcyLW4"
	PERMITTED_SYMBOLS="A B C F J K P R V a c d f l o r x y D L N O T U W # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE prg$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #dem
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к демомейкерству:
    5 - \"Сам пишу\";
    4 - Одобрительное;
    3 - Нейтральное;
    2 - \"Чудаки, делать им больше нечего\";
    1 - \"Идиотизм\";\n"
	EXAMPLE="?"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE dem$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #WWW
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Какими веб-технологиями вы владеете:
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
	echo -e "Какому стилю языков программирования (C/C++ или Pascal/Delphi) отдаёте предпочтение:
    3 - C/C++;
    2 - Оба в равной степени;
    1 - Pascal/Delphi;\n"
	EXAMPLE="2"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE CvP$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #wrz
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Размеры имеющегося фонда компьютерной информации:
    5 - Гигабайты \"варезов\";
    4 - Много;
    3 - Средний набор;
    2 - Мало;
    1 - \"Стараюсь жить на минимуме\";\n"
	EXAMPLE="5"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE wrz$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #hex
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Владеете ли работой с программами на недокументированном (машинном) уровне:
    5 - \"Читаю \"гекс\" как книгу, крошу любую защиту\";
    4 - Довольно опытен;
    3 - Средне;
    2 - С трудом;
    1 - \"Вообще не умею\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE hex$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #pol
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Ваши политические взгляды:
    5 - Анархист;
    4 - Либерал;
    3 - Умеренный;
    2 - Консерватор;
    1 - Тоталитарист;\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE pol$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #ec
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к регулированию экономики:
    5 - \"Полностью за государственное управление\";
    4 - \"Симпатизирую государственному управлению\";
    3 - Нейтральное;
    2 - \"Симпатизирую свободному рынку\";
    1 - \"Полностью за свободный рынок\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE ec$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #Eg
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к идее равноправия людей в обществе:
    5 - \"Все рождены одинаковыми и достойны равных прав\";
    4 - \"Хорошее равноправие допускает исключения\";
    3 - Нейтральное;
    2 - \"Каждый достоин того, чего он добился сам\";
    1 - \"Равноправие бывает только в стаде баранов\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE Eg$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #pub
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к гласности и общедоступности информации:
    5 - \"Всё должно быть открыто\";
    4 - \"Секретить нужно только при крайней необходимости\";
    3 - Нейтральное;
    2 - \"За свободой информации нужно следить\";
    1 - \"Доступность информации ведёт к беде\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE pub$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #gov
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к действующему правительству:
    5 - Ярый поклонник;
    4 - Одобрительное;
    3 - Нейтральное;
    2 - Осуждающее;
    1 - \"Сколько же ещё будет терпеть народ?\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE gov$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #USA
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к США и североамериканской культуре:
    5 - \"Образец для всего человечества\";
    4 - \"Отчасти симпатизирую\";
    3 - Нейтральное;
    2 - \"Yankee, go home!\";
    1 - \"Удалить бы эту мерзость с лица планеты\";\n"
	EXAMPLE="2"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE USA$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #mil
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к существованию всеобщей воинской обязанности:
    5 - \"Достойную армию можно создать только так\";
    4 - Одобрительное;
    3 - Нейтральное;
    2 - Осуждающее;
    1 - \"Циничная разновидность легального рабовладения\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE mil$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #gun
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к идее легализации огнестрельного оружия для самообороны:
    5 - \"Как на Диком Западе\";
    4 - \"Разрешить на условиях строгого контроля\";
    3 - \"Пока общество не готово, а дальше - посмотрим\";
    2 - \"Только служащим организаций, находящимся в группе риска\";
    1 - \"В государстве пьяниц и психопатов все друг-друга перестреляют\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE gun$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #exe
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к смертной казни:
    5 - \"Правильно, уродов надо уничтожать\";
    4 - \"Иногда это разумно\";
    3 - Нейтральное;
    2 - Осуждающее;
    1 - \"Убийство недопустимо никогда\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE exe$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #sex
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Ваше отношение к сексуальной революции:
    5 - \"Против этого только физиологически неполноценные\";
    4 - Одобрительное;
    3 - Нейтральное;
    2 - Осуждающее;
    1 - \"Нездоровая идея озабоченных развратников\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE sex$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #abo
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к абортам:
    5 - \"Родительство должно быть лицензируемой профессией\";
    4 - Одобрительное;
    3 - Нейтральное;
    2 - Осуждающее;
    1 - \"Настоящее убийство\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE abo$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #god
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к участию религии в обществе:
    5 - \"Да, мы все должны жить по законам бога\";
    4 - Одобрительное;
    3 - Нейтральное;
    2 - Осуждающее;
    1 - \"Надоели эти клерикалы, сколько можно цепляться за старину?\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE god$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #(c)
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к авторскому праву:
    5 - \"Без него никто не станет ничего создавать\";
    4 - Одобрительное;
    3 - Нейтральное;
    2 - Осуждающее;
    1 - \"Тормоз прогресса\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE (c)$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #hak
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Ваше отношение к компьютерному диссидентству: <s1><s2>
  Параметр s1 характеризует отношение к хулиганам и вирусописателям:
    5 - \"Волк - санитар леса\";
    4 - \"Их боятся только ламера\";
    3 - Нейтральное;
    2 - Осуждающее;
    1 - \"Социально опасные элементы\";
  Параметр s2 характеризует отношение к компьютерным \"пиратам\" и кракерам:
    5 - \"Борцы с монополией\";
    4 - Одобрительное;
    3 - Нейтральное;
    2 - Осуждающее;
    1 - \"Банальные воры\";\n"
	EXAMPLE="33"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE hak$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #drg
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к идее легализации наркотиков:
    5 - \"Долой запретительство, питающее наркомафию!\";
    4 - Одобрительное;
    3 - Нейтральное;
    2 - Осуждающее;
    1 - \"Идиотские выдумки наркоманов\";\n"
	EXAMPLE="2"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE drg$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #xsc
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к неофициальным (неакадемическим) наукам и революционным
концепциям в официальных науках:
    5 - \"Консерватизм \"академов\" тормозит познание\";
    4 - Одобрительное;
    3 - Нейтральное;
    2 - Осуждающее;
    1 - \"Есть только одна наука - официальная, остальное - шарлатанство\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE xsc$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #UFO
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к НЛО и внеземным цивилизацям:
    5 - \"Они уже давно здесь\";
    4 - \"Инопланетяне действительно посещают Землю, хотя их роль часто 
         преувеличивают\";
    3 - Нейтральное;
    2 - \"Возможно, инопланетная жизнь где-то и есть, но это очень далеко и
         неактуально\";
    1 - \"Жизнь на Земле уникальна\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE UFO$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #fuk
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к нецензурным выражениям:
    5 - \"Материться не умеют только сопляки\";
    4 - \"Удобный способ выразить многие эмоции\";
    3 - Нейтральное;
    2 - \"Разве только в крайних случаях\";
    1 - \"Совершенно неприемлемо для культурного человека\";\n"
	EXAMPLE="2"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE fuk$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #psy
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Тип личности, определяемый по следующему эмпирическому тесту [Пинт  А.А.
  Самоучитель безопасной езды, практическое пособие. - М.: За  рулём,  1998, с. 178].
  Тест не претендует на научность, но удобен на практике для неспециалистов.
  1. Переплетите пальцы рук и заметьте руку, палец которой оказался сверху:
    0 - Правой;
    1 - Левой.
  2. Наложите выпрямленные кисти рук с отставленными большими пальцами друг
  на друга перед собой так, чтобы они образовали перегородку с просветом.
  Посмотрите на какой-нибудь небольшой предмет через этот просвет двумя глазами.
  Затем, оставаясь в том же положении, закрывайте попеременно правый и левый глаза.
  Вы увидите предмет только одним глазом. Заметьте этот глаз:
    0 - Правый;
    1 - Левый.
  3. Переплетите руки на груди и заметьте руку, которая оказалась сверху:
    0 - Правая;
    1 - Левая.
  4. Похлопайте в ладоши и заметьте ладонь, которая оказалась сверху:
    0 - Правая;
    1 - Левая.
  Полученные цифры стыкуются как разряды 2-ичного числа в порядке 1234. Затем это число
  переводится в 16-ричное представление, в котором и записывается.
  Толкование теста:\n"
  	read -p "Нажмите Enter чтобы продолжить..." value
	clear
	echo -e "Толкование теста: 
    0000 (0) - Ориентация на общепринятое мнение. Консерватизм с наиболее
               стабильным поведением (\"правильный\" тип);
    0001 (1) - Неуверенный консерватизм. Слабый темперамент. Нерешительность.
    0010 (2) - Сильный тип, не воспринимающий слабых. Решительность. Чувство
               юмора. Энергичность. Склонность  к  кокетству. Темпераментность.
               Артистизм;
    0011 (3) - Редкий и самостоятельный тип. Высокая контактность, но медленное
               привыкание;
    0100 (4) - Деловой тип, сочетающий аналитический склад ума и мягкость
               (тип \"деловой женщины\"). Медленное привыкание. Осторожность.
               Расчётливость. Терпимость. Замедленное развитие отношений.
               Некоторая холодность;
    0101 (5) - Самый слабый тип. Беззащитность. Неспособность идти на конфликт.
               Подверженность различным влияниям;
    0110 (6) - Непоседливость, частый эмоциональный голод. Способность не
               создавать конфликтов. Некоторое непостоянство. Эмоциональная
               медлительность. Томность. Простота. Смелость в общении.
               Способность переключаться на новый тип поведения;
    0111 (7) - Непостоянство и независимость. Аналитичность в сочетании с
               эмоциональностью;
    1000 (8) - Хорошая адаптируемость. Эмоциональность в сочетании с достаточной
               настойчивостью в стратегических вопросах. Высокая подверженность
               чужому влиянию. Лёгкий контакт практически со всеми остальными
               типами. Склонность к флегматичности;
    1001 (9) - Мягкость, уступчивость осторожному влиянию. Требует особо
               тщательного отношения к себе (тип \"маленькой королевы\");
    1010 (A) - Самый сильный тип, трудно поддающийся убеждению. Настойчивость,
               иногда переходящая в зацикливание на второстепенных деталях.
               Сильная индивидуальность. Способность к преодолению трудностей.
               Некоторый консерватизм из-за недостатка внимания к чужой точке зрения.
               Не любит инфантильности;
    1011 (B) - Сильный, но не навязчивый характер, практически не поддающийся
               убеждению. Внутренняя агрессивность, прикрытая внешней мягкостью
               и эмоциональностью. Быстрое взаимодействие, но медленное взаимопонимание;
    1100 (C) - Дружелюбие и простота, некоторая разбросанность интересов;
    1101 (D) - Простодушие. Мягкость. Доверчивость. Очень редкий тип;
    1110 (E) - Эмоциональность в сочетании с решительностью. Склонность принимать
               непродуманные решения под влиянием эмоций;
    1111 (F) - Способность взглянуть на вещи по-новому. Наибольшая эмоциональность.
               Индивидуальность. Эгоизм. Упрямство. Стремление к самозащите, иногда 
               переходящее в замкнутость;\n"
	EXAMPLE="0000"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1"
	NEW_CODE="$NEW_CODE psy$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #Psy
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Тип личности, определяемый в соционике (аналитической психологии К.Г.Юнга): <l1><l2><l3><l4><l5>
Работа с токеном требует специальных знаний, либо консультации  со  специалистом, поэтому в качестве альтернативы, удобной на практике для неспециалистов, вы можете воспользоваться предыдущим тестом.
  Параметр l1 описывает интравертность/экстравертность:
    I - Интраверт;
    E - Экстраверт;
  Параметр l2 описывает сенсорность/интуитивность:
    S - Сенсорик;
    N - Интуитив;
  Параметр l3 описывает логичность/этичность:
    T - Логик;
    F - Этик;
  Параметр l4 описывает рациональность/иррациональность:
    J - Рационал;
    P - Иррационал;
  Параметр l5 описывает ваш темперамент:
    c - Холерик
    f - Флегматик;
    s - Сангвиник;
    m - Меланхолик;\n"
	EXAMPLE="INTJc"
	PERMITTED_SYMBOLS="I E S N T F J P c f s m # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE Psy$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #mus
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Ваше отношение к музыке: <l><s>
  Параметр l описывает предпочитаемые музыкальные стили:
    c - Классическая музыка;
    f - Народная музыка;
    I - Инструментальная музыка;
    J - Джаз (классический);
    B - Блюз;
    A - Авангард;
    R - Рок;
    M - Металл;
    Y - Синтезированная AY/YM музыка;
    m - Тяжёлый металл;
    p - Панк-рок (альтернативная музыка);
    a - Авторская песня;
    v - Популярная вокальная музыка;
    d - Диско, брит-поп, синти-поп;
    e - Злектронная классическая музыка;
    r - Рэп;
    b - Брейкбит, джангл, тех-степ;
    i - Ай-ди-эм (IDM);
    j - Джаз (импровизация);
    t - Транс, эмбиент;
    T - Техно, минимал;
    h - Хаус, гэраж, эйсид-джаз;
    H - Хардкор, хэппи-хардкор, олдскулл;
    G - Габба, спидкор, нойскор;
  Параметр s описывает, как часто слушаете музыку:
    5 - Постоянно;
    4 - Часто;
    3 - Умеренно;
    2 - Редко;
    1 - Никогда;\n"
	EXAMPLE="cIRYaet4"
	PERMITTED_SYMBOLS="c f I J B A R M Y m p a v d e r b i j t T h H G # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE mus$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #TV
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Часто ли смотрите телевизор:
    5 - Постоянно;
    4 - Часто;
    3 - Умеренно;
    2 - Редко;
    1 - Никогда;\n"
	EXAMPLE="2"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE TV$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #gam
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Ваше отношение к компьютерным играм: <l><s>
  Параметр <l> описывает предпочитаемые классы игр:
    3 - 3D-экшн;
    S - Стратегические;
    e - Экономико-стратегические;
    i - Абстрактно-интеллектуальные;
    q - Диалоговые (\"квесты\");
    s - Симуляторы;
    w - Военно-стратегические.
  Параметр s описывает, как часто играете:
    5 - Почти круглые сутки каждый день;
    4 - Много;
    3 - Умеренно;
    2 - Редко;
    1 - Никогда;\n"
	EXAMPLE="3Se3"
	PERMITTED_SYMBOLS="S e i q s w # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE gam$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #RP
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Ваше отношение к ролевым играм:
    5 - \"Без этого мир убог\";
    4 - Одобрительное;
    3 - Нейтральное;
    2 - Осуждающее;
    1 - \"Детский сад\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE RP$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #hum
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Как вы оцениваете своё чувство юмора:
    5 - Большой \"хохмач\";
    4 - \"Люблю пошутить\";
    3 - Обычное;
    2 - \"Обычно не люблю\";
    1 - \"Терпеть не могу глупостей\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE hum$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #lab
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Как вы оцениваете вашу работоспособность: <s1><s2><s3><s4><s5>
  Параметр s1 описывает инициативность:
    5 - \"Лёгок на подъём\";
    4 - Высокая;
    3 - Средняя;
    2 - Низкая;
    1 - \"Тяжёл на подъём\";
  Параметр s2 описывает трудолюбие в собственной инициативе:
    5 - Трудоголик;
    4 - Довольно деятельный;
    3 - Среднее;
    2 - Довольно ленивый;
    1 - Лодырь;
  Параметр s3 описывает способность к наёмному труду:
    5 - Трудоголик;
    4 - Довольно деятельный;
    3 - Среднее;
    2 - Довольно ленивый;
    1 - Лодырь;
  Параметр s4 описывает изобретательность:
    5 - \"Генератор идей\";
    4 - Высокая;
    3 - Средняя;
    2 - Низкая;
    1 - Шаблонный;
  Параметр s5 описывает добросовестность:
    5 - Перфекционист;
    4 - Высокая;
    3 - Средняя;
    2 - Низкая;
    1 - Халтурщик;\n"
	EXAMPLE="33333"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE lab$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #lov
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Характер половой жизни:
    5 - \"Имею постоянного партнёра\";
    4 - \"В основном с неформальным партнёром\";
    3 - Умеренная;
    2 - \"Не прочь иногда пофлиртовать\";
    1 - Активный \"пикапер\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE lov$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #lib
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Как часто вы читаете литературу: <s1><s2><s3><s4>
  Параметр s1 описывает прозаическую художественную литературу:
    5 - Постоянно;
    4 - Часто;
    3 - Умеренно;
    2 - Редко;
    1 - Никогда;
  Параметр s2 описывает стихи:
    5 - постоянно;
    4 - часто;
    3 - умеренно;
    2 - редко;
    1 - никогда;
  Параметр s3 описывает научно-популярную литературу:
    5 - постоянно;
    4 - часто;
    3 - умеренно;
    2 - редко;
    1 - никогда;
  Параметр s4 описывает научно-техническую и специальную литературу:
    5 - постоянно;
    4 - часто;
    3 - умеренно;
    2 - редко;
    1 - никогда;\n"
	EXAMPLE="2334"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE lib$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #edu
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Ваше образование и эрудиция: <s1><s2>
  Параметр s1 описывает формальное образование:
    5 - Научная степень;
    4 - Высшее;
    3 - Среднее или средне-специальное;
    2 - Неоконченное среднее;
    1 - Начальное;
  Параметр s2 описывает собственную оценку фактического образования:
    5 - \"Ходячая энциклопедия\";
    4 - Довольно эрудирован;
    3 - Среднее;
    2 - Ниже среднего;
    1 - Неуч;\n"
	EXAMPLE="43"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE edu$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #lng
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Знание иностранных языков: <s><l>
  Параметр s описывает знание английского языка:
    5 - Совершенное;
    4 - Неплохое;
    3 - Среднее;
    2 - На начальном уровне;
    1 - \"Не знаю\";
  Параметр l описывает знание прочих иностранных языков. Языки указываются в виде 2-буквенных обозначений по ISO 639 перечисляемых по алфавиту, вплотную друг к другу;\n"
	EXAMPLE="RU4EN3"
	PERMITTED_SYMBOLS="A B C D E F G H I J K L M N O P Q R S T U V W X Y Z # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE lng$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #mth
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Отношение к точным наукам:
    5 - Ярый приверженец;
    4 - \"Уважаю\";
    3 - Нейтральное;
    2 - \"Не люблю\";
    1 - \"Ненавижу\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE mth$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #ph
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Философские взгляды:
    5 - Убеждённый материалист;
    4 - Сомневающийся материалист;
    3 - Неопределившийся;
    2 - Поклонник мистики;
    1 - Глубоко верующий;\n"
	EXAMPLE="1"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE ph$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #God
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Религия:
    C - Конфуцианство;
    b - Буддизм;
    c - Католицизм;
    e - Эзотерические религиозные системы;
    i - Индуизм;
    j - Иудаизм;
    k - Кришнаитство;
    m - Ислам;
    o - Православие;
    p - Протестантизм;
    n - Новейшие религиозные системы;
    l - Прочие локальные религиозные системы;\n"
	EXAMPLE="o"
	PERMITTED_SYMBOLS="C b c e i j k m o p n l # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE God$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #co
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Коммуникабельность:
    5 - \"Готов принять участие даже в официальном мероприятии\";
    4 - \"Охотно приду на тусовку, но неформальную\";
    3 - \"Могу встретиться, но только в узком кругу\";
    2 - \"Согласен общаться по телефону\";
    1 - \"Строго соблюдаю виртуальность\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE co$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #arg
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Ваша склонность к принятию чужого мнения:
    5 - \"Ни за что!\";
    4 - \"В споре рождается истина\";
    3 - Нейтральное;
    2 - \"Лучше согласиться, чем переубеждать\";
    1 - \"Только не бейте меня!\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE arg$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #hom
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Как можно описать ваше жилище:
    5 - Жилище сумасшедшего;
    4 - С некоторыми нестандартными элементами;
    3 - Стандартный;
    2 - \"Заправляю в доме не один\";
    1 - \"У меня мало своего\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE hom$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #cok
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Любите ли вы готовить:
    3 - \"Увлекаюсь\";
    2 - \"Умеренно\";
    1 - \"Предпочитаю есть готовое\";\n"
	EXAMPLE="2"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE cok$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #veg
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Ваше отношение к вегетарианству:
    5 - Старовегетарианец;
    4 - Младовегетарианец;
    3 - Нейтральное;
    2 - \"На морковке долго не протянешь\";
    1 - \"Вегетарианского не держим!\";\n"
	EXAMPLE="3"
	PERMITTED_SYMBOLS="# 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE veg$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #drn
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Ваши любимые напитки:
    C - Алкогольные коктейли;
    G - Газированные;
    K - Кисели;
    b - Пива;
    c - Неалкогольные коктейли;
    f - Кофе;
    g - Коньяки;
    h - Шоколадные;
    i - Настойки;
    j - Соки;
    k - Квасы;
    l - Ликёры;
    m - Молочные;
    o - Компоты;
    r - Ромы;
    s - Минеральные;
    t - Чаи;
    v - Водки;
    w - Вина;\n"
	EXAMPLE="fhjks"
	PERMITTED_SYMBOLS="C G K b c f g h i j k l m o r s t v w # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE drn$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #pet
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Какого вида у вас домашние животные и/или растения:
    a - Амфибии;
    b - Птицы;
    c - Кошки;
    d - Собаки;
    f - Комнатные растения;
    i - Беспозвоночные;
    m - Грызуны;
    q - Аквариумные животные;
    r - Рептилии;
    v - Куньи или виверровые;\n"
	EXAMPLE="cdf"
	PERMITTED_SYMBOLS="a b c d f i m q r v # 0 @ & ? ~ + - * $ > ! % < = \ | / 1 2 3 4 5"
	NEW_CODE="$NEW_CODE pet$(checkAnswer "$EXAMPLE" "$PERMITTED_SYMBOLS")"
	CURRENT_ANSWER=$(( CURRENT_ANSWER + 1 ))
  #nat
    clear
	echo -e "[$CURRENT_ANSWER/$TOTAL_ANSWER_COUNT]\n"
	echo -e "Часто ли вы бываете на природе:
    5 - \"Живу постоянно\";
    4 - Часто;
    3 - Умеренно;
    2 - Редко;
    1 - \"Вся природа где-то за окном\";\n"
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
  	read -e -p "Введите ответ [ex. "$1"]: " ANSWER
	local RES="$(containsElement "$ANSWER" "$2")"
	if [[ $RES -eq 1 ]]; then
		SUCCESS=true
		echo "$ANSWER"
	elif [[ $RES -eq 2 ]]; then #skip question
		SUCCESS=true
		echo "^DEL^"
	else
		echo "Некорректное значение!" >&2
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
	read -e -p "Введите Phainocode: " CODE
	echo -e "Парсинг кода..."
	CODE="$(parse $CODE)"
	TOKENS_COUNT="999"
	#TOKENS_COUNT=$(parse $CODE)
	#echo $CODE
	#echo $TOKENS_COUNT
	#TOKENS=1 # TODO
	echo -e "$TOKENS_COUNT токенов найдено!"

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
    echo -e "В токенах используется три типа переменных: литеральные, числовые и относительные.\n
Литеральная переменная принимает в качестве основной  части  какую-либо литеру или сочетание литер,
смысл которых приведён в поясняющем тексте. Допустимо сочетание нескольких значений одновременно.\n"
	echo -e "Пример: osLW - \'Я пользуюсь Linux и Windows'95+.\';\n"
	echo -e "Числовая переменная принимает в качестве основной части некоторое целое число, записываемое в 10-ичной нотации, если иное не оговорено в  поясняющем тексте.\n"
	echo -e "Пример: kg75 - \'Мой вес - 75 кг.\';\n"
	echo -e "Относительная переменная характеризует некоторую относительную  величину, субъективно оцениваемую вами самостоятельно, и в качестве основной части принимает один из стандартных символов (1,2,3,4,5), выбираемый из шкалы, приведённой в поясняющем тексте.\n"
	echo -e "Пример: veg2 - \'Я отношусь к вегетарианству отрицательно.\';\n"
	echo -e "Ниже по тексту обозначения переменных заключены в угловые  скобки.
<l> обозначает литеральную переменную, <n> - числовую, <s> - относительную.
Если в токене переменных несколько, то каждая из них пронумерована.\n"
	
	read -p "Нажмите Enter чтобы продолжить..." value

	clear
	echo -e "Перечисленные ниже метасимволы модифицируют значение, но могут и замещать его, в зависимости от смысла. Их порядок предопределён.\n"
	echo -e "# - 'секрет'\n
    Указывает, что вы не желаете сообщать сведения о себе по данному вопросу
    (используется как самостоятельное значение).\n"
	echo -e "Пример: b# - 'Не спрашивайте, сколько мне лет, всё равно не признаюсь!'\n"
	echo -e "0 - 'неактуально'\n
    Указывает, что вы объективно не имеете возможности в данном аспекте,
    вопрос для вас неактуален или отвергаем вами (используется как самостоятельное значение).\n"
	echo -e "Пример: Int0 - 'Никакого доступа в Интернет не имею.'\n"
	echo -e "@ - 'всё'\n
    Для литеральных переменных заменяет перечисление всех возможных значений
    (используется как самостоятельное значение).\n"
	echo -e "Пример: WWW@ - 'Я настоящий мастер веб-технологий и владею ими всеми.'\n"
	echo -e "& - 'другие'\n
    Указывает нестандартный вариант ответа (используется как самостоятельноезначение 
    для относительных переменных или как один из вариантов для  литеральных, 
    записанный последним).\n"

	echo -e "Пример: HarB&  - 'Я брюнет c очень необычной стрижкой.'\n"

	read -p "Нажмите Enter чтобы продолжить..." value

	clear
	echo -e "? - 'не знаю'\n
    Указывает, что вы не осведомлены в данном вопросе и не можете высказать
    своего мнения (используется как самостоятельное значение).

    Пример: dem? - 'Что такое \'демомейкерство\', я не знаю, и потому  
                    сказать, как я к нему отношусь, не могу.'\n"
	echo -e "~ - 'переменно'\n
    Указывает, что ваш ответ на вопрос непостоянен и меняется в широких 
    пределах в зависимости от условий или вашего настроения (используется как 
    самостоятельное значение или в дополнение к указанному ранее значению и
    непосредственно после него). 

    Пример: hum3~ - 'Обычно у меня нормальное чувство юмора, но оно бывает
                     переменчивым.'"

	echo -e "+ - 'с небольшим'\n
    Для относительных переменных означает ваш выбор промежуточного значения
    на шкале, более высокого, чем указанное, но на величину меньше цены 
    деления шкалы. В сочетании с наибольшим значением указывает ваше 
    стремление привлечь внимание к особенно высокой степени данной
    характеристики. Для литеральных переменных означает более высокую 
    чем обычно степень выбранного значения. (Используется в дополнение 
    к указанному ранее значению и непосредственно после него).

    Пример: fuk5+ - 'Я просто обожаю материться! :-)'\n"

	read -p "Нажмите Enter чтобы продолжить..." value
	
	clear
	echo -e "- - 'без малого'\n
    Для относительных переменных означает ваш выбор промежуточного значения
    на шкале, более низкого, чем указанное, но на величину меньше цены 
    деления шкалы. В сочетании с наименьшим значением означает ваше стремление
    привлечь внимание к особенно низкой степени данной  характеристики. Для
    литеральных переменных означает более низкую чем обычно степень выбранного
    значения. (Используется в дополнение к указанному ранее значению и
    непосредственно после него).

    Пример: lng3-fr- - 'Английский язык знаю ниже среднего, немного знаю
                        французский.'\n"
	echo -e "* - 'примечание'\n
    Означает, что указанный стандартный ответ требует дальнейшего уточнения
    и справедлив только в некоторой его подобласти (используется в дополнение 
    к указанному ранее значению и непосредственно после него). Этот символ 
    служит для собеседника предупреждением о том, что приведённые сведения 
    требуют дальнейшего уточнения посредством естественного языка.

    Пример: wrz4* - 'У меня большой фонд компьютерной информации, но не 
                     вообще, а только особых видов.'\n"

	echo -e "$ - 'вынужденно'\n
    Означает, что данная характеристика вынуждена под влиянием обстоятельств 
    и не совпадает с вашим внутренним стремлением (используется в дополнение 
    к указанному ранее значению и непосредственно после него).

    Пример: ech1$ - 'Эхоконференции я читаю редко, поскольку  не  имею  для
                     этого достаточного времени.'\n"

	read -p "Нажмите Enter чтобы продолжить..." value
	
	clear
	echo -e "> - 'желание'\n
    Означает, что характеристика, которая следует непосредственно после 
    данного символа в виде 'основного представления величины', является не
    действительной, а только желаемой вами (для литеральных переменных 
    используется как самостоятельное значение, для относительных - в 
    дополнение к указанному действительному значению и непосредственно
    после него).

    Пример: petc>m - 'У меня есть кошка и ещё я планирую  завести  грызуна.'\n"

	echo -e "! - 'отказ'\n
    Указывает, что вы не желаете обсуждать данный вопрос  из принципиальных
    соображений (используется как самостоятельное значение или в дополнение
    к указанному ранее значению и непосредственно после него). Этот символ
    служит для собеседника предупреждением.

    Пример: God!  - 'Тему вероисповедания я предпочёл бы не обсуждать.'\n"

	 echo -e "% - 'вербовщик'\n
    Указывает, что через вас можно связаться с активистом в деятельности,
    ассоциируемой со смыслом токена. (Используется в дополнение к 
    указанному ранее значению и непосредственно после него).

    Пример: god1% - 'Я большой противник религии и через меня можно
                     связаться с ещё большим активистом в этом деле.'\n"
	
	read -p "Нажмите Enter чтобы продолжить..." value
	
	clear
	echo -e "=<s> - 'заслуги'\n
    Для ряда токенов (по смыслу) через относительный параметр s указывает
    оценку результатов вашей деятельности на данном поприще. (Используется 
    в дополнение к указанному ранее значению и непосредственно после него).

    Пример: xsc4=3 - 'Я положительно отношусь к непризнанным наукам, и у
                      меня есть некоторое количество наработок в этой сфере.'\n"
	echo -e "< - 'внимание'\n
    Означает, ваше стремление обратить особое внимание на данную характеристику 
    (используется в дополнение к указанному ранее значению и непосредственно 
    после него).

    Пример: arg5< - 'Имейте в виду, что меня даже не стоит пытаться в чём-либо 
                     переубедить: вам же будет хуже.'\n"
	read -p "Нажмите Enter чтобы продолжить..." value
	
	clear

}

start
