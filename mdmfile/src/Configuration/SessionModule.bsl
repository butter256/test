
Процедура УстановкаПараметровСеанса(ТребуемыеПараметры)
	
	Пользователь = Справочники.Пользователи.НайтиПоНаименованию(ПользователиИнформационнойБазы.ТекущийПользователь().Имя, Истина);
	
	ПараметрыСеанса.ТекущийПользователь = Пользователь;
	
КонецПроцедуры
