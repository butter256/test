
#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ПрограммныйИнтерфейс

Функция ТочкаСтарт(БизнесПроцесс) Экспорт
	
	Перем Точка;
	
	Выборка = Справочники.мдмТочкиСтарт.Выбрать(, БизнесПроцесс);
	Если Выборка.Следующий() тогда
		Точка = Выборка.Ссылка;
	Иначе 
		ВызватьИсключение "Не найдена точка страта.";
	КонецЕсли;	
		
	Возврат Точка;
	
КонецФункции	

Функция ПроверитьСхему(БизнесПроцесс) Экспорт
	
	Результат = Истина;
	
	Карта = БизнесПроцесс.Карта.Получить();
	
	Если Карта = Неопределено тогда
		
		Сообщить("Не настроена карта маршрута.");
		
		Результат = Ложь;
		
	Иначе 	
		
		Для Каждого ЭлементСхемы из Карта.ЭлементыГрафическойСхемы цикл
			
			Если ТипЗнч(ЭлементСхемы) = Тип("ЭлементГрафическойСхемыСоединительнаяЛиния") 
				ИЛИ ТипЗнч(ЭлементСхемы) = Тип("ЭлементГрафическойСхемыДекоративнаяЛиния") тогда	
				
				Продолжить;
				
			КонецЕсли;
			
			МенеджерТочки = мдмТочкиБизнесПроцесса.МенеджерТочки(ЭлементСхемы);
			
			Точка = МенеджерТочки.ПолучитьПоИмени(ЭлементСхемы.Имя, БизнесПроцесс);
			
			Если ЗначениеЗаполнено(Точка) тогда
				
				Результат = Результат И Точка.ПолучитьОбъект().ПроверитьТочку();
				
			Иначе 
				
				Результат = Ложь;
				
				Сообщить("Точка схемы " + ЭлементСхемы.Наименование + " не настроена.");
				
			КонецЕсли;	
			
		КонецЦикла;	
		
	КонецЕсли;	
	
	Возврат Результат;
	
КонецФункции	

#КонецОбласти

#КонецЕсли
