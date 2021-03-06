
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	УстановитьОтборПоСхеме();
	
	ЗаполнитьСписокРасширений();
	
	ЗаполнитьСписокСправочниковРасширения();
	
	НастройкаФормы();
	
КонецПроцедуры

&НаСервере
Процедура ПослеЗаписиНаСервере(ТекущийОбъект, ПараметрыЗаписи)
	
	УстановитьОтборПоСхеме();
	
	НастройкаФормы();
	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаВыбора(ВыбранноеЗначение, ИсточникВыбора)
	
	Если ВыбранноеЗначение <> Неопределено тогда
		
		ЗаполнитьСхемуПоИмениОбъектаМетаданных(ВыбранноеЗначение);	
		ОбновитьСписки();
		
	КонецЕсли;	
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовФормы

&НаКлиенте
Процедура ТабличныеЧастиПриАктивизацииСтроки(Элемент)
	
	ПодключитьОбработчикОжидания("УстановитьОтборПоТабличнойЧасти", 0.1, Истина);
		
КонецПроцедуры

&НаКлиенте
Процедура РеквизитПредставленияНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
	ДанныеВыбора = Новый СписокЗначений;
	ДанныеВыбора.ЗагрузитьЗначения(РеквизитыПредставления(Объект.Ссылка));
	
КонецПроцедуры

&НаКлиенте
Процедура ХранилищеПриИзменении(Элемент)
	
	ХранилищеПриИзмененииНаСервере();
	
КонецПроцедуры

&НаКлиенте
Процедура ХранилищеПриИзмененииНаСервере()
	
	НастройкаФормы();
	
	ЗаполнитьСписокРасширений();
	
КонецПроцедуры

&НаКлиенте
Процедура ИмяРасширенияПриИзменении(Элемент)
	
	ИмяРасширенияПриИзмененииНаСервере();
	
КонецПроцедуры

&НаСервере
Процедура ИмяРасширенияПриИзмененииНаСервере()
	
	ЗаполнитьСписокСправочниковРасширения();
	
	Если Элементы.ИмяОбъектаРасширения.СписокВыбора.НайтиПоЗначению(Объект.ИмяОбъектаРасширения) = Неопределено тогда
		
		Объект.ИмяОбъектаРасширения = Неопределено;	
		
	КонецЕсли;	
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура Заполнить(Команда)
	
	Если Объект.Хранилище = ПредопределенноеЗначение("Перечисление.мдмХранилищеДанных.Расширение") 
		И ЗначениеЗаполнено(Объект.ИмяРасширения) 
		И ЗначениеЗаполнено(Объект.ИмяОбъектаРасширения) тогда
		
		ЗаполнитьСхемуПоОбъектуРасширения(Объект.ИмяРасширения, Объект.ИмяОбъектаРасширения);	
	
	ИначеЕсли Не ЗначениеЗаполнено(Объект.ИмяМетаданныхКонфигурации) тогда
		
		мдмХранилищеДанныхКлиент.ВыбратьТипОбъектаМастерДанных(ЭтотОбъект);
		
	Иначе 
		
		ЗаполнитьСхемуПоИмениОбъектаМетаданных(Объект.ИмяМетаданныхКонфигурации);
		ОбновитьСписки();
		
	КонецЕсли;	
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура ЗаполнитьСхемуПоОбъектуРасширения(ИмяРасширения, ИмяОбъектаРасширения)
	
	МетаданныеРасширения = мдмРасширения.МетаданныеРасширения(Объект.ИмяРасширения);
	
	ОбъектМетаданных = мдмРасширения.МетаданныеСправочникаРасширения(ИмяОбъектаРасширения, МетаданныеРасширения);
	
	ЗаполнитьСхемуПоОбъектуМетаданных(ОбъектМетаданных, МетаданныеРасширения);
	
КонецПроцедуры	

&НаСервере
Процедура ЗаполнитьСхемуПоИмениОбъектаМетаданных(ПолноеИмя)
	
	ОбъектМетаданных = Метаданные.НайтиПоПолномуИмени(ПолноеИмя);
	
	ЗаполнитьСхемуПоОбъектуМетаданных(ОбъектМетаданных);
	
КонецПроцедуры	

&НаСервере
Процедура ЗаполнитьСхемуПоОбъектуМетаданных(ОбъектМетаданных, МетаданныеКонфигурации = Неопределено)
	
	Если ОбъектМетаданных = Неопределено тогда
		Возврат;
	КонецЕсли;	
	
	Если МетаданныеКонфигурации = Неопределено тогда
		МетаданныеКонфигурации = Метаданные;	
	КонецЕсли;	
	
	СвойстваОбъектов = МетаданныеКонфигурации.СвойстваОбъектов;
	
	Объект.Имя = ОбъектМетаданных.Имя;
	Объект.ИмяМетаданныхКонфигурации = ОбъектМетаданных.ПолноеИмя();
	Если ОбъектМетаданных.ОсновноеПредставление = СвойстваОбъектов.ОсновноеПредставлениеСправочника.ВВидеНаименования тогда	
		Объект.РеквизитПредставления = "Наименование";
	ИначеЕсли ОбъектМетаданных.ОсновноеПредставление = СвойстваОбъектов.ОсновноеПредставлениеСправочника.ВВидеКода тогда
		Объект.РеквизитПредставления = "Код";
	КонецЕсли;	
	Объект.Наименование = ОбъектМетаданных.Представление();
	
	Если Не ЗначениеЗаполнено(Объект.Ссылка) тогда
		
		СчетчикНайденных = 0;
		НайденныйЭлемент = Справочники.мдмСхемыДанных.НайтиПоРеквизиту("Имя", Объект.Имя);
		Пока Не НайденныйЭлемент.Пустая() цикл
			СчетчикНайденных = СчетчикНайденных + 1;
			НайденныйЭлемент = Справочники.мдмСхемыДанных.НайтиПоРеквизиту("Имя", Объект.Имя + XMLСтрока(СчетчикНайденных));
		КонецЦикла;	
		Если СчетчикНайденных > 0 тогда
			Объект.Имя = Объект.Имя + XMLСтрока(СчетчикНайденных);	
		КонецЕсли;	
		
		Если Не ЗначениеЗаполнено(Объект.Хранилище) тогда
			Объект.Хранилище = Перечисления.мдмХранилищеДанных.Общее;
		КонецЕсли;	
		
		Записать();
		
	КонецЕсли;	
	
	СтандартныеРеквизитыЗаполнения = Новый Массив;
	СтандартныеРеквизитыЗаполнения.Добавить("Код");
	СтандартныеРеквизитыЗаполнения.Добавить("Наименование");
	СтандартныеРеквизитыЗаполнения.Добавить("Родитель");
	СтандартныеРеквизитыЗаполнения.Добавить("Владелец");
	
	Для Каждого Реквизит из ОбъектМетаданных.СтандартныеРеквизиты цикл
		
		Если СтандартныеРеквизитыЗаполнения.Найти(Реквизит.Имя) = Неопределено тогда
			Продолжить;
		КонецЕсли;	
		
		РеквизитСхемы = Справочники.мдмРеквизиты.НайтиПоРеквизиту("Имя", Реквизит.Имя,, Объект.Ссылка);
		Если Не РеквизитСхемы.Пустая() тогда
			Продолжить;
		КонецЕсли;	
		
		РеквизитСхемыОбъект = Справочники.мдмРеквизиты.СоздатьЭлемент();
		РеквизитСхемыОбъект.Владелец = Объект.Ссылка;
		РеквизитСхемыОбъект.УстановитьНовыйКод();
		РеквизитСхемыОбъект.Имя = Реквизит.Имя;
		РеквизитСхемыОбъект.Синоним = Реквизит.Синоним;
		РеквизитСхемыОбъект.Тип = Новый ХранилищеЗначения(Реквизит.Тип);
		РеквизитСхемыОбъект.ПроверятьЗаполнение = ?(Реквизит.ПроверкаЗаполнения = ПроверкаЗаполнения.ВыдаватьОшибку, Истина, Ложь);
		РеквизитСхемыОбъект.ЗначениеЗаполнения = Реквизит.ЗначениеЗаполнения;
		
		РеквизитСхемыОбъект.Записать();
		
	КонецЦикла;	
	
	ИспользованиеОбщегоРеквизита = МетаданныеКонфигурации.СвойстваОбъектов.ИспользованиеОбщегоРеквизита;
	
	ПропускаемыеРеквизиты = Новый Массив;
	ПропускаемыеРеквизиты.Добавить("ДатаСоздания");
	ПропускаемыеРеквизиты.Добавить("ДатаИзменения");
	ПропускаемыеРеквизиты.Добавить("АвторСоздания");
	ПропускаемыеРеквизиты.Добавить("АвторИзменения");
	ПропускаемыеРеквизиты.Добавить("СхемаДанных");
	
	Для Каждого Реквизит из МетаданныеКонфигурации.ОбщиеРеквизиты цикл
		
		Если ПропускаемыеРеквизиты.Найти(Реквизит.Имя) <> Неопределено тогда
			Продолжить;
		КонецЕсли;	
		
		ЭлементСостава = Реквизит.Состав.Найти(ОбъектМетаданных);
		Если ЭлементСостава = Неопределено 
			ИЛИ Не ЭлементСостава.Использование = ИспользованиеОбщегоРеквизита.Использовать тогда
			Продолжить;
		КонецЕсли;	
		
		РеквизитСхемы = Справочники.мдмРеквизиты.НайтиПоРеквизиту("Имя", Реквизит.Имя,, Объект.Ссылка);
		Если Не РеквизитСхемы.Пустая() тогда
			Продолжить;
		КонецЕсли;	
		
		РеквизитСхемыОбъект = Справочники.мдмРеквизиты.СоздатьЭлемент();
		РеквизитСхемыОбъект.Владелец = Объект.Ссылка;
		РеквизитСхемыОбъект.УстановитьНовыйКод();
		РеквизитСхемыОбъект.Имя = Реквизит.Имя;
		РеквизитСхемыОбъект.Синоним = Реквизит.Синоним;
		РеквизитСхемыОбъект.Тип = Новый ХранилищеЗначения(Реквизит.Тип);
		РеквизитСхемыОбъект.ПроверятьЗаполнение = ?(Реквизит.ПроверкаЗаполнения = ПроверкаЗаполнения.ВыдаватьОшибку, Истина, Ложь);
		РеквизитСхемыОбъект.ЗначениеЗаполнения = Реквизит.ЗначениеЗаполнения;
		
		РеквизитСхемыОбъект.Записать();
		
	КонецЦикла;	
	
	ПропускаемыеРеквизиты = Новый Массив;
	ПропускаемыеРеквизиты.Добавить("СхемаДанных");
	
	Для Каждого Реквизит из ОбъектМетаданных.Реквизиты цикл
		
		Если ПропускаемыеРеквизиты.Найти(Реквизит.Имя) <> Неопределено тогда
			Продолжить;
		КонецЕсли;	
		
		РеквизитСхемы = Справочники.мдмРеквизиты.НайтиПоРеквизиту("Имя", Реквизит.Имя,, Объект.Ссылка);
		Если Не РеквизитСхемы.Пустая() тогда
			Продолжить;
		КонецЕсли;	
		
		РеквизитСхемыОбъект = Справочники.мдмРеквизиты.СоздатьЭлемент();
		РеквизитСхемыОбъект.Владелец = Объект.Ссылка;
		РеквизитСхемыОбъект.УстановитьНовыйКод();
		РеквизитСхемыОбъект.Имя = Реквизит.Имя;
		РеквизитСхемыОбъект.Синоним = Реквизит.Синоним;
		РеквизитСхемыОбъект.Тип = Новый ХранилищеЗначения(Реквизит.Тип);
		РеквизитСхемыОбъект.ПроверятьЗаполнение = ?(Реквизит.ПроверкаЗаполнения = ПроверкаЗаполнения.ВыдаватьОшибку, Истина, Ложь);
		РеквизитСхемыОбъект.ЗначениеЗаполнения = Реквизит.ЗначениеЗаполнения;
		
		РеквизитСхемыОбъект.Записать();
		
	КонецЦикла;	
	
	Для Каждого ТабличнаяЧасть из ОбъектМетаданных.ТабличныеЧасти цикл
		
		ТабличнаяЧастьСхемы = Справочники.мдмТабличныеЧасти.НайтиПоРеквизиту("Имя", ТабличнаяЧасть.Имя,, Объект.Ссылка);
		Если ТабличнаяЧастьСхемы.Пустая() тогда
		
			ТабличнаяЧастьСхемыОбъект = Справочники.мдмТабличныеЧасти.СоздатьЭлемент();
			ТабличнаяЧастьСхемыОбъект.Владелец = Объект.Ссылка;
			ТабличнаяЧастьСхемыОбъект.УстановитьНовыйКод();
			ТабличнаяЧастьСхемыОбъект.Имя = ТабличнаяЧасть.Имя;
			ТабличнаяЧастьСхемыОбъект.Синоним = ТабличнаяЧасть.Синоним;
			ТабличнаяЧастьСхемыОбъект.ПроверятьЗаполнение = ?(ТабличнаяЧасть.ПроверкаЗаполнения = ПроверкаЗаполнения.ВыдаватьОшибку, Истина, Ложь);
			ТабличнаяЧастьСхемыОбъект.Записать();
			
			ТабличнаяЧастьСхемы = ТабличнаяЧастьСхемыОбъект.Ссылка;
			
		КонецЕсли;
		
		Для Каждого Реквизит из ТабличнаяЧасть.Реквизиты цикл
			
			РеквизитСхемы = Справочники.мдмРеквизиты.НайтиПоРеквизиту("Имя", Реквизит.Имя,, ТабличнаяЧастьСхемы);
			Если Не РеквизитСхемы.Пустая() тогда
				Продолжить;
			КонецЕсли;	
			
			РеквизитСхемыОбъект = Справочники.мдмРеквизиты.СоздатьЭлемент();
			РеквизитСхемыОбъект.Владелец = ТабличнаяЧастьСхемы;
			РеквизитСхемыОбъект.УстановитьНовыйКод();
			РеквизитСхемыОбъект.Имя = Реквизит.Имя;
			РеквизитСхемыОбъект.Синоним = Реквизит.Синоним;
			РеквизитСхемыОбъект.Тип = Новый ХранилищеЗначения(Реквизит.Тип);
			РеквизитСхемыОбъект.ПроверятьЗаполнение = ?(Реквизит.ПроверкаЗаполнения = ПроверкаЗаполнения.ВыдаватьОшибку, Истина, Ложь);
			
			РеквизитСхемыОбъект.Записать();
			
		КонецЦикла;	
		
	КонецЦикла;	
	
КонецПроцедуры	

&НаСервере
Процедура ЗаполнитьСписокСправочниковРасширения()
	
	Элементы.ИмяОбъектаРасширения.СписокВыбора.Очистить();
	
	Если Объект.Хранилище = Перечисления.мдмХранилищеДанных.Расширение И ЗначениеЗаполнено(Объект.ИмяРасширения) тогда
		
		Элементы.ИмяОбъектаРасширения.СписокВыбора.ЗагрузитьЗначения(мдмРасширения.СправочникиРасширения(Объект.ИмяРасширения));
		
	КонецЕсли;	
	
КонецПроцедуры	

&НаСервере
Процедура ЗаполнитьСписокРасширений()
	
	Если Не Объект.Хранилище = Перечисления.мдмХранилищеДанных.Расширение тогда	
		Возврат	
	КонецЕсли;
	
	Элементы.ИмяРасширения.СписокВыбора.ЗагрузитьЗначения(мдмРасширения.ПолучитьСписокРасширений());
	
КонецПроцедуры	

&НаСервере
Процедура УстановитьОтборПоСхеме()
	
	ЭлементОтбора = Реквизиты.КомпоновщикНастроек.Настройки.Отбор.Элементы[0];
	ЭлементОтбора.ПравоеЗначение = Объект.Ссылка;
	
	ЭлементОтбора = ТабличныеЧасти.КомпоновщикНастроек.Настройки.Отбор.Элементы[0];
	ЭлементОтбора.ПравоеЗначение = Объект.Ссылка;
	
КонецПроцедуры

&НаКлиенте
Процедура УстановитьОтборПоТабличнойЧасти() Экспорт
	
	УстановитьОтборПоТабличнойЧастиНаСервер(Элементы.ТабличныеЧасти.ТекущаяСтрока);
	
КонецПроцедуры

&НаСервере
Процедура УстановитьОтборПоТабличнойЧастиНаСервер(ТекущаяСтрока)
	
	ЭлементОтбора = РеквизитыТабличнойЧасти.КомпоновщикНастроек.Настройки.Отбор.Элементы[0];
	ЭлементОтбора.ПравоеЗначение = ТекущаяСтрока;
	
КонецПроцедуры

&НаСервере
Процедура НастройкаФормы()
	
	Элементы.СтраницаРеквизиты.Видимость = ЗначениеЗаполнено(Объект.Ссылка);
	Элементы.СтраницаТабличныеЧасти.Видимость = ЗначениеЗаполнено(Объект.Ссылка);
	
	Элементы.ГруппаРасширение.Видимость = (Объект.Хранилище = Перечисления.мдмХранилищеДанных.Расширение);
	
	Если Объект.Хранилище = Перечисления.мдмХранилищеДанных.Расширение тогда
		
		Элементы.ИмяРасширения.АвтоОтметкаНезаполненного = Истина;	
		Элементы.ИмяОбъектаРасширения.АвтоОтметкаНезаполненного = Истина;
		
	Иначе 
		
		Элементы.ИмяРасширения.АвтоОтметкаНезаполненного = Ложь;	
		Элементы.ИмяОбъектаРасширения.АвтоОтметкаНезаполненного = Ложь;
		
	КонецЕсли;	
	
КонецПроцедуры

&НаСервереБезКонтекста
Функция РеквизитыПредставления(СхемаДанных)
	
	МетаданныеОбъекта = мдмКэшируемыеФункции.МетаданныеОбъекта(СхемаДанных, мдмМетаданные.ВерсияМетаданных());
	
	Результат = Новый Массив;
	
	Для Каждого Реквизит из МетаданныеОбъекта.Реквизиты цикл
		
		СвойстваРеквизита = Реквизит.Значение;
		
		Если СвойстваРеквизита.Тип.Типы()[0] = Тип("Строка") тогда
			Результат.Добавить(СвойстваРеквизита.Имя);
		КонецЕсли;	
		
	КонецЦикла;	
	
	Возврат Результат;
	
КонецФункции	

&НаКлиенте
Процедура ОбновитьСписки()
	
	Элементы.Реквизиты.Обновить();
	Элементы.ТабличныеЧасти.Обновить();
	Элементы.РеквизитыТабличнойЧасти.Обновить();
	
КонецПроцедуры	

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	
	Для Каждого КлючЗначение из ПараметрыЗаписи Цикл 
		ТекущийОбъект.ДополнительныеСвойства.Вставить(КлючЗначение.Ключ, КлючЗначение.Значение);
	КонецЦикла;	
	
КонецПроцедуры

#КонецОбласти




