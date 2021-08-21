
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	НастройкаПодсказок();
	
КонецПроцедуры

&НаСервере
Процедура НастройкаПодсказок()
	
	Элементы.АлгоритмКлиент.РасширеннаяПодсказка.Заголовок = мдмКонструкторФормыКлиентСервер.ФорматированнаяСтрока(
		НСтр("ru = '<b>Клиентская часть алгоритма команды.</b>
		            |
					|<b>Контекст</b>:
					|	Форма - УправляемаяФорма - форма, в которой выполняется команда.
					|	Команда - Строка - имя выполняемой команды.'")	
		);
		
	Элементы.АлгоритмСервер.РасширеннаяПодсказка.Заголовок = мдмКонструкторФормыКлиентСервер.ФорматированнаяСтрока(
		НСтр("ru = '<b>Серверная часть алгоритма команды.</b>
		            |
					|<b>Контекст</b>:
					|	Форма - УправляемаяФорма - форма, в которой выполняется команда.
					|	Команда - Строка - имя выполняемой команды.'")	
		);
		
		
КонецПроцедуры	

