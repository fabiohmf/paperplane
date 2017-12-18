love.mouse.setVisible(false) -- Tirar cursor do mouse na tela
	
-- Background
fundo = love.graphics.newImage( "imagem/Background.png" )
fundoDois = love.graphics.newImage( "imagem/Background2.png" )
colidiu = love.graphics.newImage( "imagem/colisao.png" )

imgBotao = love.graphics.newImage( "imagem/setas.png" )


FX = 1 + (larguraTela - fundo:getWidth())/fundo:getWidth() -- VARIAÇÃO DA LARGURA DE TELA

planoDeFundo = {
	x = 0,
	y = 0,
	x2 = 0 + fundo:getWidth() * FX,
	vel = 10 
}
-- Background
	
-- Pontuacao
estaSeco = true
pontos = 0
life = 5
gameOver = false
transparencia = 0
imgGameOver = love.graphics.newImage( "imagem/GameOver.png" )
-- Pontuacao


-- Life Jogo
lifeBlue = love.graphics.newImage( "imagem/blueBall.png" )
lifeRed = love.graphics.newImage( "imagem/redBall.png" )
-- Life Jogo

	
-- Sons do jogo
pegaMoeda = love.audio.newSource( "sons/1up.mp3", "static" )
pingoAgua = love.audio.newSource( "sons/trim.mp3", "static" )
alerta = love.audio.newSource( "sons/NotificaçãoDeAlerta.mp3", "static" )


estrelaAgua = love.audio.newSource( "sons/starDown.mp3", "static" )
alarmPlane = love.audio.newSource( "sons/alarm.mp3", "static" )

explodeNave = love.audio.newSource( "sons/ExplodeNave.wav", "static" ) -- Molha Avião
musica = love.audio.newSource( "sons/Musica.wav" )
somGameOver = love.audio.newSource( "sons/GameOver.ogg" ) -- GAME OVER
musica:play()
musica:setLooping( true )
-- Sons do jogo

-- Fonte
fonte = love.graphics.newImageFont( "imagem/Fonte.png", " abcdefghijklmnopqrstuvwxyz" .. "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" .. "123456789.,!?-+/():;%&`'*#=[]\"" )
fonteDois = love.graphics.newFont( "fonte/fonteExemplo.ttf", 30 )
-- Fonte	

-- Tela titulo
abreTela = false
telaTitulo = love.graphics.newImage( "imagem/ImagemTitulo.png" )

inOutX = 0
inOutY = 0
-- Tela titulo

-- Pause
pausar = false
-- Pause
	