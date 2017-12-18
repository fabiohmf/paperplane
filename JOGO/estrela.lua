png = require( "pingo" ) 
-- Moeda
delayMoeda = 0.042
tempoCriarMoeda = delayMoeda
imgMoeda = love.graphics.newImage( "imagem/moeda.png" )
moedas = {}
velocidadeEstrela = 150
naoSobe = 0
subiu = 0

-- Moeda

-- Criar Moedas
function moeda( dt )
	tempoCriarMoeda = tempoCriarMoeda - ( 0.5 * dt )	
	if tempoCriarMoeda < 0 then
		tempoCriarMoeda = 2*delayMoeda
		numeroAleatorio = math.random( 10, agua.posicY - 50 )
		novoMoeda = { x = larguraTela, y = numeroAleatorio, img = imgMoeda }
		table.insert( moedas, novoMoeda )
	end	

	-- Remover Moeda da Tabela	
	for i, moeda in ipairs( moedas ) do
		moeda.x = moeda.x - ( velocidadeEstrela* dt ) -- velocidade de deslocamento da moeda
		if moeda.x < -250 or moeda.y > alturaTela  then
			table.remove( moedas, i )
		end
	end
	-- Remover Moeda da Tabela	
end
-- Criar Moedas

-- Colisão com Moedas
function colisaomoeda( dt )
	-- COLISÃO NAVE X MOEDA --
	for i, moeda in ipairs( moedas ) do
		if checaColisaoMoeda( moeda.x, moeda.y, imgMoeda:getWidth(), imgMoeda:getHeight(), plane.posX, plane.posY, imgPlane:getWidth(), imgPlane:getHeight() ) then
			table.remove( moedas, i )
			pegaMoeda:stop()
			pegaMoeda:play()
			pontos = pontos + 1	
			molhou = true
			if naoSobe == 0 then
				subiu = 1
			end
			velocidadeCriarPingo = velocidadeCriarPingo + 0.3 * dt
		end
	end
	-- COLISÃO NAVE X MOEDA --
	
	-- COLISÃO MOEDA X ÁGUA --
	for i, moeda in ipairs( moedas ) do
		if checaMoedaAgua( moeda.y, imgMoeda:getHeight(), agua.posicY, imgAgua:getHeight() ) then
			--[[ ***************************** PAROU AQUI ***************************** ]]--
			if moeda.y >= agua.posicY + imgMoeda:getHeight()/10 and moeda.y < agua.posicY + imgMoeda:getHeight()/5 then
			    estrelaAgua:stop()
				estrelaAgua:play()
			end
			
			moeda.y = moeda.y + ( 40 * dt ) -- aumenta em 30 unidade a velocidade de descida após contato com a água
			moeda.x = moeda.x + ( 15 * dt )	-- diminue em 15 unidades a velocidade horizontal de deslocamento após contato com a água
		end
	end
	-- COLISÃO MOEDA X ÁGUA --
end

function checaColisaoMoeda( x1, y1, w1, h1, x2, y2, w2, h2 )
	return x1 < x2 + w2/10 and x2 < x1 + w1/5 and y1 < y2 + h2/10 and y2 < y1 + h1/5
end

function checaMoedaAgua( y1, h1, y2, h2 )
	return y1 > y2 + h1/10 or y2 < y1 + h1/10
end
-- Colisão com Moedas