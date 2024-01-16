﻿#language: ru

@tree

Функционал: проверка расчета суммы документа Заказ при изменении количества и цены

Как Менеджер по закупкам я хочу
создание документа поступление товаров 
чтобы поставить товар на учет

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: проверка расчета суммы документа Заказ при изменении количества и цены
* Открытие формы создания документа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки документа	
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Мосхлеб ОАО'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
* Заполнение товарной части
	И в таблице "Список" я разворачиваю строку:
		| 'Код'       | 'Наименование' |
		| '000000011' | 'Продукты'     |
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000030' | 'Колбаса'      |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Колбаса'
	Тогда таблица "Товары" стала равной:
		| 'Товар'   | 'Цена'   | 'Количество' | 'Сумма'  |
		| 'Колбаса' | '300,00' | '1'          | '300,00' |
* Проверка суммы при изменении Цены	
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '222,00'
	Тогда таблица "Товары" стала равной:
		| 'Товар'   | 'Цена'   | 'Количество' | 'Сумма'  |
		| 'Колбаса' | '222,00' | '1'          | '222,00' |
* Проверка суммы при изменении Количества		
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	Тогда таблица "Товары" стала равной:
		| 'Товар'   | 'Цена'   | 'Количество' | 'Сумма'  |
		| 'Колбаса' | '222,00' | '2'          | '444,00' |	
	И в таблице "Товары" я завершаю редактирование строки
* Проведение документа	
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Заказ (создание) *' в течение 20 секунд

