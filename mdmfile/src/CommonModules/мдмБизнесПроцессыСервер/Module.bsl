
#Область ПрограммныйИнтерфейс

Функция ПроверитьСхему(БизнесПроцесс) Экспорт
	
	Возврат Справочники.мдмБизнесПроцессы.ПроверитьСхему(БизнесПроцесс);
	
КонецФункции	

Процедура ВзятьЗадачиВРаботу(Задачи) Экспорт
	
	Для Каждого Задача из Задачи Цикл
		
		Задача.ПолучитьОбъект().ВзятьВРаботу();
		
	КонецЦикла;	
	
КонецПроцедуры	

Процедура ПрерватьПроцессы(Задачи) Экспорт
	
	Для Каждого Задача из Задачи Цикл
		
		Задача.ПолучитьОбъект().ПрерватьПроцесс();
		
	КонецЦикла;	
	
КонецПроцедуры	

Функция ПолучитьОбъектПроцессаОбработки(Процесс) Экспорт
	
	Объект = Процесс.ПолучитьОбъект();
	Объект.ДополнительныеСвойства.Вставить("ДанныеПроцесса", мдмХранилищеДанных.ПолучитьОбъект(Объект.Данные));
	
	Возврат Объект;
	
КонецФункции	

Процедура ВыполнитьКодСобытияЗаполненияПроцессаОбработки(Знач Код, Объект, Предмет) Экспорт
	
	Выполнить Код;	
	
КонецПроцедуры	

#КонецОбласти