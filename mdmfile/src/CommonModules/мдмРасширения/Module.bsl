
#Область ПрограммныйИнтерфейс

Функция ПолучитьСписокРасширений() Экспорт
	
	Результат = Новый Массив;
	
	Расширения = РасширенияКонфигурации.Получить(, ИсточникРасширенийКонфигурации.СеансАктивные);
	
	Для Каждого Расширение из Расширения цикл
		Результат.Добавить(Расширение.Имя);
	КонецЦикла;	
	
	Возврат Результат;
	
КонецФункции

Функция МетаданныеРасширения(ИмяРасширения) Экспорт
	
	Перем Результат;
	
	Расширения = РасширенияКонфигурации.Получить(Новый Структура("Имя", ИмяРасширения), ИсточникРасширенийКонфигурации.СеансАктивные);
	
	Если Расширения.Количество() тогда
		Результат = Новый ОбъектМетаданныхКонфигурация(Расширения[0].ПолучитьДанные());
	КонецЕсли;	
	
	Возврат Результат;
	
КонецФункции

Функция СправочникиРасширения(ИмяРасширения) Экспорт
	
	Результат = Новый Массив;
	
	МетаданныеРасширения = МетаданныеРасширения(ИмяРасширения);	
	
	Если МетаданныеРасширения <> Неопределено тогда
		
		Для Каждого Справочник из МетаданныеРасширения.Справочники цикл
			Результат.Добавить(Справочник.Имя);
		КонецЦикла;	
		
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции	

Функция МетаданныеСправочникаРасширения(ИмяСправочника, Расширение) Экспорт
	
	Перем Результат;
	
	Если ТипЗнч(Расширение) = Тип("Строка") тогда
		МетаданныеРасширения = МетаданныеРасширения(Расширение);	
	Иначе 
		МетаданныеРасширения = Расширение;	
	КонецЕсли;	
	
	Если ТипЗнч(МетаданныеРасширения) = Тип("ОбъектМетаданныхКонфигурация") тогда
		
		Попытка
			Результат = МетаданныеРасширения.Справочники[ИмяСправочника];
		Исключение
			ВызватьИсключение "Расширение " + МетаданныеРасширения.Имя + " не содержит справочника " + ИмяСправочника;
		КонецПопытки;	
		
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции	

#КонецОбласти

#Область СлужебныеПроцедурыИФункции



#КонецОбласти
