
addEvent("devs_Assobio", true) -- Cria um evento custom nomeado > AssobiarRds
addEventHandler("devs_Assobio", root, -- Adiciona o evento AssobiarRds a função!
    function(cx, cy, cz)
        local Som = playSound3D('sfx/assobiar.mp3', cx, cy, cz) -- define uma variavel (Som) e cria um som 3D
        setSoundMaxDistance(Som, 95) -- define a distância da variavel!
        setSoundSpeed(Som, 1.4) -- define a velocidade da variavel!
    end -- End da Função!
)