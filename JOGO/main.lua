larguraTela = love.graphics.getWidth()
alturaTela = love.graphics.getHeight()
recordes = 0
pontoMaior = 1
j = 0
altitudeAv = 0
k =  0 
--TXT= T

function love.load()
	require( "config" )
	require( "plane" ) -- Chama as funções do Avião de Papel no jogo
	require( "agua") -- Chama as funções da ÁGUA no jogo
	require( "nuvem") -- Chama as funções da NUVEM no jogo
	require( "estrela" ) -- Chama as funções da ESTRELA no jogo
	require( "pingo" ) -- Chama as funções do PINGO no jogo
	require( "desenhar" ) -- Chama as funçoes que desenha  os personagem no jogo
	require( "açoesDoJogo" ) -- Chama as funçoes açoesDoJogo no jogo

end

function love.update( dt )
	if not pausar then
		pingo ( dt )
		movPlane( dt )
		movAgua ( dt)
		nuvem( dt )
		moeda( dt )
		colisaomoeda ( dt )
		colisaopingo ( dt )		
		reset()
		iniciaJogo( dt )
		colisaoAgua ( dt )
		planoDeFundoScrolling( dt )
		condiçoes()
		j = j + 1 * dt
		velocidadeNuvem = velocidadeEstrela 
		vel = velocidadeEstrela 
		
		-- Condiçao para chamar a tela de colisao
		if atingiu == 1 and k < 3 then
			k = k + 1
		else
			k = 0
			atingiu = 0
		end
	-- Condiçao para chamar a tela de colisao
	
	-- Limite ate onde o aviao pode chegar 
		if altitudeAv < 520 then
			naoSobe = 0
		else
		    naoSobe = 1
		end
	-- Limite ate onde o aviao pode chegar 
	
	-- Codiçao se houver colisao com o pingo
		if tocou == true  then
			if life >= 0 then
				life = life - 1
				tocou = false
			end
		end
	--  Codiçao se houver colisao com o pingo 
	 
	    --TXT= love.filesystem.getSaveDirectory( )
	
	-- Salva o Recorde de pontos
	if pontoMaior <= pontos then
		love.filesystem.write( "recordes.txt", pontos)
		end
		recordes = love.filesystem.read( "recordes.txt" )
	
	-- Salva o Recorde de pontos
	end
	
	if gameOver then
		fimJogo( dt )
	end	
end

function  love.draw()
	
	love.graphics.setBackgroundColor( 255, 255, 255 )
	if not gameOver then
		-- Background
			criaBackground()
		-- Background
		
		-- Estrela
			criaEstrela()
		-- Estrela
		
		-- Pingos
			criaPingo()
		-- Pingos
	end
	
	if estaSeco then
		criaAviao(dt)
		
	-- Nuvens
		criaNuvens(dt)
	-- Nuvens
	
	--Sombra do Aviao
		criaSombraAviao(dt)
	--Sombra do Aviao
		
	-- CENTRALIZAR A PONTUAÇÃO
	   criaPontos(dt)
	-- CENTRALIZAR A PONTUAÇÃO
	
	-- ALARME DE ALTITUDE
	   criaAlerta(dt)
	-- ALARME DE ALTITUDE
	
	-- LIFE DO AVIÃO
		criaLife()
	-- LIFE DO AVIÃO
	
	-- MOSTRA NA TELA  DE GAMEOVER
	elseif gameOver then
		 mostrarNaTelaGameOver()
	-- MOSTRA NA TELA  DE GAMEOVER
	else
		criaTelaInicial()
	end
end

