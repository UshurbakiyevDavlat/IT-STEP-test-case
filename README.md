# testingTemp
Здравствуйте, скажу честно последнее задание я не совсем понял , что имелось ввиду и как это сделать, но если вы проясните этот момент ,думаю смогу сделать,
насчет остальных заданий я все сделал и сейчас приложу инструкции какие uri есть у меня в роутере для проверки функционала.

Так же заранее извиняюсь за качество таблиц в базе, они не сильно продуманные.

Пользователи регистрируются самостоятельно через e-mail : http://localhost:8000/api/register

Пользователи могут просматривать каталог товаров (название,
цена, наличие) по категориям и осуществлять заказ выбранных
позиций: http://localhost:8000/api/products , http://localhost:8000/api/productsAdd/{id}, http://localhost:8000/api/CategoryProd/{id}

Пользователи должны иметь возможность производить поиск по
товарам: http://localhost:8000/api/products

Не авторизованные пользователи не могут осуществлять заказы : Также выполненно,http://localhost:8000/api/logout/ : реализовал лог аут для проверки

Приложение должно автоматически направлять e-mail уведомление
на почту при регистрации или новом заказе товара. Дизайн писем
не важен. Отправку писем реализовать с использованием очередей,
тип отправки SMTP : http://localhost:8000/api/send-email, но так же как и написано в задании , реализовал автоматическое отправление при регистрации и новом заказе так что нет смысла переходить по этому uri . Так же замечу,  что там использую свою дополнительную почту gmail, с использованием smtp.

Раз в сутки в 00:00 все заказы должны быть подтверждены
автоматически : Нуждается в уточнении

Использовал Apache/2.4.41 (Win64) OpenSSL/1.1.1c PHP/7.4.3 Server at localhost Port 80 
PhpStorm 2021 
Laravel 8+
PostmanApi

Базу данных экспортировал, находится в папке датабейс в проекте..
