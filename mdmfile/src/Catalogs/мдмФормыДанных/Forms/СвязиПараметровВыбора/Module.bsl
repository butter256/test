
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Перем Связи;
	
	Параметры.Свойство("Связи", Связи);
	
	Если ТипЗнч(Связи) = Тип("Строка") И СтрНайти(Связи, ";") > 0 тогда
		
		Связи = СтрЗаменить(Связи, ";", Символы.ПС);
		
		ИмяПараметра = СтрПолучитьСтроку(Связи, 1);
		ПутьКДанным = СтрПолучитьСтроку(Связи, 2);
		
	КонецЕсли;	
	
КонецПроцедуры

&НаКлиенте
Процедура Установить(Команда)
	
	ОповеститьОВыборе(?(ЗначениеЗаполнено(ИмяПараметра) И ЗначениеЗаполнено(ПутьКДанным), "" + ИмяПараметра + ";" + ПутьКДанным, ""));
	
КонецПроцедуры
