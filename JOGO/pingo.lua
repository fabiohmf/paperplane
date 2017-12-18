-- Pingo
delayPingo = 0.5
tempoCriarPingo = delayPingo
imgPingo = love.graphics.newImage( "imagem/pingo.png" )
pingos = {}
aguaBaixo = 1
encheu = 0
velocidadeCriarPingo = 0.5
-- Pingo
-- Criar Pingo
function pingo( dt )
	if pontos >= 15  then
		if aguaBaixo == 1 then
		tempoCriarPingo = tempoCriarPingo - ( velocidadeCriarPingo * dt )
		if tempoCriarPingo < 0 then
			tempoCriarPingo = 2*delayPingo
			numeroAleatorio = math.random( 10, larguraTela )
			novoPingo = { x = numeroAleatorio, y = -50, img = imgPingo } -- larguraTela
			table.insert( pingos, novoPingo )

		end
		end		
	end
	-- Remover Pingo da Tabela	
	for i, pingo in ipairs( pingos ) do
		pingo.x = pingo.x - ( 40 * dt ) -- velocidade de deslocamento do pingo
		pingo.y = pingo.y + ( 100 * dt )
		if pingo.x < -250 or pingo.y > alturaTela  then
			table.remove( pingos, i )
		end
		if checaPingoAVIAO( pingo.x, pingo.y, imgPingo:getWidth(), imgPingo:getHeight(), plane.posX, plane.posY, imgPlane:getWidth(), imgPlane:getHeight() ) then
			table.remove( pingos, i )
			tocou = true
			atingiu = 1
			alerta:stop()
			alerta:play()
		end
	end
	-- Remover Pingo da Tabela	
	
	
		
end
-- Criar Estrela



-- Colisão com PINGO
function colisaopingo( dt )
	
	-- COLISÃO PINGO X ÁGUA --
	for i, pingo in ipairs( pingos ) do
		if checaPingoAgua( pingo.y, imgPingo:getHeight(), agua.posicY, imgAgua:getHeight()) then
			table.remove( pingos, i )
			pingoAgua:stop()
			pingoAgua:play()
			encheu = 1
		end
	end
	-- COLISÃO PINGO X ÁGUA --
	
--- Colisão com o Avião
		
		
end
	
	
-- Remover Pingo da Tabela	
	function checaPingoAVIAO( x1, y1, w1, h1, x2, y2, w2, h2 )
		return x1 < x2 + w2/16 and x2 < x1 + w1/10 and y1 < y2 + h1/16 and y2 < y1 + h1/16
	end
	
	function checaPingoAgua( y1, h1, y2, h2 )
		return y1 > y2 + h1/2 or y2 < y1 + h1/16
	end
	-- Colisão com PINGO
		