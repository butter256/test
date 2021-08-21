
#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОбработчикиСобытийФормы

Процедура ОбработкаПолученияПредставления(Данные, Представление, СтандартнаяОбработка)
	
	мдмБизнесПроцессыСобытия.ОбработкаПолученияПредставления(Данные, Представление, СтандартнаяОбработка)
	
КонецПроцедуры

#КонецОбласти

#Область ПрограммныйИнтерфейс

Функция ПолучитьПоИмени(Имя, БизнесПроцесс) Экспорт
	
	Возврат ЭтотОбъект().НайтиПоРеквизиту("Имя", Имя,, БизнесПроцесс);
	
КонецФункции

Функция СоздатьОбновитьТочки(Точка, Элемент, БизнесПроцесс) Экспорт
	
	Возврат мдмТочкиБизнесПроцесса.СоздатьОбновитьТочки(ЭтотОбъект(), Точка, Элемент, БизнесПроцесс);
	
КонецФункции	

Функция ОбновитьСвязиТочки(Точка, ТаблицаСвязей) Экспорт

	Возврат мдмТочкиБизнесПроцесса.ОбновитьСвязиТочки(ЭтотОбъект(), Точка, ТаблицаСвязей);
	
КонецФункции	

Функция ЭтотОбъект() Экспорт
	
	Возврат Справочники.мдмТочкиРазделение;
	
КонецФункции	

Функция ЕстьВходы() Экспорт
	Возврат Истина;
КонецФункции	

Функция ЕстьВыходы() Экспорт
	Возврат Истина;
КонецФункции	

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#КонецОбласти

#КонецЕсли