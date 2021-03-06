
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если ТипЗнч(Объект.Владелец) = Тип("СправочникСсылка.мдмФормыДанных") тогда
		МетаданныеФормы = мдмКэшируемыеФункции.МетаданныеФормыДанных(Объект.Владелец, мдмМетаданные.ВерсияМетаданных());
		СхемаКомпоновкиДанных = Справочники.мдмОтборы.СоздатьСхемуКомпоновкиДанных(МетаданныеФормы.СхемаДанных.Реквизиты, МетаданныеФормы.Реквизиты);
	ИначеЕсли ТипЗнч(Объект.Владелец) = Тип("СправочникСсылка.мдмБизнесПроцессы") Тогда 
		МетаданныеОбъекта = мдмКэшируемыеФункции.МетаданныеОбъекта(Объект.Владелец.СхемаДанных, мдмМетаданные.ВерсияМетаданных());
		СхемаКомпоновкиДанных = Справочники.мдмОтборы.СоздатьСхемуКомпоновкиДанных(МетаданныеОбъекта.Реквизиты);
	КонецЕсли;	
		
	АдресСхемы = ПоместитьВоВременноеХранилище(СхемаКомпоновкиДанных, УникальныйИдентификатор);
	
	КомпоновщикНастроек.Инициализировать(Новый ИсточникДоступныхНастроекКомпоновкиДанных(АдресСхемы));
	
	Если ЗначениеЗаполнено(Объект.Отбор) тогда
		Отбор = мдмОбщегоНазначенияСервер.ДесериализоватьИзXML(Объект.Отбор);
		мдмОбщегоНазначенияКлиентСервер.ВосстановитьОтбор(КомпоновщикНастроек.Настройки.Отбор, Отбор);
	КонецЕсли;	
	
КонецПроцедуры

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	
	ТекущийОбъект.Отбор = мдмОбщегоНазначенияСервер.СериализоватьВXML(КомпоновщикНастроек.Настройки.Отбор);
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#КонецОбласти