
#Область ПрограммныйИнтерфейс

Процедура НачатьПроцессИзменения(Предмет) Экспорт
	
	ПолноеИмяМетаданных = мдмОбщегоНазначенияВызовСервера.ПолноеИмяМетаданных(Предмет);
	
	Оповещение = Новый ОписаниеОповещения("НачатьПроцессИзмененияЗавершение", 
		ЭтотОбъект, 
		Новый Структура("Предмет", Предмет)
	);
	
	Если мдмБизнесПроцессыВызовСервера.КоличествоБизнесПроцессов(ПолноеИмяМетаданных) = 1 тогда
		
		ВыполнитьОбработкуОповещения(
			Оповещение, 
			мдмБизнесПроцессыВызовСервера.БизнесПроцесс(ПолноеИмяМетаданных)
		);
			
	ИначеЕсли мдмБизнесПроцессыВызовСервера.КоличествоБизнесПроцессов(ПолноеИмяМетаданных) > 1 тогда	
		
		ПараметрыФормы = Новый Структура;
		ПараметрыФормы.Вставить("ПолноеИмяМетаданных", ПолноеИмяМетаданных);
		
		ОткрытьФорму("Справочник.мдмБизнесПроцессы.Форма.ФормаВыбораБизнесПроцесса", 
			ПараметрыФормы,,,,,
			Оповещение, 
			РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);	
		
	Иначе 
		
		ПоказатьПредупреждение(, "Не найдено бизнес-процесса для справочника.");
		
	КонецЕсли;	
	
КонецПроцедуры

Процедура НачатьПроцессИзмененияЗавершение(Результат, ДополнительныеПараметры) Экспорт
	
	Если ЗначениеЗаполнено(Результат) тогда
		
		ЗначенияЗаполнения = Новый Структура;
		ЗначенияЗаполнения.Вставить("БизнесПроцесс", Результат);
		ЗначенияЗаполнения.Вставить("Предмет", ДополнительныеПараметры.Предмет);
		
		ПараметрыФормы = Новый Структура;
		ПараметрыФормы.Вставить("ЗначенияЗаполнения", ЗначенияЗаполнения);
		
		ОткрытьФорму("БизнесПроцесс.мдмПроцессОбработки.Форма.ФормаЗаявки", 
			ПараметрыФормы,,,,,, РежимОткрытияОкнаФормы.Независимый);	
		
	КонецЕсли;	
	
КонецПроцедуры	

Процедура НачатьПроцессСоздания(ПолноеИмяМетаданных) Экспорт
	
	Оповещение = Новый ОписаниеОповещения("НачатьПроцессСозданияЗавершение", ЭтотОбъект);
	
	Если мдмБизнесПроцессыВызовСервера.КоличествоБизнесПроцессов(ПолноеИмяМетаданных) = 1 тогда
		
		ВыполнитьОбработкуОповещения(
			Оповещение, 
			мдмБизнесПроцессыВызовСервера.БизнесПроцесс(ПолноеИмяМетаданных)
		);
			
	ИначеЕсли мдмБизнесПроцессыВызовСервера.КоличествоБизнесПроцессов(ПолноеИмяМетаданных) > 1 тогда	
		
		ПараметрыФормы = Новый Структура;
		ПараметрыФормы.Вставить("ПолноеИмяМетаданных", ПолноеИмяМетаданных);
		
		ОткрытьФорму("Справочник.мдмБизнесПроцессы.Форма.ФормаВыбораБизнесПроцесса", 
			ПараметрыФормы,,,,,
			Оповещение, 
			РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);	
		
	Иначе 
		
		ПоказатьПредупреждение(, "Не найдено бизнес-процесса для справочника.");
		
	КонецЕсли;	
	
КонецПроцедуры

Процедура НачатьПроцессСозданияЗавершение(Результат, ДополнительныеПараметры) Экспорт
	
	Если ЗначениеЗаполнено(Результат) тогда
		
		ЗначенияЗаполнения = Новый Структура;
		ЗначенияЗаполнения.Вставить("БизнесПроцесс", Результат);
		
		ПараметрыФормы = Новый Структура;
		ПараметрыФормы.Вставить("ЗначенияЗаполнения", ЗначенияЗаполнения);
		
		ОткрытьФорму("БизнесПроцесс.мдмПроцессОбработки.Форма.ФормаЗаявки", 
			ПараметрыФормы,,,,,, РежимОткрытияОкнаФормы.Независимый);	
		
	КонецЕсли;	
	
КонецПроцедуры

#КонецОбласти