--$Name: Библиотека 2$
--$Version: 0.1$
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

instead.fading_value = 6

function restore()
   snapshots:restore()
end

xact.restore = restore
xact.walk = walk

now = player {
   nam = 'сейчас',
   room = 'main',
}

than = player {
   nam = 'тогда',
   room = 'возле здания информационного центра',
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
fnt:face ('play', 'theme/Play-Bold.ttf', 33)

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
	disp = 'БИБЛИОТЕКА 2: СИГНАЛ',
	decor = fmt.b 'Версия:' .. fmt.tab '30%' .. '0.1^^' ..
	   fmt.b 'Автор:' .. fmt.tab '30%' .. 'Андрей Лобанов^' ..
	   fmt.b 'Автор Instead:' .. fmt.tab '30%' .. 'Пётр Косых^' ..
	   fmt.b 'Музыка:' .. fmt.tab '30%' .. 'Mellow-D - curious mind.xm^' ..
	   fmt.tab '30%' .. 'Mellow-D - finland 25c.xm^^' ..
	   fmt.b 'Тестирование:' .. fmt.tab '30%' .. 'Место вакантно^^' ..
	   'Специально для шестого паровозика.^^' ..
	   '{@ walk ангар|Начать игру}^' ..
	   '{@ walk об|Об игре}',
}

room {
   nam = 'об',
   title = 'ОБ ИГРЕ',
   decor = 'Игра является прямым продолжением игры "Библиотека". События игры развиваются вскоре после окончания первой части.^^' ..
	  'Огромное спасибо MAlischka и  Ajenta Arrow. Без них не появилась бы эта часть истории о Библиотеке.^^' ..
	  fmt.em 'Перед прохождением настоятельно рекомендуется пройти первую часть игры. Найти её вы можете в репозитории instead-игр по адресу http://instead-games.ru/.^^' ..
	  'Лучший способ отблагодарить автора -- написать свою игру на движке Instead :)^^' ..
	  '{@ walk main|Назад}',
}
