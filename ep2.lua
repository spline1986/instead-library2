room {
   nam = 'возле здания информационного центра',
   seen = false,
   dsc = function(s)
	  if not s.seen then
		 s.seen = true
		 return 'Я спустился по ступеням из здания информационного центра. Нужно найти Леонида и найти способ передать сообщение человечеству. Если я смогу передать информацию о планах ИИ, то наверняка удастся предотвратить кровопролитие.'
	  else
		 return 'Я нахожусь возле здания информационного центра.'
	  end
   end,
   obj = {
	  obj {
		 nam = 'ступеньки здания',
		 dsc = 'Ко входу ведут архаичные {ступеньки}.',
		 act = 'Вообще, на Библиотеки много архаики. Ступеньки, рельсы, полностью механические сервиторы. И даже пушки кинетические.',
	  },
	  obj {
		 nam = 'двери здания',
		 dsc = 'Они ведут к широким {дверям}.',
		 act = 'Двери открыты.',
	  },
   },
   way = {
	  'сквер',
   },
}

room {
   nam = 'сквер',
   seen = false,
   dsc = function(s)
	  if not s.seen then
		 s.seen = true
		 return 'Я вышел в небольшой скверик. По какой-то причине эта часть Библиотеки осталась вполне ухоженной.'
	  else
		 return 'Я нахожусь в небольшом скверике.'
	  end
   end,
   obj = {
	  obj {
		 nam = 'фонари',
		 dsc = 'Сквер освещён несколькими {фонарями}',
		 act = 'Старинные фонари, дающие утомительный свет, часть диапазона которого просто отсутствует.',
	  },
	  obj {
		 nam = 'скамейки',
		 dsc = 'На некотором отдалении друг от друга стоят {скамейки}.',
		 act = 'Скамейки давно не меняли, но выглядят они гораздо лучше своих собратьев, встреченных мной ранее.',
	  },
   },
   way = {
	  'аллея',
	  path { 'к зданию', 'возле здания информационного центра' },
	  path { 'Ж/Д платформа', 'Ж/Д платформа 1' },
   },
}

room {
   nam = 'аллея',
   seen = false,
   dsc = function(s)
	  if not s.seen then
		 s.seen = true
		 return ''
	  else
		 return 'Я нахожусь возле кабинки телепорта.'
	  end
   end,
   obj = {
	  obj {
		 nam = 'телепорта кабинка',
		 dsc = 'Прямо на тротуаре стоит {кабинка} телепорта.',
		 act = 'Древняя кабинка из выцветшего пластика.',
		 obj = {
			obj {
			   nam = 'табличка телепорта',
			   dsc = 'На кабинке висит {табличка}.',
			   act = '"Центральный информационный узел".',
			},
		 },
	  },
	  obj {
		 nam = 'плитка',
		 dsc = 'Аллея вымощена {плиткой}.',
		 act = 'Плитка выглядит так, как будто её недавно меняли.',
	  },
   },
   way = {
	  path { 'в кабинку', 'кабинка телепорта' },
	  'сквер',
   },
}

room {
   nam = 'кабинка телепорта',
   seen = false,
   dsc = function(s)
	  if not s.seen then
		 s.seen = true
		 return ''
	  else
		 return 'Я нахожусь в кабинке телепорта.'
	  end
   end,
   obj = {
	  obj {
		 nam = 'панель телепорта',
		 seen = false,
		 dsc = 'Передо мной находится {панель} управления.',
		 act = function(s)
			if not s.seen then
			   s.seen = true
			   return 'Надпись на экране гласит "Доступ заблокирован".^^Никто и не мог разблокировать телепорт. Надо искать другой способ передвижения.'
			else
			   return 'Надпись на экране гласит "Доступ заблокирован".'
			end
		 end,
	  },
   },
   way = {
	  path { 'наружу', 'аллея' },
   },
}

room {
   nam = 'Ж/Д платформа 1',
   seen = false,
   dsc = function(s)
	  if not s.seen then
		 s.seen = true
		 return 'Я вышел на железнодорожную платформу. На открытой местности я себя чувствую достаточно неуютно.'
	  else
		 return 'Я нахожусь на железнодорожной платформе.'
	  end
   end,
   obj = {
	  obj {
		 dsc = 'Вдоль {перрона}',
		 act = 'Ничем не примечательный перрон. Такие до сиз пор встречаются на многих планетах. Наверное, трудно придумать что-нибудь новое в перроностроении.',
	  },
	  obj {
		 dsc = 'установлены {скамейки}.',
		 act = 'У меня нет никакого желания присесть и отдохнуть. Нужно как можно скорее заняться поисками Леонида.',
	  },
	  obj {
		 dsc = 'Здание {депо} стоит чуть в стороне.',
		 act = 'Некогда красивое здание из стекла и стали, сейчас выглядит удручающе. Двести лет без присмотра плохо сказываются на таких материалах.',
	  },
	  obj {
		 nam = 'ворота депо',
		 opened = false,
		 dsc = function(s)
			if s.opened then
			   return 'Огромные {ворота} открыты.'
			else
			   return 'Огромные {ворота} закрыты.'
			end
		 end,
		 act = function(s)
			if s.opened then
			   return 'Можно ехать.'
			else
			   return 'Они должны открываться каким-то автоматическим механизмом.'
			end
		 end,
	  },
	  obj {
		 nam = 'дверь депо',
		 opened = false,
		 dsc = 'Рядом с ними находится {дверь}.',
		 act = function(s)
			if s.opened then
			   if disabled 'депо' then
				  enable 'депо'
			   end
			   return 'Дверь открыта. Можно входить.'
			else
			   return 'Дверь заперта на механический замок.'
			end
		 end,
	  },
	  obj {
		 dsc = 'Рядом стоит небольшое {здание}.',
		 act = 'Интересно что в нём находится.',
	  },
   },
   way = {
	  'сквер',
	  'депо',
	  'здание',
   },
}

room {
   nam = 'здание',
   seen = false,
   dsc = function(s)
	  if not s.seen then
		 s.seen = true
		 return 'Я вошёл в небольшое здание. Глаза не сразу привыкли к полумраку и в первые мгновения казалось, что я совершенно ничего не вижу.'
	  else
		 return 'Я нахожусь в небольшом здании рядом с депо.'
	  end
   end,
   obj = {
	  obj {
		 dsc = 'За {окном} видны перрон и пути.',
		 act = 'Окно достаточно маленькое, чтобы не пропускать достаточно света. Очень странное окно.',
	  },
	  obj {
		 dsc = 'Под окном в длину всей стены расположен {стол}.',
		 act = 'Просто широкая полимерная панель, прикреплённая к стене.',
	  },
	  obj {
		 dsc = 'Под столом стоит {тумбочка}.',
		 act = function(s)
			if closed(s) then
			   open(s)
			   return 'Я открыл тумбочку.'
			else
			   close(s)
			   return 'Я закрыл тумбочку'
			end
		 end,
		 obj = {
			obj {
			   nam = 'ключ от депо',
			   disp = 'ключ',
			   dsc = 'В ней лежит {ключ}.',
			   tak = 'Я взял ключ.',
			   inv = 'Старомодный ключ от механического замка.',
			   use = function(s, w)
				  if w ^ 'дверь депо' then
					 enable 'депо'
					 w.opened = true
					 return 'Я отпер дверь ключом.'
				  else
					 return 'Ключ тут бесполезен.'
				  end
			   end,
			},
		 },
	  }:close(),
   },
   way = {
	  path { 'наружу', 'Ж/Д платформа 1' },
   },
}

room {
   nam = 'депо',
   seen = false,
   dsc = function(s)
	  if not s.seen then
		 s.seen = true
		 return 'Я зашёл в депо. Внутри оно выглядит немного лучше, чем снаружи.'
	  else
		 return 'Я нахожусь в депо.'
	  end
   end,
   obj = {
	  obj {
		 dsc = 'На рельсах стоит {поезд}.',
		 act = 'Уже готовый к отправлению состав с локомотивом.',
	  },
	  'ворота депо',
	  obj {
		 dsc = 'Рядом с ними установлена {панель} управления.',
		 act = function(s)
			if _'рубильник в депо'.pulled then
			   local v = 'Я активировал панель управления воротами. Ворота '
			   if _'ворота депо'.opened then
				  _'ворота депо'.opened = false
				  return v .. 'закрылись.'
			   else
				  _'ворота депо'.opened = true
				  return v .. 'открылись.'
			   end
			else
			   return 'Без питания панель неактивна.'
			end
		 end,
	  },
	  obj {
		 dsc = 'В углу находится распределительный {щиток}.',
		 act = function(s)
			if closed(s) then
			   open(s)
			   return 'Я открыл щиток.'
			else
			   close(s)
			   return 'Я закрыл щиток.'
			end
		 end,
		 obj = {
			obj {
			   dsc = 'В нём установлено несколько {рубильников}.',
			   act = function(s)
				  if disabled 'рубильник в депо' then
					 enable 'рубильник в депо'
					 return 'Рядом с рубильниками есть поясняющие таблички. Среди прочих я нашёл рубильник, питающий ворота.'
				  else
					 return 'Рубильники включают и отключают от сети питания различные части депо и платформы.'
				  end
			   end,
			},
			obj {
			   nam = 'рубильник в депо',
			   pulled = false,
			   dsc = 'Среди них {тот}, что отвечает за питание ворот.',
			   act = function(s)
				  if s.pulled then
					 s.pulled = false
					 return 'Я поднял рубильник. Питание отключено.'
				  else
					 s.pulled = true
					 return 'Я опустил рубильник. Питание подключено.'
				  end
			   end,
			}:disable(),
		 },
	  }:close()
   },
   way = {
	  path { 'Ж/Д платформа', 'Ж/Д платформа 1' },
	  path { 'в поезд', 'вагон 2' },
   },
}:disable()

room {
   nam = 'вагон 2',
   seen = false,
   disp = 'вагон',
   dsc = function(s)
	  if not s.seen then
		 s.seen = true
		 return 'Я вошёл в вагон.'
	  else
		 return 'Я нахожусь в вагоне.'
	  end
   end,
   obj = {
	  obj {
		 dsc = 'Старые пыльные {сидения} установлены вдоль стен.',
		 act = 'У меня нет никакого желания сидеть на них. Во всяком случае сейчас.',
	  },
	  obj {
		 dsc = 'Под потолком подвешены {плафоны}.',
		 act = 'Сейчас освещение выключено.',
	  },
   },
   way = {
	  'депо',
	  path { 'кабина', 'локомотив 2', },
   },
}

room {
   nam = 'локомотив 2',
   seen = false,
   disp = 'кабина',
   dsc = function(s)
	  if not s.seen then
		 s.seen = true
		 return 'Я вошёл в кабину локомотива.'
	  else
		 return 'Я нахожусь в кабине локомотива.'
	  end
   end,
   onenter = function(s)
	  snapshots:remove()
	  snapshots:make()
   end,
   obj = {
	  obj {
		 dsc = 'Лобовое {стекло} обеспечивает широкий обзор.',
		 act = 'Снаружи видно депо.',
	  },
	  obj {
		 dsc = 'Под ним расположена {панель} управления.',
		 act = function(s)
			walk 'интерфейс поезда 1'
		 end,
	  },
   },
   way = {
	  path { 'вагон', 'вагон 2' },
   },
}

room {
   nam = 'интерфейс поезда 1',
   noinv = true,
   seen = false,
   disp = 'панель управления',
   dsc = function(s)
	  if not s.seen then
		 s.seen = true
		 return 'Интерфейс системы несколько непривычен, но вполне понятен.'
	  end
   end,
   decor = '{@ walk роутер|Настройка роутера}^' ..
	  '{@ walk "выбор конца"|Пуск}^^' ..
	  '{@ walk "справка поезд"|Справка}^^' ..
	  '{@ walk "локомотив 2"|Назад}',
}

room {
   nam = 'роутер',
   noinv = true,
   obj = {
	  obj {
		 nam = 'сеть контроля',
		 disconnected = false,
		 dsc = function(s)
			local v = '{Сеть контроля: '
			if s.disconnected then
			   v = v .. 'отключена}'
			else
			   v = v .. 'подключена}'
			end
			return v
		 end,
		 act = function(s)
			s.disconnected = not s.disconnected
		 end,
	  },
	  obj {
		 nam = 'сеть управления',
		 disconnected = false,
		 dsc = function(s)
			local v = '{$nl|}{Сеть управления: '
			if s.disconnected then
			   v = v .. 'отключена}'
			else
			   v = v .. 'подключена}'
			end
			return v
		 end,
		 act = function(s)
			s.disconnected = not s.disconnected
		 end,
	  },
	  obj {
		 nam = 'внутренняя сеть',
		 disconnected = false,
		 dsc = function(s)
			local v = '{$nl|}{Внутренняя сеть: '
			if s.disconnected then
			   v = v .. 'отключена}'
			else
			   v = v .. 'подключена}'
			end
			return v
		 end,
		 act = function(s)
			s.disconnected = not s.disconnected
		 end,
	  },
	  obj {
		 dsc = '{$nl|}{$nl|}{Назад}',
		 act = function(s)
			walk 'интерфейс поезда 1'
		 end,
	  },
   },
}

room {
   nam = 'выбор конца',
   onenter = function(s, f)
	  if _'ворота депо'.opened then
		 if _'сеть контроля'.disconnected then
			walk 'конец эпизода 2'
		 else
			walk 'смерть 2'
		 end
	  else
		 walkback()
		 p 'Ворота депо закрыты.'
	  end
   end,
}

cutscene {
   nam = 'конец эпизода 2',
      noinv = true,
   disp = false,
   decor = function(s)
	  pn '{$nl}{$nl}Поезд начал ускорение. Похоже, мне удастся добраться до Леонида без особых происшествий.^'
	  pn '[cut]'
	  pn '[code bg = "bg.png"; set_bg()]'
	  pn '[cls]'
	  pn '[fading 16]'
	  pn '[pause 1000]'
	  pn(fmt.y('50%') .. fmt.c('{$fnt play|СЕЙЧАС}'))
	  pn '[fading 16]'
	  pn '[pause 2000]'
	  pn '[cls]'
	  pn '[fading 16]'
	  pn '[code bg = "train.png"; set_bg()]'
	  pn '[fading 16]'
	  pn '[code change_pl "сейчас"; walk "вагон 3_"]'
   end,
}

room {
   nam = 'смерть 2',
   noinv = true,
   disp = '. . .',
   decor = 'Поезд начал ускорение. Воодушевлённый этим, я спокойно сидел в кресле машиниста и дремал. Внезапно поперёк путей рухнула огромная колонна. Поезд врезался в неё и начал заваливаться набок. Откуда-то сбоку показались многочисленные сервиторы. Я даже успел услышать выстрелы их нелепых орудий...^^' ..
	  '{@ restore|А может всё было иначе?}',
}
