--$Name: Библиотека 2: Сигнал$
--$Version: 0.4$
--$Author: Андрей Лобанов$

require 'fmt'
require 'noinv'
require 'snapshots'
require 'snd'
require 'theme'
require 'timer'
require 'lib/cutscene'
require 'lib/fonts'
dofile 'ep1.lua'
dofile 'ep2.lua'
dofile 'ep3.lua'

instead.fading_value = 6

function restore()
   snapshots:restore()
end

xact.restore = restore
xact.walk = walk

obj {
   nam = 'КПК сейчас',
   disp = 'КПК',
   inv = 'Аккумулятор КПК разряжен.',
}

obj {
   nam = 'КПК тогда',
   disp = 'КПК',
   inv = 'Интерфейс КПК.',
}

now = player {
   nam = 'сейчас',
   room = 'main',
   obj = { 'КПК сейчас' },
}

than = player {
   nam = 'тогда',
   room = 'возле здания информационного центра',
   obj = { 'КПК тогда' },
}

global {
   bg = 'library.png',
}

declare {
   tracks = {"mus/curious mind.xm",
			 "mus/finland 25c.xm"},
   track = 0,
}

local fnt = _'$fnt'
fnt:face ('play', 'theme/Play-Bold.ttf', 36)

function set_bg()
   theme.gfx.bg('theme/' .. bg)
end

function game.timer()
   if not snd.music_playing() then
	  track = track + 1
	  if track > #tracks then
		 track = 1
	  end
	  local n = tracks[track]
	  snd.music(n, 1);
   end
   return false
end

function init()
   timer:set(1000)
 -- Включаем музыку до первого тика таймера
   game.timer()
   change_pl(now)
end

function start()
   set_bg()
end

obj {
   nam = '$nl',
   act = function(s)
	  return '\n'
   end,
}

room {
   nam = 'main',
   noinv = true,
   disp = 'БИБЛИОТЕКА 2: СИГНАЛ',
   decor = fmt.b 'Версия:' .. fmt.tab '30%' .. '0.4^^' ..
	  fmt.b 'Автор:' .. fmt.tab '30%' .. 'Андрей Лобанов^' ..
	  fmt.b 'Автор Instead:' .. fmt.tab '30%' .. 'Пётр Косых^' ..
	  fmt.b 'Музыка:' .. fmt.tab '30%' .. 'Mellow-D - curious mind.xm^' ..
	  fmt.tab '30%' .. 'Mellow-D - finland 25c.xm^^' ..
	  fmt.b 'Тестирование:' .. fmt.tab '30%' .. 'Место вакантно^^' ..
	  'Специально для шестого паровозика.^^' ..
	  '{@ walk начало|Начать игру}^' ..
	  '{@ walk об|Об игре}',
}

room {
   nam = 'об',
   noinv = true,
   title = 'ОБ ИГРЕ',
   decor = 'Игра является прямым продолжением игры "Библиотека". События игры развиваются вскоре после окончания первой части.^^' ..
	  'Огромное спасибо MAlischka и  Ajenta Arrow. Без них не появилась бы эта часть истории о Библиотеке.^^' ..
	  fmt.em 'Перед прохождением настоятельно рекомендуется пройти первую часть игры. Найти её вы можете в репозитории instead-игр по адресу http://instead-games.ru/.^^' ..
	  'Лучший способ отблагодарить автора -- написать свою игру на движке Instead :)^^' ..
	  '{@ walk main|Назад}',
}

cutscene {
   nam = 'начало',
   noinv = true,
   disp = false,
   decor = function(s)
	  pn '[code bg = "bg.png"; set_bg()]'
	  pn '[cls]'
	  pn '[fading 16]'
	  pn '[pause 1000]'
	  pn(fmt.y('50%') .. fmt.c('{$fnt play|ГДЕ-ТО НА БИБЛИОТЕКЕ}'))
	  pn '[fading 16]'
	  pn '[pause 2000]'
	  pn '[cls]'
	  pn '[fading 16]'
	  pn '[code bg = "hangar.png"; set_bg()]'
	  pn '[fading 16]'
	  pn '[code walk "ангар"]'
   end,
}
