
#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОбработчикиСобытий

Процедура ПередЗаписью(Отказ)
	
КонецПроцедуры

#КонецОбласти

#Область ПрограммныйИнтерфейс

Функция КлючОбъекта() Экспорт
	Возврат "Имя,Владелец";
КонецФункции	

Процедура ПередСтартом(ПроцессОбработкиОбъект) Экспорт
	
	Отказ = Ложь;
	
	ИмяСобытия = "ПередСтартом";
	
	Контекст = Новый Структура;
	Контекст.Вставить("Объект", ПроцессОбработкиОбъект);
	
	мдмТочкиБизнесПроцесса.ВыполнитьСобытие(Ссылка, ИмяСобытия, Контекст, Отказ);
	
	Если Отказ тогда
		ВызватьИсключение мдмТочкиБизнесПроцесса.ОписаниеОшибкиВыполненияСобытия(Ссылка, ИмяСобытия, "Не удалось стартовать " + ПроцессОбработкиОбъект.Ссылка); 
	КонецЕсли;	
	
КонецПроцедуры	

Процедура ПриНачалеРаботыТочки(ПроцессОбработкиОбъект) Экспорт
	
	ПередСтартом(ПроцессОбработкиОбъект);
	
	ПриЗавершенииРаботыТочки(ПроцессОбработкиОбъект);
	
КонецПроцедуры	

Процедура ПриЗавершенииРаботыТочки(ПроцессОбработкиОбъект) Экспорт

	Для Каждого СтрокаВыходы из Выходы Цикл 
		
		СтрокаВыходы.Точка.ПолучитьОбъект().ПриНачалеРаботыТочки(ПроцессОбработкиОбъект);	
		
	КонецЦикла;	
	
	ПроцессОбработкиОбъект.УстановитьПризнакСтартован();
	
КонецПроцедуры	

Функция ПроверитьТочку() Экспорт
	
	Результат = Истина;
	
	Если Выходы.Количество() = 0 Тогда
		Результат = Ложь;
		СообщитьОбОшибке("Не заполнена точка выхода.");
	ИначеЕсли Выходы.Количество() > 1 Тогда
		Результат = Ложь;
		СообщитьОбОшибке("Может быть только одна точка выхода.");
	КонецЕсли;	
	
	Возврат Результат;
		
КонецФункции	

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура СообщитьОбОшибке(Сообщение)
	
	мдмОбщегоНазначенияКлиентСервер.СообщитьОбОшибке("Точка """ + Ссылка + """. " + Сообщение, Ссылка);
	
КонецПроцедуры	

#КонецОбласти

#Иначе
  ВызватьИсключение НСтр("ru = 'Недопустимый вызов объекта на клиенте.'");
#КонецЕсли