
Перем ДанныеПроцесса;
Перем ОбъектПредмета;

#Область ПрограммныйИнтерфейс

Функция ПолучитьДанныеПроцесса() Экспорт
	
	Если Не ДополнительныеСвойства.Свойство("ДанныеПроцесса", ДанныеПроцесса) тогда	
		
		Если ЗначениеЗаполнено(Данные) тогда
			ДанныеПроцесса = мдмХранилищеДанных.ПолучитьОбъект(Данные);
		Иначе 
			МетаданныеОбъекта = мдмКэшируемыеФункции.МетаданныеОбъекта(БизнесПроцесс.СхемаДанных, мдмМетаданные.ВерсияМетаданных());
			ДанныеПроцесса = мдмХранилищеДанных.СоздатьОбъект(МетаданныеОбъекта);	
		КонецЕсли;
		
		ДополнительныеСвойства.Вставить("ДанныеПроцесса", ДанныеПроцесса);
		
	КонецЕсли;	
	
	Возврат ДанныеПроцесса;
	
КонецФункции	

Функция ПолучитьПредметПроцесса() Экспорт
	
	Если ЗначениеЗаполнено(Предмет) тогда
		ОбъектПредмета = Предмет.ПолучитьОбъект();
	Иначе 
		ОбъектПредмета = СоздатьПредмет();
	КонецЕсли;	
	
	Возврат ОбъектПредмета;
	
КонецФункции	

Процедура УстановитьПризнакСтартован() Экспорт 
	
	Если Стартован тогда
		
		ДополнительныеСвойства.Удалить("УстановкаПризнакаСтартован");
		
		Возврат;
		
	КонецЕсли;	
	
	Стартован = Истина;
	
	ДополнительныеСвойства.Вставить("УстановкаПризнакаСтартован");
	
	Записать();
	
	ДополнительныеСвойства.Удалить("УстановкаПризнакаСтартован");
	
КонецПроцедуры	

Процедура УстановитьПризнакЗавершен() Экспорт 
	
	Если Завершен тогда
		
		ДополнительныеСвойства.Удалить("УстановкаПризнакаЗавершен");
		
		Возврат;
		
	КонецЕсли;	
	
	Завершен = Истина;
	
	ДополнительныеСвойства.Вставить("УстановкаПризнакаЗавершен");
	
	Записать();
	
	ДополнительныеСвойства.Удалить("УстановкаПризнакаЗавершен");
	
	Если ЗначениеЗаполнено(ВедущаяЗадача) тогда
		ВедущаяЗадача.ПолучитьОбъект().ВыполнитьЗадачу();
	КонецЕсли;	
	
КонецПроцедуры	

Функция ПолучитьКартуБизнесПроцесса() Экспорт
	
	Карта = БизнесПроцесс.Карта.Получить();
	
	СчетчикТочек = Новый Структура;
	
	ВыполненыеЗадачи = БизнесПроцессы.мдмПроцессОбработки.ВыполненныеТочкиБизнесПроцесса(Ссылка);	
	
	Для Каждого Задача из ВыполненыеЗадачи цикл
		
		Если Карта.ЭлементыГрафическойСхемы.Найти(Задача.ИмяТочки) <> Неопределено тогда
			
			Если Не СчетчикТочек.Свойство(Задача.ИмяТочки) тогда
				СчетчикТочек.Вставить(Задача.ИмяТочки, 0);	
			КонецЕсли;	
			
			СчетчикТочек[Задача.ИмяТочки] = СчетчикТочек[Задача.ИмяТочки] + 1;
			
			ЭлементСхемы = Карта.ЭлементыГрафическойСхемы[Задача.ИмяТочки];
			
			Если ТипЗнч(ЭлементСхемы) = Тип("ЭлементГрафическойСхемыДействие") тогда
				ЭлементСхемы.Пояснение = Задача.Исполнитель;	
			КонецЕсли;	
			
			ЭлементСхемы.ЦветФона = WebЦвета.СеребристоСерый;
			
			Если СчетчикТочек[Задача.ИмяТочки] > 1 Тогда
				ЭлементСхемы.Групповая = Истина;
			КонецЕсли;	
			
		КонецЕсли;	
		
	КонецЦикла;	
	
	ТекущиеЗадачи = БизнесПроцессы.мдмПроцессОбработки.ТекущиеТочкиБизнесПроцесса(Ссылка);	
	
	Для Каждого Задача из ТекущиеЗадачи цикл
		
		Если Карта.ЭлементыГрафическойСхемы.Найти(Задача.ИмяТочки) <> Неопределено тогда
			
			Если Не СчетчикТочек.Свойство(Задача.ИмяТочки) тогда
				СчетчикТочек.Вставить(Задача.ИмяТочки, 0);	
			КонецЕсли;	
			
			СчетчикТочек[Задача.ИмяТочки] = СчетчикТочек[Задача.ИмяТочки] + 1;
			
			ЭлементСхемы = Карта.ЭлементыГрафическойСхемы[Задача.ИмяТочки];
			
			Если ТипЗнч(ЭлементСхемы) = Тип("ЭлементГрафическойСхемыДействие") тогда
				ЭлементСхемы.Пояснение = Задача.Исполнитель;	
			КонецЕсли;	
			
			ЭлементСхемы.ЦветФона = ЦветаСтиля.ЦветФонаПодсказки;
			ЭлементСхемы.Рамка = Новый Линия(ТипСоединительнойЛинии.Пунктир, 2);
			ЭлементСхемы.ЦветРамки = WebЦвета.Красный;
			
			Если СчетчикТочек[Задача.ИмяТочки] > 1 Тогда
				ЭлементСхемы.Групповая = Истина;
			КонецЕсли;	
			
		КонецЕсли;	
		
	КонецЦикла;	
	
	Возврат Карта;
	
КонецФункции	

#КонецОбласти

#Область ОбработчикиСобытий

Процедура ОбработкаЗаполнения(ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка)
	
	Перем Объект;
	
	Если ТипЗнч(ДанныеЗаполнения) = Тип("Структура") И ДанныеЗаполнения.Свойство("ЗаполнениеДанныхЗаявки") тогда
	
		МетаданныеОбъекта = мдмКэшируемыеФункции.МетаданныеОбъекта(БизнесПроцесс.СхемаДанных, мдмМетаданные.ВерсияМетаданных());
		
		Объект = мдмХранилищеДанных.СоздатьОбъект(МетаданныеОбъекта, Не ЗначениеЗаполнено(Предмет));
		
		Если ЗначениеЗаполнено(БизнесПроцесс) И ЗначениеЗаполнено(Предмет) тогда
				
			ВыполнитьСобытиеЗаполненияДанныхБизнесПроцесса(БизнесПроцесс, Объект, Предмет);
			
		ИначеЕсли ЗначениеЗаполнено(БизнесПроцесс) тогда 
			
			Предмет = БизнесПроцесс.ТипПредмета.Получить().ПривестиЗначение(Предмет);
			
		КонецЕсли;	
		
		ДополнительныеСвойства.Вставить("ДанныеПроцесса", Объект);
		
	КонецЕсли;
	
КонецПроцедуры

Процедура ПередЗаписью(Отказ)
	
	Если ДополнительныеСвойства.Свойство("УстановкаПризнакаСтартован") 
		ИЛИ ДополнительныеСвойства.Свойство("УстановкаПризнакаЗавершен") Тогда
		Возврат;
	КонецЕсли;	
	
	Если ДополнительныеСвойства.Свойство("Старт") тогда
		
		Отказ = Не мдмБизнесПроцессыСервер.ПроверитьСхему(БизнесПроцесс);
		
	КонецЕсли;	
	
	Если ДополнительныеСвойства.Свойство("ДанныеПроцесса") тогда 
		
		Данные = мдмХранилищеДанных.ЗаписатьОбъект(ДополнительныеСвойства.ДанныеПроцесса);
		
	КонецЕсли;	
	
	Если ОбъектПредмета <> Неопределено тогда
		
		Предмет = ОбъектПредмета.Ссылка;
		
	КонецЕсли;	
	
КонецПроцедуры

Процедура ПриЗаписи(Отказ)
	
	Если ДополнительныеСвойства.Свойство("УстановкаПризнакаСтартован")
		ИЛИ ДополнительныеСвойства.Свойство("УстановкаПризнакаЗавершен") Тогда
		Возврат;
	КонецЕсли;	
	
	Если ДополнительныеСвойства.Свойство("Старт") тогда
		
		Если Стартован тогда
			ВызватьИсключение "Процесс уже стартован.";
		КонецЕсли;	
		
		ДополнительныеСвойства.Удалить("Старт");
		
		ТочкаСтарт = Справочники.мдмБизнесПроцессы.ТочкаСтарт(БизнесПроцесс);
		
		ТочкаСтарт.ПолучитьОбъект().ПриНачалеРаботыТочки(ЭтотОбъект);
		
	КонецЕсли;	
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция СоздатьПредмет()
	
	Если СтрНачинаетсяС(БизнесПроцесс.ПолноеИмяМетаданныхПредмета, "Справочник.") тогда
		ИмяСправочника = СтрЗаменить(БизнесПроцесс.ПолноеИмяМетаданныхПредмета, "Справочник.", "");
		Возврат Справочники[ИмяСправочника].СоздатьЭлемент();
	Иначе
		ВызватьИсключение "Неизвестный тип предмета";
	КонецЕсли;	
	
КонецФункции	

Процедура ВыполнитьСобытиеЗаполненияДанныхБизнесПроцесса(БизнесПроцесс, Объект, Предмет) Экспорт
	
	Попытка
		
		мдмБизнесПроцессыСервер.ВыполнитьКодСобытияЗаполненияПроцессаОбработки(БизнесПроцесс.ЗаполнениеДанныхБизнесПроцесса, Объект, Предмет);	
		
	Исключение
		
		ВызватьИсключение ОписаниеОшибкиВыполненияСобытия(БизнесПроцесс, "ЗаполнениеДанныхБизнесПроцесса", КраткоеПредставлениеОшибки(ИнформацияОбОшибке()));
		
	КонецПопытки;	
	
КонецПроцедуры	

Функция ОписаниеОшибкиВыполненияСобытия(БизнесПроцесс, Событие, ОписаниеОшибки) Экспорт
	
	ШаблонОшибки = "БизнесПроцесс [%1]. Cобытие [%2]. Ошибка: %3";
	
	Возврат СтрШаблон(ШаблонОшибки, БизнесПроцесс, Событие, ОписаниеОшибки);
	
КонецФункции

#КонецОбласти
