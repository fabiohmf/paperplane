require( "plane" ) -- Chama as funções do Avião de P
-- Mar
larguraTela = love.graphics.getWidth()

	-- POSIÇÃO DA MARCA DA ÁGUA --
	imgAgua = love.graphics.newImage("imagem/mar.png")
	imgAguaDois = love.graphics.newImage("imagem/mar2.png")

	VAR = 1 + (larguraTela - imgAgua:getWidth())/imgAgua:getWidth() -- VARIAÇÃO DE AUMENTO DA LARGURA DA IMAGEM X TELA
	
	agua = {
		posicX = 0,
		posicX2 = 0 + imgAgua:getWidth() * VAR,
		posicY = 590,
		sobe = 0,
		vel = 10
	}
-- Mar

-- Movimentar Água
function movAgua ( dt )
	agua.vel = 30
	if love.keyboard.isDown( "right" ) then
		agua.vel = agua.vel + plane.velocidade / 5 -- diminue a velocidade em 50 unidades para trás
	end
	
	if love.keyboard.isDown( "left") then
		agua.vel = agua.vel - plane.velocidade / 30 -- diminue a velocidade em 50 unidades para trás
	end
	
	-- Movimento no eixo X
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
	-- Movimento no eixo X
	
	-- Movimento no eixo Y
		if agua.posicY >= 450 then
			agua.sobe = 1
			aguaBaixo = 1
			delayMoeda = 0.042
		end
		if agua.posicY <= 200 then
			aguaBaixo = 0
			agua.sobe = 0
			delayMoeda = 1
		end
		if agua.sobe == 1 and pontos >= 40 then -- condicao para agua descer subir
			agua.posicY = agua.posicY - dt * 2.5
		else		
			if agua.sobe == 0 and encheu == 1 then -- condicao para agua descer 
				agua.posicY = agua.posicY + dt * 2.5
			end
		end
	-- Movimento no eixo Y
	
end
-- Movimentar Água
