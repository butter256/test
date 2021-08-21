
Перем Данные Экспорт;
Перем БизнесПроцессОбъект;
Перем ТочкаОбъект;
Перем Выполнение;

#Область ОбработчикиСобытий

Процедура ВзятьВРаботу() Экспорт
	
	НачатьТранзакцию();
	Попытка
		
		Блокировка = Новый БлокировкаДанных;
		ЭлементБлокировки = Блокировка.Добавить("Задача.мдмЗадачаОбработки");
		ЭлементБлокировки.УстановитьЗначение("Ссылка", Ссылка);
		ЭлементБлокировки.Режим = РежимБлокировкиДанных.Исключительный;
		Блокировка.Заблокировать();		
		
		Если Выполнена тогда
			ВызватьИсключение "Задача уже выполнена";
		ИначеЕсли ЗначениеЗаполнено(Исполнитель) тогда
			ВызватьИсключение "Задача уже взята в работу пользователем " + Исполнитель;
		КонецЕсли;	
		
		Исполнитель = ПараметрыСеанса.ТекущийПользователь;
		
		Записать();
		
		ЗафиксироватьТранзакцию();
		
	Исключение
		
		ОтменитьТранзакцию();
		
		мдмОбщегоНазначенияКлиентСервер.СообщитьОбОшибке(КраткоеПредставлениеОшибки(ИнформацияОбОшибке()), Ссылка);
		
	КонецПопытки;	
	
КонецПроцедуры	

Процедура ПрерватьПроцесс() Экспорт
	
	НачатьТранзакцию();
	Попытка
		
		Блокировка = Новый БлокировкаДанных;
		ЭлементБлокировки = Блокировка.Добавить("Задача.мдмЗадачаОбработки");
		ЭлементБлокировки.УстановитьЗначение("Ссылка", Ссылка);
		ЭлементБлокировки.Режим = РежимБлокировкиДанных.Исключительный;
		Блокировка.Заблокировать();		
		
		Если Выполнена тогда
			ВызватьИсключение "Задача уже выполнена";
		ИначеЕсли ПрерватьПроцесс тогда
			ВызватьИсключение "Процесс уже прерван";
		КонецЕсли;	
		
		ПрерватьПроцесс = Истина;
		
		Записать();
		
		ЗафиксироватьТранзакцию();
		
	Исключение
		
		ОтменитьТранзакцию();
		
		мдмОбщегоНазначенияКлиентСервер.СообщитьОбОшибке(КраткоеПредставлениеОшибки(ИнформацияОбОшибке()), Ссылка);
		
	КонецПопытки;	
	
КонецПроцедуры	

#КонецОбласти

#Область ОбработчикиСобытий

Процедура ОбработкаПроверкиВыполнения(Результат)
	
	ТочкаОбъект().ОбработкаПроверкиВыполнения(БизнесПроцессОбъект(), ЭтотОбъект, Результат);
	
КонецПроцедуры

Процедура ПередВыполнением(Отказ)
	
	Исполнитель = ПараметрыСеанса.ТекущийПользователь;
	
	ТочкаОбъект().ПередВыполнением(БизнесПроцессОбъект(), ЭтотОбъект);
	
КонецПроцедуры

Процедура ПриВыполнении(Отказ)
	
	ТочкаОбъект().ПриВыполнении(БизнесПроцессОбъект(), ЭтотОбъект);
	
КонецПроцедуры

Процедура ПередЗаписью(Отказ)
	
	Прерывание = ПрерватьПроцесс И Не Ссылка.ПрерватьПроцесс;	
	
	Выполнение = Выполнена И Не Ссылка.Выполнена;
	
	Если (Выполнение ИЛИ Прерывание) И Не ПроверитьЗавершениеВложенногоПроцесса() тогда
		
		Отказ = Истина;
		
	КонецЕсли;	
	
КонецПроцедуры

Процедура ПриЗаписи(Отказ)
	
	Перем ДанныеБизнесПроцесса;
	
	Если ПрерватьПроцесс тогда
		
		БизнесПроцессОбъект().Прерван = Истина;
		
		ТочкаОбъект().ПриЗавершенииРаботыТочки(БизнесПроцессОбъект());	
		
		БизнесПроцессОбъект().Записать();
		
	ИначеЕсли Выполнение тогда
		
		ТочкаОбъект().ПриЗавершенииРаботыТочки(БизнесПроцессОбъект());	
		
		БизнесПроцессОбъект().Записать();
		
	ИначеЕсли ДополнительныеСвойства.Свойство("ДанныеПроцесса") тогда 
		
		мдмХранилищеДанных.ЗаписатьОбъект(ДополнительныеСвойства.ДанныеПроцесса);
		
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция БизнесПроцессОбъект()
	
	Если БизнесПроцессОбъект = Неопределено тогда
		
		БизнесПроцессОбъект = БизнесПроцесс.ПолучитьОбъект();
		
	КонецЕсли;	
	
	Если ДополнительныеСвойства.Свойство("ДанныеПроцесса") тогда 
		
		БизнесПроцессОбъект.ДополнительныеСвойства.Вставить("ДанныеПроцесса", ДополнительныеСвойства.ДанныеПроцесса);
		
	КонецЕсли; 
	
	Возврат БизнесПроцессОбъект;
	
КонецФункции	

Функция ТочкаОбъект()
	
	Если ТочкаОбъект = Неопределено тогда
		
		ТочкаОбъект = ТочкаБизнесПроцесса.ПолучитьОбъект();
		
	КонецЕсли;	
	
	Возврат ТочкаОбъект;
	
КонецФункции	

Функция ПроверитьЗавершениеВложенногоПроцесса()
	
	Результат = Истина;
	
	Если ТипЗнч(ТочкаБизнесПроцесса) = Тип("СправочникСсылка.мдмТочкиВложенныйПроцесс") тогда
		
		ВложенныйПроцесс = БизнесПроцессы.мдмПроцессОбработки.НайтиПоРеквизиту("ВедущаяЗадача", Ссылка);
		
		Если ЗначениеЗаполнено(ВложенныйПроцесс) И Не ВложенныйПроцесс.Завершен тогда
			
			Результат = Ложь;
			
			Сообщение = Новый СообщениеПользователю;
			Сообщение.Текст = "Не завершен вложенный бизнес-процесс " + ВложенныйПроцесс;
			Сообщение.КлючДанных = ВложенныйПроцесс;
			Сообщение.Сообщить();
			
		КонецЕсли;	
		
	КонецЕсли;	
	
	Возврат Результат;
	
КонецФункции	

#КонецОбласти



