-- Pingo
delayPingo = 0.5
tempoCriarPingo = delayPingo
imgPingo = love.graphics.newImage( "imagem/pingo.png" )
pingos = {}
-- Pingo
-- Criar Pingo
function pingo( dt )

	tempoCriarPingo = tempoCriarPingo - ( 0.5 * dt )
	if tempoCriarPingo < 0 then
		tempoCriarPingo = 2*delayPingo
		numeroAleatorio = math.random( 10, larguraTela )
		novoPingo = { x = numeroAleatorio, y = -50, img = imgPingo } -- larguraTela
		table.insert( pingos, novoPingo )

	end	

	-- Remover Pingo da Tabela	
	for i, pingo in ipairs( pingos ) do
		pingo.x = pingo.x - ( 40 * dt ) -- velocidade de deslocamento da estrela
		pingo.y = pingo.y + ( 70 * dt )
		if pingo.x < -250 or pingo.y > alturaTela  then
			table.remove( pingos, i )
		end
	end
	-- Remover Moeda da Tabela	
		
end
-- Criar Estrela



-- Colisão com Estrelas
function colisaopingo( dt )
	
	-- COLISÃO PINGO X ÁGUA --
	for i, pingo in ipairs( pingos ) do
		if checaPingoAgua( pingo.y, imgPingo:getHeight(), agua.posicY, imgAgua:getHeight()) then
			table.remove( pingos, i )
			pingoAgua:stop()
			pingoAgua:play()
			
		end
	end
	-- COLISÃO PINGO X ÁGUA --

	function checaPingoAgua( y1, h1, y2, h2 )
		return y1 > y2 + h1/20 or y2 < y1 + h1/20
	end
	-- Colisão com Estrelas
		
	
	
end
	

	
	
	
--[[	
	-- COLISÃO ESTRELA X ÁGUA --
	for i, moeda in ipairs( moedas ) do
		if checaMoedaAgua( moeda.y, imgMoeda:getHeight(), agua.posicY, imgAgua:getHeight() ) then
			
			if moeda.y >= agua.posicY + imgMoeda:getHeight()/10 and moeda.y < agua.posicY + imgMoeda:getHeight()/5 then
				-- estrelaAgua:stop()
				estrelaAgua:play()
			end
			
			moeda.y = moeda.y + ( 40 * dt ) -- aumenta em 30 unidade a velocidade de descida após contato com a água
			moeda.x = moeda.x + ( 15 * dt )	-- diminue em 15 unidades a velocidade horizontal de deslocamento após contato com a água
		
		end
	end
	-- COLISÃO ESTRELA X ÁGUA --
	
end

function checaColisaoMoeda( x1, y1, w1, h1, x2, y2, w2, h2 )
	return x1 < x2 + w2/10 and x2 < x1 + w1/5 and y1 < y2 + h2/10 and y2 < y1 + h1/5
end

function checaPingoAgua( y1, h1, y2, h2 )
	return y1 > y2 + h1/10 or y2 < y1 + h1/10
end
-- Colisão com Estrelas

]]--