# Задание для модуля 3

## Задание 1

> Преобразовать данные из словаря DIM Clients в Power Query из вида.

> Из такого:

![Image alt](https://github.com/Data-Learn/data-engineering/blob/master/DE-101%20Modules/Module03/DE%20-%20101%20Lab%203.1/3_11_PowerBI/img/3_11_1.png)

> В такое:

![Image alt](https://github.com/Data-Learn/data-engineering/blob/master/DE-101%20Modules/Module03/DE%20-%20101%20Lab%203.1/3_11_PowerBI/img/3_11_2.png)


С помощью команды ```Table.ReorderColumns(#"Измененный тип",{"Client ID", "Value", "Type"})``` помнять местами вторую и третью колонку или 
нажать правой кнопкой мыши на название -> переместить -> левый.

Переименовать таблицу "Table.RenameColumns(#"Переупорядоченные столбцы",{{"Value", "Client Type"}, {"Type", "Client Name"}})" так же из меню правой кнопкой переименовать.

Командой "Table.ReplaceValue(#"Переименованные столбцы","Type","",Replacer.ReplaceText,{"Client Name"})" удалить "Type" во всем столбце, создать новый столбец с индексом "Table.AddIndexColumn(#"Замененное значение", "Индекс", 1, 1, Int64.Type)".

Объединить столбец "Client Name" и "Индекс" командой "Table.CombineColumns(Table.TransformColumnTypes(#"Добавлен индекс", {{"Индекс", type text}}, "ru-RU"),{"Client Name", "Индекс"},Combiner.CombineTextByDelimiter(" ", QuoteStyle.None),"Сведено")".

Переименовать сведенный столбец "Table.RenameColumns(#"Объединенные столбцы",{{"Сведено", "Client Name"}})".

Поскольку знаем сколько нужно удалить ненужных строк используем запрос "Table.RemoveLastN(#"Переименованные столбцы1",21)".

![Image alt](https://github.com/EsSanches/datalearn/blob/main/de101/module03/delite.png)

Результат:

![Image alt](https://github.com/EsSanches/datalearn/blob/main/de101/module03/%D0%B7%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5_1.png)


