require( "config" )
require( "plane" ) -- Chama as funções do Avião de Papel no jogo
require( "agua") -- Chama as funções da ÁGUA no jogo
require( "nuvem") -- Chama as funções da NUVEM no jogo
require( "estrela" ) -- Chama as funções da ESTRELA no jogo
require( "pingo" ) -- Chama as funções do PINGO no jogo


function criaAviao()
	rot = angulo
	love.graphics.draw( imgPlane, plane.posX, plane.posY, rot, 0.5, 0.5, imgPlane:getWidth() / 2, imgPlane:getHeight() / 1.5 )
	altitudeAv = math.floor(agua.posicY - plane.posY)
end

function criaEstrela()
	for i, moeda in ipairs( moedas ) do
		love.graphics.draw( moeda.img, moeda.x, moeda.y, 0, 0.15, 0.15 )
	end
end

function criaPingo()
    for i, pingo in ipairs( pingos ) do
		love.graphics.draw( pingo.img, pingo.x, pingo.y, 0, 0.08, 0.08 )
	end
end

function criaNuvens()
	for i, nuvem in ipairs( nuvens ) do
		love.graphics.draw( nuvem.img, nuvem.x, nuvem.y, 0, 0.5, 0.5 )
	end
end

function criaBackground()
	-- Background
	if k == 0 then
		love.graphics.draw( fundo, planoDeFundo.x, planoDeFundo.y, 0, FX, 1 )
		love.graphics.draw( fundoDois, planoDeFundo.x2, planoDeFundo.y, 0, FX, 1 )
	end
	if k > 0 and k < 3 then
		love.graphics.draw( colidiu, colidiu.x, colidiu.y, 0, FX, 1 )
		love.graphics.draw( colidiu, planoDeFundo.x2, planoDeFundo.y, 0, FX, 1 )
	end
	-- Background
	
	-- Imagem da água
	AX = 1 + (larguraTela - imgAgua:getWidth())/imgAgua:getWidth() -- VARIAÇÃO DA LARGURA DE TELA
	AY = 1 + (alturaTela - imgAgua:getHeight() - 200)/imgAgua:getHeight() -- VARIAÇÃO DA ALTURA DE TELA
			
	love.graphics.draw(imgAgua, agua.posicX, agua.posicY, 0, AX, AY )
	love.graphics.draw(imgAguaDois, agua.posicX2, agua.posicY, 0, AX, AY )
	-- Imagem da água
end

function criaSombraAviao()
	if plane.posY < agua.posicY then		
			if plane.posY < agua.posicY - 60 then
				love.graphics.draw( imgSombra, sombra.posX, sombra.posY, 0, 0.5, 0.5, imgSombra:getWidth() / 2, imgSombra:getHeight() / 1.5 )	
			else
				scale = 0.05 - (plane.posY - agua.posicY)/100
				posiSombra = sombra.posY - (60 - (agua.posicY - plane.posY))
				love.graphics.draw( imgSombra, sombra.posX, posiSombra, 0, scale, scale, imgSombra:getWidth() / 2, imgSombra:getHeight() / 1.5 )	
			end
	end
end

function criaPontos()
	--Centraliza a pontuaçao apresentada
		if pontos < 10 then
				love.graphics.print(pontos, larguraTela/2, 30, 0, 2, 2)
			elseif pontos >= 10 and pontos < 100 then
				love.graphics.print(pontos, larguraTela/2 - 7, 30, 0, 2, 2)
			elseif pontos > 100 and pontos < 1000 then
				love.graphics.print(pontos, larguraTela/2 - 15, 30, 0, 2, 2)
			else
				love.graphics.print(pontos, larguraTela/2 - 25, 30, 0, 2, 2)
			end
	 --Centraliza a pontuaçao apresentada
		love.graphics.setFont( fonte )
		love.graphics.setColor( 255, 100, 0, 255) -- MUDA A COR DA FONTE (VERMELHO)
		
		love.graphics.print(altitudeAv, 175, 10, 0, 1.5, 1.5)
		
		love.graphics.setColor( 0, 255, 255, 255) -- MUDA A COR DA FONTE (AZUL)
		love.graphics.print("ESTRELA", larguraTela/2 - 50, 2, 0, 2, 2)				
		
		love.graphics.setColor( 0, 155, 255, 255) -- MUDA A COR DA FONTE (AZUL)
		love.graphics.print("ALTITUDE: ", 50, 10, 0, 1.5, 1.5)
		if setaBaixo == 0 and setaDireita == 0 and setaEsquerda == 0 then
			love.graphics.draw( imgBotao, imgAgua:getWidth()/2.5 ,imgAgua:getHeight()/2, 0, 0.8 ) -- Imagem dos botoes
		end
end

function mostrarNaTelaGameOver()
	love.graphics.setColor( 255, 255, 255, transparencia )
	love.graphics.draw( imgGameOver, 100, 0 )
	love.graphics.setFont( fonteDois )
	love.graphics.print("PONTOS TOTAIS: " .. pontos, larguraTela / 6, 20 )
	love.graphics.print("RECORDE DE PONTOS: " .. recordes, larguraTela / 7, 60 )
end

function criaAlerta()
	if agua.posicY - plane.posY <= 40 then
			love.graphics.setColor( 255, 0, 0, 255) -- MUDA A COR DA FONTE
			love.graphics.print("( DANGER )", 50, 30, 0, 1.5, 1.5)
	end
	if life <= 0 then
		love.graphics.setColor( 255, 0, 0, 255) -- MUDA A COR DA FONTE
		love.graphics.print("(PERIGO!)", larguraTela/2 - 60, 60, 0, 1.7, 1.7)
	elseif life == 1 then
		love.graphics.setColor(  0, 155, 255, 255) -- MUDA A COR DA FONTE
		love.graphics.print("(CUIDADO!)", larguraTela/2 - 60, 60, 0, 1.7, 1.7)
	end
end

function criaLife()
	love.graphics.setColor( 255, 255, 255, 255)	-- RETORNA A COLORAÇÃO BRANCA SEM ALTERAR OS GRÁFICOS DO JOGO
	tam = 0.29
	if life <= 0 then					
		love.graphics.draw( lifeRed, larguraTela - 170, 20, 0, tam, tam )
		love.graphics.draw( lifeRed, larguraTela - 150, 20, 0, tam, tam )
		love.graphics.draw( lifeRed, larguraTela - 120, 20, 0, tam, tam )
		love.graphics.draw( lifeRed, larguraTela - 90, 20, 0, tam, tam )
		love.graphics.draw( lifeRed, larguraTela - 60, 20, 0, tam, tam )
	elseif life == 1 then					
		love.graphics.draw( lifeBlue, larguraTela - 170, 20, 0, tam, tam )
		love.graphics.draw( lifeRed, larguraTela - 140, 20, 0, tam, tam )
		love.graphics.draw( lifeRed, larguraTela - 110, 20, 0, tam, tam )
		love.graphics.draw( lifeRed, larguraTela - 80, 20, 0, tam, tam )
		love.graphics.draw( lifeRed, larguraTela - 50, 20, 0, tam, tam )
	elseif life == 2 then
		love.graphics.draw( lifeBlue, larguraTela - 170, 20, 0, tam, tam )
		love.graphics.draw( lifeBlue, larguraTela - 140, 20, 0, tam, tam )
		love.graphics.draw( lifeRed, larguraTela - 110, 20, 0, tam, tam )
		love.graphics.draw( lifeRed, larguraTela - 80, 20, 0, tam, tam )
		love.graphics.draw( lifeRed, larguraTela - 50, 20, 0, tam, tam )
	elseif life == 3 then
		love.graphics.draw( lifeBlue, larguraTela - 170, 20, 0, tam, tam )
		love.graphics.draw( lifeBlue, larguraTela - 140, 20, 0, tam, tam )
		love.graphics.draw( lifeBlue, larguraTela - 110, 20, 0, tam, tam )
		love.graphics.draw( lifeRed, larguraTela - 80, 20, 0, tam, tam )
		love.graphics.draw( lifeRed, larguraTela - 50, 20, 0, tam, tam )
	elseif life == 4 then
		love.graphics.draw( lifeBlue, larguraTela - 170, 20, 0, tam, tam )
		love.graphics.draw( lifeBlue, larguraTela - 140, 20, 0, tam, tam )
		love.graphics.draw( lifeBlue, larguraTela - 110, 20, 0, tam, tam )
		love.graphics.draw( lifeBlue, larguraTela - 80, 20, 0, tam, tam )
		love.graphics.draw( lifeRed, larguraTela - 50, 20, 0, tam, tam )
	elseif life == 5 then
		love.graphics.draw( lifeBlue, larguraTela - 170, 20, 0, tam, tam )
		love.graphics.draw( lifeBlue, larguraTela - 140, 20, 0, tam, tam )
		love.graphics.draw( lifeBlue, larguraTela - 110, 20, 0, tam, tam )
		love.graphics.draw( lifeBlue, larguraTela - 80, 20, 0, tam, tam )
		love.graphics.draw( lifeBlue, larguraTela - 50, 20, 0, tam, tam )
	end
end

function criaTelaInicial()
CX = 1 + (larguraTela - telaTitulo:getWidth())/telaTitulo:getWidth() -- VARIAÇÃO DA LARGURA DE TELA
		CY = 1 + (alturaTela - telaTitulo:getHeight())/telaTitulo:getHeight() -- VARIAÇÃO DA ALTURA DE TELA
		love.graphics.draw( telaTitulo, inOutX, inOutY, 0, CX, CY )
end



