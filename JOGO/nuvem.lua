-- Nuvens
delayNuvem = 7
tempoCriarNuvem = delayNuvem
imgNuvem = love.graphics.newImage( "imagem/nuvem.png" )
nuvens = {}
velocidadeNuvem  = 180
tocou = false
atingiu = 0
-- Nuvens

-- Criar Nuvens
function nuvem( dt )
	if life <= 4 then
		tempoCriarNuvem = tempoCriarNuvem - ( 1 * dt )
		if tempoCriarNuvem < 0 then
			tempoCriarNuvem = delayNuvem
			numeroAleatorio = math.random( 10, agua.posicY - ( ( imgNuvem:getHeight() / 10 ) + 50 ) )  --( ( imgNuvem:getHeight() / 5 ) + 50 ) )
			
			if (numeroAleatorio > plane.posY + imgNuvem:getHeight() / 2) or (numeroAleatorio < plane.posY - imgNuvem:getHeight() / 2)  then
				novaNuvem = { x = larguraTela + 100, y = numeroAleatorio, img = imgNuvem }
				table.insert( nuvens, novaNuvem )
			end
		end
	end

-- Remover Nuvem da Tabela	
	for i, nuvem in ipairs( nuvens ) do
		nuvem.x = nuvem.x - ( velocidadeNuvem * dt ) -- velocidade de deslocamento da nuvem
		if nuvem.x < -250 then
			table.remove( nuvens, i )
		end
		
		if nuvem.y > agua.posicY - imgNuvem:getWidth()/6 then
			table.remove( nuvens, i )
		end
		
-- Colisão com o Avião
		if checaColisaoNuvem( nuvem.x, nuvem.y, imgNuvem:getWidth(), imgNuvem:getHeight(), plane.posX, plane.posY, imgPlane:getWidth(), imgPlane:getHeight() ) then
			table.remove( nuvens, i )
			life = life + 1
		end
		
	end
	
	function checaColisaoNuvem( x1, y1, w1, h1, x2, y2, w2, h2 )
		return x1 < x2 + w2/5 and x2 < x1 + w1/5 and y1 < y2 + h1/2 and y2 < y1 + h1/2
	end
-- Remover Nuvem da Tabela		
end
-- Criar Nuvens