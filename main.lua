-----------------------------------------------------------------------------------------
--
-- 本範例說明如何使用Corona所提供的粒子特效系統
-- 需匯入prticleDesigner.lua檔案以及所需使用的粒子特效檔(json+png)
-- 
-- Author: Zack Lin
-- Time: 2015/9/14
--
-----------------------------------------------------------------------------------------

--=======================================================================================
--引入各種函式庫
--=======================================================================================
display.setStatusBar( display.HiddenStatusBar )
local particleDesigner = require( "particleDesigner") --載入particleDesigner函式庫
--=======================================================================================
--宣告各種變數
--=======================================================================================
_SCREEN = {
	WIDTH = display.viewableContentWidth,
	HEIGHT = display.viewableContentHeight
}
_SCREEN.CENTER = {
	X = display.contentCenterX,
	Y = display.contentCenterY
}

--宣告可使用的粒子特效檔案，一般為同名的json檔搭配圖檔
local effects = {
	stars = "air_stars.json", aurora = "aurora_3b.json" , flame = "big_orange_flame.json" , blood = "blood.json" , galaxy = "blue_galaxy.json" , vortex = "blue_vortex_field.json",
	firefly = "bp_firefly_final.json", comet = "bp_firefly_final.json", crazy_blue = "crazy_blue.json", electrons = "electrons.json", flame2="fireplace_flame.json", 
	giving = "giving.json", heart = "heart04.json", hongshizi = "hongshizi.json",test1="particle_texture.json",test3="test3.json"
}

local init
local onClickScreen
local createEffect
--=======================================================================================
--定義其他函式
--=======================================================================================
init = function (  )
	bg = display.newImageRect(  "background.jpg",  _SCREEN.WIDTH, _SCREEN.HEIGHT )
	bg.x = _SCREEN.CENTER.X
	bg.y = _SCREEN.CENTER.Y

end

createEffect = function ( event,name )
	--生成粒子來源
	local emitter = particleDesigner.newEmitter( name )
	emitter.x = event.x
	emitter.y = event.y

	timer.performWithDelay( 2000, function (  )
		emitter:stop() -- 關閉粒子，另有 start()開始，以及pause()暫停
	end )
end

--=======================================================================================
--宣告與定義main()函式
--=======================================================================================
local main = function (  )
	init()
	Runtime:addEventListener( "tap", onClickScreen )
end

onClickScreen = function ( event )
	print( "onClickScreen" )
	--開始生成粒子
	createEffect(event,effects.test3)
	createEffect(event,effects.blood)
end
--=======================================================================================
--呼叫主函式
--=======================================================================================
main()