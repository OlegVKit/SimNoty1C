﻿
&НаСервере
Функция ПолучитьHTMLНаСервере(Топик)		
	Возврат "http://localhost:8080/noty/sub?topic="+Топик;	
КонецФункции

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	// Вставить содержимое обработчика. 
	Топик = Новый УникальныйИдентификатор;
	ПолеHTML =  ПолучитьHTMLНаСервере(Топик); 
КонецПроцедуры

&НаКлиенте
Процедура ПолеHTMLПриНажатии(Элемент, ДанныеСобытия, СтандартнаяОбработка)
	// Вставить содержимое обработчика. 
	СообщениеССервера = Элемент.Документ.defaultView.document.getElementById("d1c").innerHTML;
	
КонецПроцедуры

&НаСервере
Процедура ОтправитьУведомление(Топик,Сообщение)
	// Вставить содержимое обработчика.  
	// Такой код можно вызвать через фоновое задание
		
	Попытка
		Соединение  = Новый HTTPСоединение("localhost",8080);
		Запрос = Новый HTTPЗапрос("/noty/pub?topic="+Топик+"&message="+Сообщение);
		Соединение.Получить(Запрос);
	Исключение	
		Сообщить(ОписаниеОшибки());
	КонецПопытки;

КонецПроцедуры

&НаКлиенте
Процедура Команда1(Команда)
	ОтправитьУведомление(Топик,Сообщение);
КонецПроцедуры
