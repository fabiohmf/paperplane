-- Mar
larguraTela = love.graphics.getWidth() -- LARGURA DA TELA

	-- POSIÇÃO DA MARCA DA ÁGUA --
	imgAgua = love.graphics.newImage("imagem/mar.png")
	imgAguaDois = love.graphics.newImage("imagem/mar2.png")

	VAR = 1 + (larguraTela - imgAgua:getWidth())/imgAgua:getWidth() -- VARIAÇÃO DE AUMENTO DA LARGURA DA IMAGEM X TELA
	
	agua = {
		posicX = 0,
		posicX2 = 0 + imgAgua:getWidth() * VAR, 
		posicY = 590, -- posição inicial da água em relação ao eixo vertical
		sobe = 2, -- controlador de subida da água  (0 - desce; 1- sobe; 2 - fica parada)
		vel = 50 -- velocidade natural da água
	}
-- Mar

-- Movimentar Água
function movAgua ( dt )

	agua.vel = 30

	if love.keyboard.isDown( "right" ) then
		
		agua.vel = agua.vel + plane.velocidade / 5 -- aumenta a velocidade da água em relação ao observador em 60 unidades para trás (vel -> 110)
	
	end
	
	if love.keyboard.isDown( "left") then
		
		agua.vel = agua.vel - plane.velocidade / 30 -- diminue da água em relação ao observador em 10 unidades para trás (vel -> 40)
	
	end
	
	-- Movimento no eixo X das imagens da água
		agua.posicX = agua.posicX - agua.vel * dt
		agua.posicX2 = agua.posicX2 - agua.vel * dt
		
		if agua.posicX < 0 - imgAguaDois:getWidth()*VAR then
			agua.posicX = agua.posicX2 + imgAguaDois:getWidth()*VAR
		end
		if agua.posicX2 < 0 - imgAgua:getWidth()*VAR then
			agua.posicX2 = agua.posicX + imgAgua:getWidth()*VAR
		end
		
		if agua.posicX > imgAguaDois:getWidth()*VAR then
			agua.posicX = 0 - imgAguaDois:getWidth()*VAR
		end
		if agua.posicX2 > imgAgua:getWidth()*VAR then
			agua.posicX2 = 0 - imgAgua:getWidth()*VAR
		end
	-- Movimento no eixo X das imagens da água
	
	-- Movimento no eixo Y das imagens da água
		if agua.posicY >= 595 then
			agua.sobe = 1	
		end
		
		if agua.posicY <= 200 then
			agua.sobe = 0	
		end
			
		if agua.sobe == 1 then
			agua.posicY = agua.posicY - dt * 10.5
		else		
			if agua.sobe == 0 then
				agua.posicY = agua.posicY + dt * 10.5
			end
		end
	-- Movimento no eixo Y das imagens da água
	
end
-- Movimentar Água
