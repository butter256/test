
#Область ПрограммныйИнтерфейс

Процедура ВзятьЗадачиВРаботу(Задачи) Экспорт
	
	мдмБизнесПроцессыСервер.ВзятьЗадачиВРаботу(Задачи);	
	
КонецПроцедуры	

Процедура ПрерватьПроцессы(Задачи) Экспорт
	
	мдмБизнесПроцессыСервер.ПрерватьПроцессы(Задачи);	
	
КонецПроцедуры	

Функция КоличествоБизнесПроцессов(ПолноеИмяМетаданных) Экспорт
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	КОЛИЧЕСТВО(РАЗЛИЧНЫЕ БизнесПроцессы.Ссылка) КАК Количество
		|ИЗ
		|	Справочник.мдмБизнесПроцессы КАК БизнесПроцессы
		|ГДЕ
		|	БизнесПроцессы.ПолноеИмяМетаданныхПредмета = &ПолноеИмяМетаданных
		|	И БизнесПроцессы.ПометкаУдаления = ЛОЖЬ
		|	И БизнесПроцессы.Использовать";
	
	Запрос.УстановитьПараметр("ПолноеИмяМетаданных", ПолноеИмяМетаданных);
	
	Выборка = Запрос.Выполнить().Выбрать();
	Выборка.Следующий();
	
	Возврат Выборка.Количество;
	
КонецФункции	

Функция БизнесПроцесс(ПолноеИмяМетаданных) Экспорт
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ ПЕРВЫЕ 1
		|	БизнесПроцессы.Ссылка КАК Ссылка
		|ИЗ
		|	Справочник.мдмБизнесПроцессы КАК БизнесПроцессы
		|ГДЕ
		|	БизнесПроцессы.ПолноеИмяМетаданныхПредмета = &ПолноеИмяМетаданных
		|	И БизнесПроцессы.ПометкаУдаления = ЛОЖЬ
		|	И БизнесПроцессы.Использовать";
	
	Запрос.УстановитьПараметр("ПолноеИмяМетаданных", ПолноеИмяМетаданных);
	
	Выборка = Запрос.Выполнить().Выбрать();
	Если Выборка.Следующий() тогда
		Возврат Выборка.Ссылка;
	КонецЕсли;
	
	Возврат Неопределено;
	
КонецФункции	

#КонецОбласти
