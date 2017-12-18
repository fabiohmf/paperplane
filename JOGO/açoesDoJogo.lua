require( "config" )
require( "plane" ) -- Chama as funções do Avião de Papel no jogo
require( "agua") -- Chama as funções da ÁGUA no jogo
require( "nuvem") -- Chama as funções da NUVEM no jogo
require( "estrela" ) -- Chama as funções da ESTRELA no jogo
require( "pingo" ) -- Chama as funções do PINGO no jog
contagem = 0
function condiçoes()
	if subiu == 1 then
		contagem = contagem + 1
		if contagem < 20 then
			sobe = 1
		else 
			contagem = 0
			sobe = 0
			subiu = 0
		end
	end
end

-- Cria o movimento do fundo
function planoDeFundoScrolling( dt )
	local FX = 1 + (larguraTela - fundo:getWidth())/fundo:getWidth() -- VARIAÇÃO DA LARGURA DE TELA
		
	planoDeFundo.x = planoDeFundo.x - planoDeFundo.vel * dt
	planoDeFundo.x2 = planoDeFundo.x2 - planoDeFundo.vel * dt
	
	if planoDeFundo.x < 0 - fundoDois:getWidth() * FX then
		planoDeFundo.x = planoDeFundo.x2 + fundoDois:getWidth() * FX
	end
	if planoDeFundo.x2 < 0 - fundo:getWidth() * FX then
		planoDeFundo.x2 = planoDeFundo.x + fundo:getWidth() * FX
	end
end
-- Cria o movimento do fundo

-- Reset
function reset()
	if not estaSeco and inOutY == 0 and love.keyboard.isDown( 'return' ) then
		moedas = {}
		nuvens = {}
		pingos = {}
		
		tempoCriarNuvem = delayNuvem
		tempoCriarMoeda = delayMoeda
		
		plane.posX = larguraTela / 10
		plane.posY = alturaTela / 10
		
		abreTela = true
	end
end
-- Reset

-- Inicia Jogo
function iniciaJogo( dt )
	if abreTela and not estaSeco then
		inOutX = inOutX + 1300 * dt
		if inOutX > 1200 then
			inOutY = -701
			inOutX = 0
			estaSeco = true
			life = 5
		end
	elseif not abreTela then
		estaSeco = false
		inOutY = inOutY + 1300 * dt
		if inOutY > 0 then
			inOutY = 0
		end
	end
end
-- Inicia Jogo

function love.keyreleased( key )
	if key == "p" and abreTela then
		pausar = not pausar
	end
	if pausar then
		musica:pause()
	else
		love.audio.resume( musica )
	end
	
	if key == "r" and abreTela then
		moedas = {}
		nuvens = {}
		pingos = {}
		
		tempoCriarNuvem = delayNuvem
		tempoCriarMoeda = delayMoeda
		
		plane.posX = larguraTela / 10
		plane.posY = alturaTela / 10
		
		abreTela = true
		life = 5
		velocidadeEstrela =200 
		velocidadeNuvem  = 200
		pontos = 0
		agua.posicY = 590
		agua.sobe = 2
	end	
end

function fimJogo( dt )
	pausar = true
	musica:stop()
	transparencia = transparencia + 100 * dt
	if love.keyboard.isDown( "escape" ) then
		love.event.quit()
	end
	
	-- Reset após Game Over
	if love.keyboard.isDown( 'return' ) then
		delayPingo = 0.5
		life =5
		velocidadeEstrela = 200
		velocidadeNuvem = 200
		moedas = {}
		nuvens = {}
		pingos = {}
		
		tempoCriarNuvem = delayNuvem
		tempoCriarMoeda = delayMoeda
		
		plane.posX = larguraTela / 10
		plane.posY = alturaTela / 10
		
		estaSeco = true
		pontos = 0
		gameOver = false
		pausar = false
		
		inOutX = 0
		inOutY = 0
		
		musica:play()
		musica:setLooping( true )
		
		transparencia = transparencia + 100 * (dt)
		
		agua.posicY = 590
		agua.sobe = 2
		
		love.graphics.setFont( fonte )
		
		abreTela = true
	end
end