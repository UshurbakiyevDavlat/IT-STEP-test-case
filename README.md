# testingTemp
Здравствуйте, скажу честно последнее задание я не совсем понял , что имелось ввиду и как это сделать, но если вы проясните этот момент ,думаю смогу сделать,
насчет остальных заданий я все сделал и сейчас приложу инструкции какие uri есть у меня в роутере для проверки функционала.

Так же заранее извиняюсь за качество таблиц в базе, они не сильно продуманные.

Пользователи регистрируются самостоятельно через e-mail : http://localhost:8000/api/register
![image](https://user-images.githubusercontent.com/66309313/116914036-0a0cf980-ac6c-11eb-8cc6-cdfa36889cfc.png)


Пользователи могут просматривать каталог товаров (название,
цена, наличие) по категориям и осуществлять заказ выбранных
позиций: http://localhost:8000/api/products , http://localhost:8000/api/productsAdd/{id}, http://localhost:8000/api/CategoryProd/{id}
![image](https://user-images.githubusercontent.com/66309313/116914011-ffeafb00-ac6b-11eb-9814-be1c94c2f89e.png)
![image](https://user-images.githubusercontent.com/66309313/116914088-1ee98d00-ac6c-11eb-9d47-b927f19539a3.png)


Пользователи должны иметь возможность производить поиск по
товарам: http://localhost:8000/api/products

Не авторизованные пользователи не могут осуществлять заказы : Также выполненно http://localhost:8000/api/login, http://localhost:8000/api/logout/ : реализовал лог аут для проверки
![image](https://user-images.githubusercontent.com/66309313/116913958-ef3a8500-ac6b-11eb-82b2-8179efc6b25e.png)
![image](https://user-images.githubusercontent.com/66309313/116914100-2446d780-ac6c-11eb-9a5a-1d6839056b07.png)

Приложение должно автоматически направлять e-mail уведомление
на почту при регистрации или новом заказе товара. Дизайн писем
не важен. Отправку писем реализовать с использованием очередей,
тип отправки SMTP : http://localhost:8000/api/send-email, но так же как и написано в задании , реализовал автоматическое отправление при регистрации и новом заказе так что нет смысла переходить по этому uri . Так же замечу,  что там использую свою дополнительную почту gmail, с использованием smtp.
![image](https://user-images.githubusercontent.com/66309313/116914119-2b6de580-ac6c-11eb-9dd9-f2ef0ebd0f02.png)


Раз в сутки в 00:00 все заказы должны быть подтверждены
автоматически : Нуждается в уточнении

Использовал Apache/2.4.41 (Win64) OpenSSL/1.1.1c PHP/7.4.3 Server at localhost Port 80 
PhpStorm 2021 
Laravel 8+
PostmanApi

Базу данных экспортировал, находится в папке датабейс в проекте..

Спасибо за внимание, надеюсь на фидбек!
