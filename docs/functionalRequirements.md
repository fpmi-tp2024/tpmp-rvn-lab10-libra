# Функциональные требования

[Home](index.md)    
[Функциональные требования](functionalRequirements.md)  
[Спецификация](specification.md)  
[Диаграмма файлов приложения](filesSchema.md)   
[Дополнительная спецификация](dopSpecification.md)  
[Схема базы данных](databaseSchema.md)          
[Презентация проекта](projectPresentation.md)         

# Функциональные требования

### Требования к приложению

#### Приложение должно выполнять следующие функции:
1. Прохождение регистрации и авторизации
2. Выбор блюд
3. Поиск блюда по названию
4. Удаление блюд из корзины
5. Ввод данных о заказе: способ оплаты, дата и время доставки, адрес доставки, комментарий к заказу. Подтверждение заказа
6. Определение местоположение пользователя и показ ближайших ресторанов сети
7. Изменение логина, электронной почты, пароля пользователя
8. Возможность изменить на тёмную/светлую тему
9. Локализация и интернационализация на 3 языках: русский, английский, французский

# Диаграмма вариантов использования
![use_case](https://github.com/fpmi-tp2024/tpmp-rvn-lab10-libra/blob/5cf92142b8b793dd6408e8dc3335ca8f5aa26e16/img/diagrams/useCase.jpeg?raw=true)

# Сценарий для пользователя:
1. Пользователь
   + Регистрируется
     * Вводит логин
     * Вводит Электронную почту
     * Вводит пароль
     * Повторяет пароль
     * Подтверждает регистрацию
   + Входит в аккаунт
     * Вводит логин
     * Вводит пароль
4. После проверки и подтверждения логина и пароля система отображает меню
5. Пользователь имеет возможность:
    * Добавить блюдо в корзину
    * Найти блюдо в меню по названию
    * Перейти в корзину
    * Удалить блюдо из корзины
    * Перейти к оплате корзины
      + Выбрать способ оплаты
      + Выбрать дату и время доставки
      + Указать адрес, если доставка не в текущее местоположение
      + Добавть комментарий к заказу
      + Подтвердить оплату  
    * Перейти в настройки
    * Изменить светлую/тёмную тему
    * Изменить логин
    * Изменить пароль
    * Изменить электронную почту
  