--$Name: Библиотека 2$
--$Version: 0.0$
--$Author: Андрей Лобанов$

require 'fmt'
require 'noinv'
require 'snd'
dofile 'ep1.lua'

xact.walk = walk

function start()
   snd.music('mus/curious mind.xm')
end

room {
	nam = 'main',
	disp = 'БИБЛИОТЕКА 2: СИГНАЛ',
	decor = fmt.b 'Версия:' .. fmt.tab '30%' .. '0.0^^' ..
	   fmt.b 'Автор:' .. fmt.tab '30%' .. 'Андрей Лобанов^' ..
	   fmt.b 'Автор Instead:' .. fmt.tab '30%' .. 'Пётр Косых^' ..
	   fmt.b 'Музыка:' .. fmt.tab '30%' .. 'Mellow-D - Curious Mind^^' ..
	   'Специально для шестого паровозика.^^' ..
	   '{@ walk ангар|Начать игру}',
}
